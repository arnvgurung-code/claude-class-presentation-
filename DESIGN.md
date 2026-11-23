---
name: Placet
description: Consented call data for AI, presented as a call recording you can play.
colors:
  night: "#0d060b"
  night-surface: "#1b0e17"
  plum: "#470c35"
  paper: "#ffffff"
  ink: "#101421"
  record-pink: "#ff488b"
  record-pink-ink: "#d81b67"
  loss-plum: "#9c2a6b"
  night-muted: "#b3a8b0"
typography:
  poster:
    fontFamily: "Host Grotesk, Helvetica Neue, Arial, sans-serif"
    fontSize: "200px"
    fontWeight: 500
    lineHeight: 0.9
    letterSpacing: "-0.045em"
  headline:
    fontFamily: "Host Grotesk, Helvetica Neue, Arial, sans-serif"
    fontSize: "58px"
    fontWeight: 500
    lineHeight: 1.04
    letterSpacing: "-0.035em"
  figure:
    fontFamily: "Host Grotesk, Helvetica Neue, Arial, sans-serif"
    fontSize: "104px"
    fontWeight: 500
    lineHeight: 1
    letterSpacing: "-0.045em"
  body:
    fontFamily: "Host Grotesk, Helvetica Neue, Arial, sans-serif"
    fontSize: "28px"
    fontWeight: 400
    lineHeight: 1.3
    letterSpacing: "0em"
  label:
    fontFamily: "Host Grotesk, Helvetica Neue, Arial, sans-serif"
    fontSize: "18px"
    fontWeight: 400
    lineHeight: 1.25
    letterSpacing: "0em"
  technical:
    fontFamily: "Geist Mono, ui-monospace, Menlo, monospace"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.2
    letterSpacing: "0.06em"
rounded:
  bar-end: "4px"
  control: "6px"
  panel: "10px"
  key: "18px"
spacing:
  gutter: "72px"
  rail: "64px"
  headline-top: "92px"
  body-top: "196px"
components:
  segment-switch:
    backgroundColor: "{colors.paper}"
    textColor: "{colors.ink}"
    rounded: "{rounded.control}"
    padding: "4px 12px"
  segment-switch-on:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.paper}"
    rounded: "{rounded.control}"
  yes-key:
    backgroundColor: "{colors.record-pink}"
    textColor: "{colors.night}"
    rounded: "{rounded.key}"
    size: "150px"
  console-dialog:
    backgroundColor: "{colors.night}"
    textColor: "{colors.paper}"
    rounded: "{rounded.panel}"
    padding: "26px"
---

# Design System: Placet

## Overview

The deck is a call recording you can play. Placet records both voices on separate tracks, asks
for a yes after the call, labels it and licenses it, so every surface borrows that format: an
agent track above a centre line, a customer track below it, and a pink record light for the one
moment that matters. Posters (opening, problem, solution, demand, close) are the call itself on a
plum-black ground. Data slides are the archive: white paper, ink figures, the same rounded bar
marks the waveform uses. A pink playhead scrubs between slides and carries the section name.

## Colors

### Primary
- **Record pink** `#ff488b`: the yes, Placet's share, the focal mark on a chart, the playhead. Marks
  only on white; as text on white use **record pink ink** `#d81b67` (4.9:1).

### Neutral
- **Night** `#0d060b` with **night surface** `#1b0e17` and **plum** `#470c35`: poster grounds and the
  presenter chrome. Text on night is white; secondary text is `#b3a8b0` (8.6:1).
- **Paper** `#ffffff` and **ink** `#101421`: every data slide. Secondary ink is ink at 68% (6.3:1);
  rules are ink at 14% to 25%.

### Named Rules
- **The record light rule.** Pink appears once per view, on the thing the presenter is pointing at.
- **Losses are plum, not pink.** Negative values use loss plum `#9c2a6b` and sit below the centre
  line, so a loss never reads as Placet's share.

## Typography

One family carries the deck: Host Grotesk at weight 500 for posters, headlines and figures, 400
for body. Geist Mono is for technical content only: timecodes, call IDs, track names, axis units,
arrow labels and slide numbers.

### Hierarchy
- Poster word 120 to 212px, fitted to one line and to the room above the claims.
- Headline 58px, one line, shrunk to fit; never preceded by a kicker.
- Figures 50 to 104px, tabular numerals, tracking -0.035em to -0.045em.
- Body 24 to 31px; labels 16 to 20px.

### Named Rules
- **No eyebrows.** The page label lives in the running foot at the bottom left, never above a heading.

## Layout

A 1280 by 720 stage scaled to the window, 72px gutters. The top rail (64px) holds the wordmark,
section cues and the rupee/dollar switch; the current section carries a 3px pink cue under it.
Headlines start at 92px; bodies at 196 to 226px; the running foot sits 28px from the bottom.

## Elevation & Depth

Flat. Rules and tints separate things; the only shadows are the soft offset shadow under the yes
key and the console dialog.

## Shapes

Bars end in a 4px round and sit square on their baseline. Controls use 6px corners, panels 10px,
the yes key 18px. Waveform bars are fully rounded pills, 5px wide on a 12px pitch.

## Components

### Segment switch
Hairline-outlined group; the selected option is an ink knob that slides. Every chart that can change
has one, and T flips the one on screen.

### Slider
A 2px track with a pink 8 by 32px playhead thumb.

### Yes key
A pink rounded square with the word above and the figure below; the outline variant (white ring)
is used when pink is already spent on the slide.

### Console
The live demo is drawn as Placet's own console: a title bar, two canvas tracks, the transcript, a
labels panel, and a night dialog that asks the press-1 question.

### Diagrams
Orthogonal connectors only, labels in Geist Mono caps on an opaque mask beside their line, 6px node
corners, one pink focal node per diagram.

## Do's and Don'ts

### Do:
- Draw every chart mark as a rounded bar or a 3px line in ink, with pink on the one series that is Placet.
- Keep a legend when two series share a chart, and keep every figure in the ₹/$ switch.
- Let one moment move on each slide: the playhead, a chart drawing in, or figures counting up.

### Don't:
- Don't put a label, kicker or section number above a heading.
- Don't use mono for prose or taglines.
- Don't fade in every item on a page; content is visible at rest.
- Don't use violet, gradients or glow on text.
