---
name: Placet
description: Consented call data for AI, presented as a call recording you can play, at night.
colors:
  night: "#0a0d14"
  slate-panel: "#131824"
  slate-raised: "#1a2131"
  silver: "#e9edf3"
  silver-2: "#c3cad6"
  stone: "#8891a1"
  sky: "#5ab9fc"
  sky-light: "#9ad3ff"
  context-slate: "#5c667a"
  loss-red: "#f07a7a"
typography:
  poster:
    fontFamily: "Funnel Display, Helvetica Neue, Arial, sans-serif"
    fontSize: "200px"
    fontWeight: 400
    lineHeight: 0.9
    letterSpacing: "-0.045em"
  headline:
    fontFamily: "Funnel Display, Helvetica Neue, Arial, sans-serif"
    fontSize: "58px"
    fontWeight: 400
    lineHeight: 1.06
    letterSpacing: "-0.035em"
  figure:
    fontFamily: "Funnel Display, Helvetica Neue, Arial, sans-serif"
    fontSize: "104px"
    fontWeight: 400
    lineHeight: 1.04
    letterSpacing: "-0.045em"
  body:
    fontFamily: "Funnel Sans, Helvetica Neue, Arial, sans-serif"
    fontSize: "28px"
    fontWeight: 400
    lineHeight: 1.3
    letterSpacing: "0em"
  label:
    fontFamily: "Funnel Sans, Helvetica Neue, Arial, sans-serif"
    fontSize: "18px"
    fontWeight: 500
    lineHeight: 1.25
    letterSpacing: "0em"
  technical:
    fontFamily: "Geist Mono, ui-monospace, Menlo, monospace"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.2
    letterSpacing: "0.06em"
rounded:
  bar-end: "5px"
  control: "8px"
  block: "10px"
  panel: "14px"
  key: "22px"
spacing:
  gutter: "72px"
  rail: "64px"
  headline-top: "92px"
  body-top: "196px"
components:
  segment-switch:
    backgroundColor: "{colors.night}"
    textColor: "{colors.silver}"
    rounded: "{rounded.control}"
    padding: "4px 12px"
  segment-switch-on:
    backgroundColor: "{colors.silver}"
    textColor: "{colors.night}"
    rounded: "{rounded.control}"
  yes-key:
    backgroundColor: "{colors.sky}"
    textColor: "{colors.night}"
    rounded: "{rounded.key}"
    size: "150px"
  console:
    backgroundColor: "{colors.slate-panel}"
    textColor: "{colors.silver}"
    rounded: "{rounded.panel}"
---

# Design System: Placet

## Overview

The deck is a call recording you can play, presented like a keynote at night. Placet records both
voices on separate tracks, asks for a yes after the call, labels it and licenses it, so every slide
borrows that format: silver agent track above a centre line, sky-blue customer track below, and a
lit playhead. Every slide is dark. Posters (opening, problem, solution, demand, close) add a slow
aurora and a live waveform the pointer can scrub; data slides keep the same marks for their charts.

## Colors

### Primary
- **Sky** `#5ab9fc` (9:1 on night): the yes, Placet's share, the focal line or bar of a chart, the
  playhead and the section cue. **Sky light** `#9ad3ff` only inside the key's gradient.

### Neutral
- **Night** `#0a0d14`, **slate panel** `#131824`, **slate raised** `#1a2131`: grounds and panels.
- **Silver** `#e9edf3` for type (16.5:1), **silver 2** `#c3cad6` for strong secondary, **stone**
  `#8891a1` for secondary text (6.1:1). Rules are silver at 10% to 18%.

### Named Rules
- **The record light rule.** Sky appears on the one thing the presenter is pointing at.
- **Context is slate, losses are red.** Chart context uses `#5c667a`; negative values use `#f07a7a`
  and sit below the zero line. No gold, no violet.

## Typography

Funnel Display at 400 sets posters, headlines and figures; Funnel Sans sets text; Geist Mono is for
technical text only (timecodes, call IDs, track names, units, arrow labels, slide numbers).

### Hierarchy
- Poster word 120 to 212px, fitted to one line and to the room above the claims.
- Headline 58px, one line, shrunk to fit; never preceded by a kicker.
- Figures 50 to 104px, tabular numerals; body 24 to 31px; labels 16 to 20px.

### Named Rules
- **No eyebrows.** The page label lives in the running foot at the bottom left.

## Layout

A 1280 by 720 stage scaled to the window, 72px gutters. The top rail (64px) holds the wordmark,
section cues with a glowing sky underline, and the ₹/$ switch; a 2px sky progress line runs along
the stage top. Headlines start at 92px, bodies at 196 to 226px, the running foot 28px from the bottom.

## Elevation & Depth

Depth comes from light, not boxes: a faint sky radial in the top right of every slide, the poster
aurora, and soft glows on the few lit things (playhead, key, Placet's chart mark). Panels are slate
with a 1px silver rule; the console and dialogs add a long soft shadow.

## Shapes

Bars end in a 5px round on a square baseline; waveform bars are full pills. Controls 8px, canvas
blocks 10px, console and dialogs 14px, the yes key 22px.

## Components

### Yes key
Sky gradient square with an inner highlight, two pulse rings, and a magnetic lean toward the pointer
(clamped to 18px). The outline variant (silver ring) is used when sky is already spent on the slide.

### Segment switch
Hairline group with a silver knob that springs between options; T flips the switch on screen.

### Slider
A 3px track filled in sky up to a silver thumb with a sky halo.

### Console
The live demo: title bar marked "sample call", canvas tracks with a glowing customer track, a typed
transcript, labels that decode into place, and a dialog that asks the press-1 question; a yes draws
a check and scatters light, a no wipes the transcript.

### Diagrams
Orthogonal connectors, Geist Mono caps labels on a mask beside their line, 10px node corners, one sky
focal node, no glow, dashed paths that march.

## Motion

- **Playhead transition**: 780ms (1050ms with the section flag), cubic-bezier(.83,0,.17,1); the next
  slide unblurs and settles from 104% while the old one sinks to 95% and dims.
- **Letters**: headlines rise letter by letter out of an 8 to 10px blur, 20ms apart, expo out.
- **Counters**: figures roll digit columns into place, 1.3s, left to right.
- **Charts**: bars grow with a slight overshoot, lines draw with a light at their head.
- Everything rests and nothing hides under reduced motion.

## Do's and Don'ts

### Do:
- Keep one lit thing per view and let everything else stay silver and slate.
- Keep a legend for two-series charts and every figure in the ₹/$ switch.
- Keep poster effects cheap: soft gradients and transforms, no per-frame blur filters.

### Don't:
- Don't put a label, kicker or section number above a heading.
- Don't use gold, violet, gradient text or glow on diagrams.
- Don't use mono for prose or taglines.
