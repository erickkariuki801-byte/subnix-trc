# Subnix — Subscription Tracker

AI-powered subscription tracker. Find forgotten subscriptions, get renewal alerts, and cut waste.

## Tech Stack
- **Frontend**: Next.js 14 (React)
- **Database + Auth**: Supabase
- **Payments**: Stripe
- **Email**: Resend
- **AI**: Anthropic Claude
- **Hosting**: Vercel

## Quick Start

### 1. Install dependencies
```bash
npm install
```

### 2. Set up environment variables
```bash
cp .env.local.example .env.local
# Fill in all values in .env.local
```

### 3. Set up Supabase
- Create project at supabase.com
- Run `supabase-schema.sql` in the SQL Editor
- Enable Google OAuth in Authentication > Providers

### 4. Set up Stripe
- Create account at stripe.com
- Create Monthly ($5) and Yearly ($30) products
- Copy Price IDs to .env.local

### 5. Run locally
```bash
npm run dev
# Open http://localhost:3000
```

### 6. Deploy to Vercel
```bash
# Push to GitHub first
git init && git add . && git commit -m "Initial commit"
git push origin main

# Then import on vercel.com
# Add all environment variables in Vercel dashboard
```

## Project Structure
```
subnix/
├── app/
│   ├── page.js              # Landing page
│   ├── layout.js            # Root layout
│   ├── auth/
│   │   ├── page.js          # Login / signup
│   │   └── callback/route.js # OAuth callback
│   ├── dashboard/
│   │   └── page.js          # Main app dashboard
│   ├── success/page.js      # Post-payment success
│   ├── privacy/page.js      # Privacy policy
│   ├── terms/page.js        # Terms of service
│   └── api/
│       ├── analyse/route.js # AI analysis (Anthropic)
│       ├── checkout/route.js # Stripe checkout
│       ├── webhook/route.js  # Stripe webhook
│       └── alerts/route.js  # Email renewal alerts
├── components/
│   └── SpendCharts.js       # Recharts spend charts
├── lib/
│   ├── supabase.js          # Supabase client
│   ├── stripe.js            # Stripe client + plans
│   ├── currency.js          # Multi-currency helpers
│   └── subscriptions.js     # Subscription utilities
├── styles/globals.css        # Global styles + theme
├── middleware.js             # Auth route protection
├── supabase-schema.sql       # Database schema
└── vercel.json              # Cron job config
```

## Environment Variables

| Variable | Where to get it |
|----------|----------------|
| NEXT_PUBLIC_SUPABASE_URL | supabase.com → Settings → API |
| NEXT_PUBLIC_SUPABASE_ANON_KEY | supabase.com → Settings → API |
| SUPABASE_SERVICE_ROLE_KEY | supabase.com → Settings → API |
| STRIPE_SECRET_KEY | dashboard.stripe.com → Developers |
| NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY | dashboard.stripe.com → Developers |
| STRIPE_WEBHOOK_SECRET | dashboard.stripe.com → Webhooks |
| STRIPE_MONTHLY_PRICE_ID | dashboard.stripe.com → Products |
| STRIPE_YEARLY_PRICE_ID | dashboard.stripe.com → Products |
| ANTHROPIC_API_KEY | console.anthropic.com → API Keys |
| RESEND_API_KEY | resend.com → API Keys |
| EMAIL_FROM | alerts@yourdomain.com |
| NEXT_PUBLIC_APP_URL | https://yourdomain.com |

## Features
- ✅ User auth (email + Google OAuth)
- ✅ Subscription tracking with renewal dates
- ✅ Unused subscription detection
- ✅ AI-powered money advice (Claude)
- ✅ Bank statement CSV import simulation
- ✅ Cancel guides for popular services
- ✅ Spend trend charts (Recharts)
- ✅ Multi-currency (USD, KES, GBP, EUR, NGN, ZAR)
- ✅ Email renewal alerts (Resend + Vercel cron)
- ✅ Dark mode
- ✅ Stripe subscription billing
- ✅ Mobile-responsive design
- ✅ Price rise tracker

## Support
Built with ❤️ using Claude by Anthropic
