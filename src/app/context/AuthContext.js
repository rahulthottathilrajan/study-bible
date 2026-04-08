"use client";

import { createContext, useCallback, useContext, useEffect, useMemo, useState } from "react";
import { supabase } from "../../lib/supabase";

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [authMode, setAuthMode] = useState("login");
  const [authEmail, setAuthEmail] = useState("");
  const [authPass, setAuthPass] = useState("");
  const [authName, setAuthName] = useState("");
  const [authError, setAuthError] = useState("");
  const [authLoading, setAuthLoading] = useState(false);
  const [authShowPass, setAuthShowPass] = useState(false);
  const [authForgot, setAuthForgot] = useState(false);
  const [authForgotSent, setAuthForgotSent] = useState(false);
  const [profile, setProfile] = useState(null);
  const [streak, setStreak] = useState(null);
  const [welcomeModal, setWelcomeModal] = useState(false);

  const isBirthdayToday = useMemo(() => {
    if (!profile?.date_of_birth) return false;
    try {
      const dob = new Date(profile.date_of_birth + "T00:00:00");
      const today = new Date();
      return dob.getMonth() === today.getMonth() && dob.getDate() === today.getDate();
    } catch {
      return false;
    }
  }, [profile]);

  const loadProfile = useCallback(async (uid) => {
    const { data } = await supabase.from("user_profiles").select("*").eq("id", uid).single();
    setProfile(data || null);
  }, []);

  const saveProfile = useCallback(async (fields) => {
    if (!user) return { data: null, error: "Not signed in" };
    const { data, error } = await supabase
      .from("user_profiles")
      .upsert({ id: user.id, ...fields }, { onConflict: "id" })
      .select()
      .single();
    if (data) setProfile(data);
    return { data, error };
  }, [user]);

  const loadStreak = useCallback(async (uid) => {
    const { data } = await supabase
      .from("user_reading_streaks")
      .select("current_streak, longest_streak, last_read_date")
      .eq("user_id", uid)
      .maybeSingle();
    setStreak(data || null);
  }, []);

  const updateStreak = useCallback(async () => {
    if (!user) return;
    const todayDate = new Date().toISOString().split("T")[0];
    if (streak?.last_read_date === todayDate) return;
    if (!streak) {
      const { data } = await supabase
        .from("user_reading_streaks")
        .upsert(
          {
            user_id: user.id,
            current_streak: 1,
            longest_streak: 1,
            last_read_date: todayDate,
            updated_at: new Date().toISOString(),
          },
          { onConflict: "user_id" },
        )
        .select()
        .single();
      if (data) setStreak(data);
      return;
    }
    const last = new Date(streak.last_read_date + "T00:00:00");
    const today = new Date(todayDate + "T00:00:00");
    const diffDays = Math.round((today - last) / 86400000);
    const newCurrent = diffDays === 1 ? streak.current_streak + 1 : 1;
    const newLongest = Math.max(newCurrent, streak.longest_streak);
    const { data } = await supabase
      .from("user_reading_streaks")
      .upsert(
        {
          user_id: user.id,
          current_streak: newCurrent,
          longest_streak: newLongest,
          last_read_date: todayDate,
          updated_at: new Date().toISOString(),
        },
        { onConflict: "user_id" },
      )
      .select()
      .single();
    if (data) setStreak(data);
  }, [user, streak]);

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null);
      if (session?.user) {
        loadProfile(session.user.id);
        loadStreak(session.user.id);
      }
    });
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
      if (session?.user) {
        loadProfile(session.user.id);
        loadStreak(session.user.id);
      } else {
        setProfile(null);
        setStreak(null);
      }
    });
    return () => subscription.unsubscribe();
  }, [loadProfile, loadStreak]);

  useEffect(() => {
    const timer = setTimeout(() => {
      try {
        const hasVisited = localStorage.getItem("lastVisit");
        const dismissed = localStorage.getItem("welcomeDismissed");
        if (!hasVisited && !dismissed && !user) setWelcomeModal(true);
      } catch {}
    }, 600);
    return () => clearTimeout(timer);
  }, [user]);

  useEffect(() => {
    if (user && welcomeModal) setWelcomeModal(false);
  }, [user, welcomeModal]);

  const requireAuth = useCallback(() => {
    if (user) return true;
    setWelcomeModal(true);
    return false;
  }, [user]);

  const handleAuth = useCallback(async () => {
    setAuthError("");
    setAuthLoading(true);
    try {
      if (authMode === "login") {
        const { error } = await supabase.auth.signInWithPassword({ email: authEmail, password: authPass });
        if (error) throw error;
      } else {
        const { error } = await supabase.auth.signUp({
          email: authEmail,
          password: authPass,
          options: { data: { display_name: authName || "Reader" } },
        });
        if (error) throw error;
      }
      setAuthEmail("");
      setAuthPass("");
      setAuthName("");
    } catch (error) {
      setAuthError(error.message);
    }
    setAuthLoading(false);
  }, [authEmail, authMode, authName, authPass]);

  const handleLogout = useCallback(async () => {
    await supabase.auth.signOut();
    setProfile(null);
    setStreak(null);
  }, []);

  const handleForgotPassword = useCallback(async () => {
    setAuthLoading(true);
    setAuthError("");
    const { error } = await supabase.auth.resetPasswordForEmail(authEmail, { redirectTo: window.location.origin });
    if (error) setAuthError(error.message);
    else setAuthForgotSent(true);
    setAuthLoading(false);
  }, [authEmail]);

  const handleGoogleSignIn = useCallback(async () => {
    await supabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: window.location.origin },
    });
  }, []);

  const value = useMemo(() => ({
    user,
    authMode,
    setAuthMode,
    authEmail,
    setAuthEmail,
    authPass,
    setAuthPass,
    authName,
    setAuthName,
    authError,
    setAuthError,
    authLoading,
    authShowPass,
    setAuthShowPass,
    authForgot,
    setAuthForgot,
    authForgotSent,
    setAuthForgotSent,
    profile,
    saveProfile,
    streak,
    welcomeModal,
    setWelcomeModal,
    requireAuth,
    handleAuth,
    handleLogout,
    handleForgotPassword,
    handleGoogleSignIn,
    updateStreak,
    isBirthdayToday,
  }), [
    authEmail,
    authError,
    authForgot,
    authForgotSent,
    authLoading,
    authMode,
    authName,
    authPass,
    authShowPass,
    handleAuth,
    handleForgotPassword,
    handleGoogleSignIn,
    handleLogout,
    isBirthdayToday,
    profile,
    requireAuth,
    saveProfile,
    streak,
    updateStreak,
    user,
    welcomeModal,
  ]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuthContext() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error("useAuthContext must be used within AuthProvider");
  return ctx;
}
