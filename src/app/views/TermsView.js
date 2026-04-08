"use client";
import { useState } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";

const SECTIONS = [
  {
    title: "1. Acceptance of Terms",
    body: `By accessing and using The Bible Scrollers application ("the App"), you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, you should discontinue use of the App immediately.

The App is provided for educational, devotional, and personal study purposes. We reserve the right to update these terms at any time. Continued use of the App after changes constitutes acceptance of the revised terms.`
  },
  {
    title: "2. Bible Content & Licensing",
    body: `The King James Version (KJV) Bible text presented in this App is in the public domain and may be freely read, copied, and shared.

Study notes, word studies, cross-references, chapter themes, and other enriched content are proprietary to The Bible Scrollers and are provided for personal use only. This content may not be reproduced, distributed, or used commercially without written permission.

Hymn lyrics included in the App are exclusively sourced from works published before 1928 and are in the public domain.`
  },
  {
    title: "3. User Accounts",
    body: `You may create a free account using email and password or Google OAuth. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.

Creating an account unlocks additional features including:
\u2022 Saving notes, highlights, and bookmarks
\u2022 Reading streak tracking and badge achievements
\u2022 Prayer journal and community prayers
\u2022 Quiz score tracking
\u2022 Access to the store and digital products
\u2022 Cross-device synchronisation of study data

You may use the App without an account, but personalised features will not be available.`
  },
  {
    title: "4. User-Generated Content",
    body: `Notes and highlights you create are private by default. You may optionally share notes with the community by marking them as public.

Community prayers are visible to all signed-in users. You retain ownership of all content you create, but grant The Bible Scrollers a non-exclusive licence to display your public content within the App.

We reserve the right to remove any user-generated content that is offensive, hateful, or otherwise inappropriate. Content that promotes violence, discrimination, or is unrelated to the purpose of the App may be removed without notice.`
  },
  {
    title: "5. Store Terms & Purchases",
    body: `The Bible Scrollers Store offers faith-inspired merchandise including clothing, books, stickers, and digital products.

Payment Processing
All payments are processed securely through Stripe. The Bible Scrollers does not store your payment card details.

Fulfilment
\u2022 Clothing and stickers are fulfilled via print-on-demand (Printful)
\u2022 Physical books are fulfilled via dropship partners
\u2022 Digital products are delivered instantly via download

Shipping
Physical products ship to the following countries: United Arab Emirates, India, United Kingdom, United States, Australia, Canada, Singapore, Germany, France, Netherlands, and New Zealand. Shipping times vary by region and fulfilment partner.

Refund Policy
\u2022 Physical products: 30-day return window from date of delivery. Items must be unused and in original condition.
\u2022 Digital products: No refunds after download, as digital content cannot be returned.
\u2022 Damaged or defective items: Contact us within 7 days of delivery for a replacement or full refund.

Pricing
All prices are displayed in USD. Applicable taxes and shipping costs are calculated at checkout.`
  },
  {
    title: "6. Privacy & Data",
    body: `Data We Collect
\u2022 Account information: email address, display name
\u2022 Optional profile data: full name, date of birth, gender, phone number, nickname
\u2022 Study data: highlights, notes, bookmarks, reading streaks, badge progress, quiz scores
\u2022 Prayer data: personal prayers, community prayers, prayer clock participation

How We Use Your Data
Your data is used solely to provide and improve the App experience. We use Supabase for secure data storage and authentication with JWT-based sessions.

What We Do Not Do
\u2022 We do not sell your personal data to third parties
\u2022 We do not use third-party tracking or advertising networks
\u2022 We do not share your data with external parties except as required by payment processing (Stripe)

Data Deletion
You may delete your account and associated study data from the app account settings, or contact us if you need support with the process. If deletion cannot be completed safely, we may ask you to contact support so we can finish the removal manually. Upon deletion, your notes, highlights, prayers, and profile information will be permanently removed.

Cookies & Local Storage
The App uses browser localStorage to persist preferences (dark mode, font size, Bible translation, navigation state). No tracking cookies are used.`
  },
  {
    title: "7. Intellectual Property",
    body: `The Bible Scrollers name, logo, design, and all non-biblical content (study notes, UI design, illustrations, branding) are the intellectual property of The Bible Scrollers.

You may not reproduce, modify, or distribute the App or its proprietary content without written permission. This does not restrict your use of KJV Bible text or public domain hymn lyrics.`
  },
  {
    title: "8. Acceptable Use",
    body: `You agree not to:
\u2022 Use the App for any unlawful purpose
\u2022 Attempt to gain unauthorised access to the App or its systems
\u2022 Post offensive, hateful, or spam content in community features
\u2022 Use automated tools to scrape or harvest data from the App
\u2022 Impersonate other users or misrepresent your identity

Violation of these terms may result in account suspension or termination.`
  },
  {
    title: "9. Disclaimer & Limitation of Liability",
    body: `The App is provided "as is" without warranties of any kind. While we strive for accuracy in all biblical content and study materials, we do not guarantee that the App will be error-free or uninterrupted.

The Bible Scrollers shall not be liable for any indirect, incidental, or consequential damages arising from your use of the App or Store.

Study notes and commentary are provided for educational purposes and should not be considered a substitute for pastoral guidance or professional theological counsel.`
  },
  {
    title: "10. Changes to Terms",
    body: `We may update these Terms and Conditions from time to time. When we do, we will update the "Last updated" date below. Continued use of the App after any changes constitutes your acceptance of the new terms.

We encourage you to review these terms periodically.`
  },
  {
    title: "11. Contact",
    body: `If you have questions about these Terms and Conditions, please reach out to us:

Organisation: The Bible Scrollers
Website: https://study-bible-two.vercel.app
GitHub: https://github.com/rahulthottathilrajan/study-bible`
  },
];

export default function TermsView() {
  const { ht, bp, goBack, darkMode } = useApp();
  const [expanded, setExpanded] = useState({});

  const toggle = (i) => setExpanded(prev => ({ ...prev, [i]: !prev[i] }));

  return (
    <div style={{ minHeight:"100vh",background:ht.bg,paddingBottom:80 }}>
      <Header title="Terms & Conditions" theme={ht} onBack={goBack} hidePrayer hideUser />
      <div style={{ padding:`20px ${bp.pad}px 40px`,maxWidth:bp.content,margin:"0 auto" }}>

        {/* Intro */}
        <div style={{ textAlign:"center",marginBottom:24 }}>
          <div style={{ fontFamily:ht.heading,fontSize:22,fontWeight:700,color:ht.dark,marginBottom:6 }}>Terms & Privacy</div>
          <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.muted,lineHeight:1.6 }}>
            Last updated: March 2026
          </div>
          <div style={{ fontFamily:ht.body,fontSize:13,color:ht.text,lineHeight:1.7,marginTop:12,textAlign:"left" }}>
            Welcome to The Bible Scrollers. These terms govern your use of our application and store. We believe in transparency and simplicity {"\u2014"} just as we present the Word clearly, we present our terms plainly.
          </div>
        </div>

        {/* Sections */}
        <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
          {SECTIONS.map((s, i) => {
            const isOpen = expanded[i];
            return (
              <div key={i} style={{ background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:14,overflow:"hidden",transition:"box-shadow 0.2s",boxShadow:isOpen?"0 2px 12px rgba(0,0,0,0.08)":"none" }}>
                <button onClick={() => toggle(i)} style={{ width:"100%",display:"flex",alignItems:"center",justifyContent:"space-between",padding:"14px 16px",background:"none",border:"none",cursor:"pointer",textAlign:"left" }}>
                  <span style={{ fontFamily:ht.ui,fontSize:14,fontWeight:700,color:ht.dark }}>{s.title}</span>
                  <span style={{ fontSize:12,color:ht.muted,transform:isOpen?"rotate(180deg)":"rotate(0deg)",transition:"transform 0.2s",flexShrink:0,marginLeft:8 }}>{"\u25BE"}</span>
                </button>
                {isOpen && (
                  <div style={{ padding:"0 16px 16px",animation:"fadeIn 0.2s ease" }}>
                    <div style={{ height:1,background:ht.divider,marginBottom:12 }} />
                    <div style={{ fontFamily:ht.body,fontSize:13,color:ht.text,lineHeight:1.8,whiteSpace:"pre-line" }}>
                      {s.body}
                    </div>
                  </div>
                )}
              </div>
            );
          })}
        </div>

        {/* Footer */}
        <div style={{ textAlign:"center",marginTop:28,padding:"16px 0",borderTop:`1px solid ${ht.divider}` }}>
          <div style={{ fontFamily:ht.heading,fontSize:16,color:ht.dark,marginBottom:4 }}>The Bible Scrollers</div>
          <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,lineHeight:1.6 }}>
            Scrolling Through Scripture
          </div>
          <div style={{ fontFamily:ht.ui,fontSize:10,color:ht.light,marginTop:8 }}>
            {"\u00A9"} {new Date().getFullYear()} The Bible Scrollers. All rights reserved.
          </div>
        </div>
      </div>
    </div>
  );
}
