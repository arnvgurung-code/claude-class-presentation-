---
name: awesome-design-md
description: >-
  84 DESIGN.md files describing the design systems of well-known brands (colors, typography,
  spacing, radii, components, tone), from VoltAgent/awesome-design-md. Use when the user asks
  for a page, component or UI "in the style of" / "like" a named brand or product (e.g. Stripe,
  Linear, Vercel, Apple, Notion, Spotify), wants a ready-made design system to build against,
  or wants to compare brand visual languages.
---

# Awesome DESIGN.md

Each `designs/<brand>/DESIGN.md` is a design-system analysis of one brand: YAML front matter
with color, typography, spacing and component tokens, followed by prose on layout, imagery,
motion and voice.

## How to use

1. Match the user's request to a brand folder below (folder names are lowercase; some carry a
   suffix such as `linear.app`, `x.ai`, `mistral.ai`, `bmw-m`, `dell-1996`).
2. Read that brand's `DESIGN.md` in full before writing UI code.
3. Build with its tokens (colors, type scale, radii, spacing, shadows) and follow its layout and
   component guidance. Substitute freely available fonts when a proprietary family is named, using
   the fallbacks in the file.
4. If the user wants the system to persist in their project, copy the file to the project root as
   `DESIGN.md`.
5. These are *inspired interpretations*: do not reproduce a brand's logos, trademarks or copy, and
   don't present the result as the brand's own site.

If no brand is named, offer two or three that fit the brief rather than guessing.

## Available brands

1win, airbnb, airtable, aljazeera, apple, binance, bmw, bmw-m, bugatti, cal, claude, clay, clickhouse, cohere, coinbase, composio, cursor, dell-1996, dji, elevenlabs, expo, ferrari, figma, framer, hashicorp, hp, ibm, intercom, jobright, kraken, lamborghini, linear.app, lovable, mastercard, mercury, meta, minimax, mintlify, miro, mistral.ai, mongodb, mydealz, nerdwallet, nike, nintendo-2001, notion, nvidia, ollama, opencode.ai, oracle, oura, pinterest, playstation, posthog, raycast, renault, replicate, resend, revolut, runwayml, sanity, sap, sentry, shopify, slack, spacex, spotify, starbucks, stripe, supabase, superhuman, tesla, theverge, together.ai, uber, vercel, vodafone, voltagent, warp, webflow, wired, wise, x.ai, zapier

Source: https://github.com/VoltAgent/awesome-design-md (MIT, see LICENSE), commit fcc70284.
