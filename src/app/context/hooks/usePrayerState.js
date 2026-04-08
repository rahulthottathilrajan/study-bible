"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { supabase } from "../../../lib/supabase";

export function usePrayerState({
  user,
  view,
  prayerTab,
  verseIdMap,
  book,
  chapter,
  verse,
}) {
  const [prayerModal, setPrayerModal] = useState(false);
  const [prayers, setPrayers] = useState([]);
  const [prayerTitle, setPrayerTitle] = useState("");
  const [prayerText, setPrayerText] = useState("");
  const [prayerLoading, setPrayerLoading] = useState(false);
  const [communityPrayers, setCommunityPrayers] = useState([]);
  const [communityPrayersLoading, setCommunityPrayersLoading] = useState(false);
  const [communityPrayerCategory, setCommunityPrayerCategory] = useState("all");
  const [userReactions, setUserReactions] = useState({});
  const [expiringPrayers, setExpiringPrayers] = useState([]);
  const [reportTarget, setReportTarget] = useState(null);
  const [cooldownActive, setCooldownActive] = useState(false);
  const [justAnsweredId, setJustAnsweredId] = useState(null);
  const [prayerStreak, setPrayerStreak] = useState(() => {
    try {
      const streak = parseInt(localStorage.getItem("prayerStreakCount") || "0", 10);
      const lastDate = localStorage.getItem("prayerStreakLastDate");
      const today = new Date().toISOString().slice(0, 10);
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
      if (lastDate && lastDate !== today && lastDate !== yesterday) return 0;
      return streak;
    } catch {
      return 0;
    }
  });
  const [slotCoverage, setSlotCoverage] = useState([]);
  const [mySlots, setMySlots] = useState([]);
  const [slotsLoading, setSlotsLoading] = useState(false);
  const [birthdayUsers, setBirthdayUsers] = useState([]);
  const [prayerDaySeed] = useState(() => Date.now());
  const lastPrayerSubmitRef = useRef(0);

  const loadPrayers = useCallback(async () => {
    if (!user) return;
    setPrayerLoading(true);
    const { data } = await supabase.from("prayer_journal").select("*").eq("user_id", user.id).order("created_at", { ascending: false });
    setPrayers(data || []);
    setPrayerLoading(false);
  }, [user]);

  useEffect(() => {
    if (!prayerModal || !user) return;
    let cancelled = false;
    Promise.resolve().then(() => {
      if (!cancelled) loadPrayers();
    });
    return () => {
      cancelled = true;
    };
  }, [prayerModal, user, loadPrayers]);

  useEffect(() => {
    if ((view !== "account" && view !== "prayer-home") || !user) return;
    let cancelled = false;
    Promise.resolve().then(() => {
      if (!cancelled) loadPrayers();
    });
    return () => {
      cancelled = true;
    };
  }, [view, user, loadPrayers]);

  const addPrayer = useCallback(async () => {
    if (!user || !prayerText.trim()) return;
    const title = (prayerTitle || "Prayer").slice(0, 200);
    const text = prayerText.slice(0, 2000);
    const now = Date.now();
    if (now - lastPrayerSubmitRef.current < 30000) {
      setCooldownActive(true);
      return;
    }
    lastPrayerSubmitRef.current = now;
    const entry = {
      user_id: user.id,
      title,
      prayer_text: text,
      verse_id: verseIdMap.current[verse] || null,
      book_name: book || null,
      chapter_number: chapter || null,
      verse_number: verse || null,
    };
    await supabase.from("prayer_journal").insert(entry);
    setPrayerTitle("");
    setPrayerText("");
    loadPrayers();
  }, [book, chapter, loadPrayers, prayerText, prayerTitle, user, verse, verseIdMap]);

  const togglePrayerAnswered = useCallback(async (id, current) => {
    await supabase.from("prayer_journal").update({ is_answered: !current }).eq("id", id);
    loadPrayers();
  }, [loadPrayers]);

  const deletePrayer = useCallback(async (id) => {
    await supabase.from("prayer_journal").delete().eq("id", id);
    loadPrayers();
  }, [loadPrayers]);

  const loadCommunityPrayers = useCallback(async () => {
    setCommunityPrayersLoading(true);
    let query = supabase.from("community_prayers_public").select("*").order("created_at", { ascending: false }).limit(50);
    if (communityPrayerCategory !== "all") query = query.eq("category", communityPrayerCategory);
    const { data } = await query;
    if (!data) {
      setCommunityPrayers([]);
      setCommunityPrayersLoading(false);
      return;
    }

    const userIds = [...new Set(data.filter((prayer) => !prayer.is_anonymous).map((prayer) => prayer.user_id))];
    let nameMap = {};
    if (userIds.length > 0) {
      const { data: profiles } = await supabase.from("user_profiles").select("id, display_name").in("id", userIds);
      if (profiles) profiles.forEach((profile) => { nameMap[profile.id] = profile.display_name; });
    }

    const prayerIds = data.map((prayer) => prayer.id);
    let reactionMap = {};
    if (prayerIds.length > 0) {
      const { data: reactions } = await supabase.from("prayer_reactions").select("prayer_id, reaction_type").in("prayer_id", prayerIds);
      if (reactions) {
        reactions.forEach((reaction) => {
          if (!reactionMap[reaction.prayer_id]) reactionMap[reaction.prayer_id] = { praying: 0, heart: 0, amen: 0 };
          reactionMap[reaction.prayer_id][reaction.reaction_type]++;
        });
      }
    }

    let myReactionMap = {};
    if (user && prayerIds.length > 0) {
      const { data: myReactions } = await supabase
        .from("prayer_reactions")
        .select("prayer_id, reaction_type")
        .eq("user_id", user.id)
        .in("prayer_id", prayerIds);
      if (myReactions) {
        myReactions.forEach((reaction) => {
          if (!myReactionMap[reaction.prayer_id]) myReactionMap[reaction.prayer_id] = {};
          myReactionMap[reaction.prayer_id][reaction.reaction_type] = true;
        });
      }
    }
    setUserReactions(myReactionMap);

    setCommunityPrayers(data.map((prayer) => ({
      ...prayer,
      user_display_name: nameMap[prayer.user_id] || null,
      reaction_counts: reactionMap[prayer.id] || { praying: 0, heart: 0, amen: 0 },
    })));
    setCommunityPrayersLoading(false);
  }, [communityPrayerCategory, user]);

  useEffect(() => {
    if (view !== "prayer-home") return;
    let cancelled = false;
    Promise.resolve().then(() => {
      if (!cancelled) loadCommunityPrayers();
    });
    return () => {
      cancelled = true;
    };
  }, [view, loadCommunityPrayers]);

  const addCommunityPrayer = useCallback(async ({ title, body, category, isAnonymous }) => {
    if (!user || !body.trim()) return;
    const safeTitle = (title || "Prayer Request").slice(0, 200);
    const safeBody = body.slice(0, 2000);
    const now = Date.now();
    if (now - lastPrayerSubmitRef.current < 30000) {
      setCooldownActive(true);
      return;
    }
    lastPrayerSubmitRef.current = now;
    await supabase.from("community_prayers").insert({
      user_id: user.id,
      title: safeTitle,
      body: safeBody,
      category,
      is_anonymous: isAnonymous,
    });
    setCooldownActive(false);
    loadCommunityPrayers();
  }, [loadCommunityPrayers, user]);

  const reportCommunityPrayer = useCallback(async (prayerId, reason, details) => {
    if (!user) return;
    await supabase.from("prayer_reports").insert({
      prayer_id: prayerId,
      reporter_id: user.id,
      reason,
      details: details ? details.slice(0, 500) : null,
    });
  }, [user]);

  const deleteCommunityPrayer = useCallback(async (id) => {
    await supabase.from("community_prayers").delete().eq("id", id);
    loadCommunityPrayers();
  }, [loadCommunityPrayers]);

  const markCommunityPrayerAnswered = useCallback(async (id) => {
    await supabase.from("community_prayers").update({
      is_answered: true,
      answered_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    }).eq("id", id);
    setJustAnsweredId(id);
    setTimeout(() => setJustAnsweredId(null), 3000);
    loadCommunityPrayers();
  }, [loadCommunityPrayers]);

  const checkPrayerExpiry = useCallback(async () => {
    if (!user) return;
    const now = new Date().toISOString();
    const { data: expired } = await supabase.from("community_prayers")
      .select("*")
      .eq("user_id", user.id)
      .eq("is_answered", false)
      .lt("expires_at", now)
      .eq("expiry_prompted", false);
    if (expired && expired.length > 0) {
      setExpiringPrayers(expired);
      const ids = expired.map((prayer) => prayer.id);
      await supabase.from("community_prayers").update({
        expiry_prompted: true,
        expiry_prompted_at: now,
        updated_at: now,
      }).in("id", ids);
    }
    const cutoff = new Date(Date.now() - 48 * 60 * 60 * 1000).toISOString();
    await supabase.from("community_prayers").delete()
      .eq("user_id", user.id)
      .eq("is_answered", false)
      .eq("expiry_prompted", true)
      .lt("expiry_prompted_at", cutoff);
  }, [user]);

  useEffect(() => {
    if (view !== "prayer-home" || !user) return;
    let cancelled = false;
    Promise.resolve().then(() => {
      if (!cancelled) checkPrayerExpiry();
    });
    return () => {
      cancelled = true;
    };
  }, [view, user, checkPrayerExpiry]);

  const keepCommunityPrayer = useCallback(async (id) => {
    const newExpiry = new Date(Date.now() + 60 * 24 * 60 * 60 * 1000).toISOString();
    await supabase.from("community_prayers").update({
      expires_at: newExpiry,
      expiry_prompted: false,
      expiry_prompted_at: null,
      updated_at: new Date().toISOString(),
    }).eq("id", id);
    setExpiringPrayers((prev) => prev.filter((prayer) => prayer.id !== id));
    loadCommunityPrayers();
  }, [loadCommunityPrayers]);

  const loadBirthdayUsers = useCallback(async () => {
    try {
      const today = new Date();
      const mmdd = `-${String(today.getMonth() + 1).padStart(2, "0")}-${String(today.getDate()).padStart(2, "0")}`;
      const { data } = await supabase
        .from("user_profiles")
        .select("id, display_name, nickname, full_name")
        .eq("share_birthday", true)
        .filter("date_of_birth::text", "like", `%${mmdd}`);
      setBirthdayUsers(data || []);
    } catch {
      setBirthdayUsers([]);
    }
  }, []);

  useEffect(() => {
    if (view !== "prayer-home" || !user) return;
    let cancelled = false;
    Promise.resolve().then(() => {
      if (!cancelled) loadBirthdayUsers();
    });
    return () => {
      cancelled = true;
    };
  }, [view, user, loadBirthdayUsers]);

  const recordPrayerActivity = useCallback(() => {
    try {
      const today = new Date().toISOString().slice(0, 10);
      const lastDate = localStorage.getItem("prayerStreakLastDate");
      let streak = parseInt(localStorage.getItem("prayerStreakCount") || "0", 10);
      if (lastDate === today) return;
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
      streak = lastDate === yesterday ? streak + 1 : 1;
      localStorage.setItem("prayerStreakCount", String(streak));
      localStorage.setItem("prayerStreakLastDate", today);
      setPrayerStreak(streak);
    } catch {}
  }, []);

  const toggleReaction = useCallback(async (prayerId, reactionType) => {
    if (!user) return;
    const existing = userReactions[prayerId]?.[reactionType];
    if (existing) {
      await supabase.from("prayer_reactions").delete().eq("prayer_id", prayerId).eq("user_id", user.id).eq("reaction_type", reactionType);
    } else {
      await supabase.from("prayer_reactions").insert({ prayer_id: prayerId, user_id: user.id, reaction_type: reactionType });
    }
    setUserReactions((prev) => {
      const updated = { ...prev };
      if (!updated[prayerId]) updated[prayerId] = {};
      if (existing) delete updated[prayerId][reactionType];
      else updated[prayerId][reactionType] = true;
      return updated;
    });
    setCommunityPrayers((prev) => prev.map((prayer) => {
      if (prayer.id !== prayerId) return prayer;
      const counts = { ...prayer.reaction_counts };
      counts[reactionType] = (counts[reactionType] || 0) + (existing ? -1 : 1);
      return { ...prayer, reaction_counts: counts };
    }));
    if (!existing) recordPrayerActivity();
  }, [recordPrayerActivity, user, userReactions]);

  const prayerOfTheDay = useMemo(() => {
    if (!communityPrayers || communityPrayers.length === 0) return null;
    const active = communityPrayers.filter((prayer) => !prayer.is_answered);
    if (active.length === 0) return null;
    const now = prayerDaySeed;
    const scored = active.map((prayer) => {
      const counts = prayer.reaction_counts || { praying: 0, heart: 0, amen: 0 };
      const daysOld = Math.floor((now - new Date(prayer.created_at).getTime()) / 86400000);
      const score = (counts.praying * 3) + (counts.heart * 2) + counts.amen + Math.max(0, 7 - daysOld);
      return { ...prayer, score };
    }).sort((a, b) => b.score - a.score).slice(0, 5);
    const dayOfYear = Math.floor((now - new Date(new Date().getFullYear(), 0, 0)) / 86400000);
    return scored[dayOfYear % scored.length] || scored[0];
  }, [communityPrayers, prayerDaySeed]);

  const loadSlotCoverage = useCallback(async () => {
    const dayOfWeek = new Date().getDay();
    const { data } = await supabase.rpc("get_prayer_coverage", { target_day: dayOfWeek });
    setSlotCoverage(data || []);
  }, []);

  const loadMySlots = useCallback(async () => {
    if (!user) return;
    setSlotsLoading(true);
    const { data } = await supabase.from("prayer_slots").select("*").eq("user_id", user.id).eq("is_active", true).order("slot_hour");
    setMySlots(data || []);
    setSlotsLoading(false);
  }, [user]);

  useEffect(() => {
    if (view !== "prayer-home" || prayerTab !== "clock") return;
    let cancelled = false;
    Promise.resolve().then(async () => {
      if (cancelled) return;
      await loadSlotCoverage();
      if (!cancelled && user) await loadMySlots();
    });
    return () => {
      cancelled = true;
    };
  }, [view, prayerTab, user, loadSlotCoverage, loadMySlots]);

  const addPrayerSlot = useCallback(async ({ hour, minute, duration, frequency, customDays }) => {
    if (!user) return;
    const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    await supabase.from("prayer_slots").insert({
      user_id: user.id,
      slot_hour: hour,
      slot_minute: minute,
      duration_minutes: duration,
      frequency,
      custom_days: customDays || [],
      timezone,
    });
    loadMySlots();
    loadSlotCoverage();
  }, [loadMySlots, loadSlotCoverage, user]);

  const deletePrayerSlot = useCallback(async (id) => {
    await supabase.from("prayer_slots").delete().eq("id", id);
    loadMySlots();
    loadSlotCoverage();
  }, [loadMySlots, loadSlotCoverage]);

  return {
    prayerModal,
    setPrayerModal,
    prayers,
    prayerTitle,
    setPrayerTitle,
    prayerText,
    setPrayerText,
    prayerLoading,
    loadPrayers,
    addPrayer,
    togglePrayerAnswered,
    deletePrayer,
    communityPrayers,
    communityPrayersLoading,
    communityPrayerCategory,
    setCommunityPrayerCategory,
    loadCommunityPrayers,
    addCommunityPrayer,
    deleteCommunityPrayer,
    markCommunityPrayerAnswered,
    userReactions,
    toggleReaction,
    expiringPrayers,
    keepCommunityPrayer,
    reportCommunityPrayer,
    reportTarget,
    setReportTarget,
    cooldownActive,
    justAnsweredId,
    prayerStreak,
    prayerOfTheDay,
    recordPrayerActivity,
    slotCoverage,
    mySlots,
    slotsLoading,
    loadSlotCoverage,
    loadMySlots,
    addPrayerSlot,
    deletePrayerSlot,
    birthdayUsers,
  };
}
