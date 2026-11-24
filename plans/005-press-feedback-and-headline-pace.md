# 005 — Scale press feedback; quicker headline letters on data slides

- **Status**: TODO
- **Commit**: d18aafe
- **Severity**: LOW
- **Category**: Physicality / Purpose & frequency
- **Estimated scope**: 1 file (placet-business-plan.html), CSS and script

## Problem

Press feedback is a 1px nudge (`:52` `:active{transform:translateY(1px)}`) on a subset of controls. Data-slide headlines (seen tens of times a talk) rise letter by letter over ~820ms + 20ms per letter with a 8px blur (`revealHead`).

## Target

```css
.btn,.seg button,#curT button,#secs button,.ivr-k button,.bk,#touch button,#hud button{transition-property:transform,background,color,box-shadow,opacity;transition-duration:160ms;transition-timing-function:var(--ease-out)}
.btn:active,.seg button:active,#curT button:active,#secs button:active,.ivr-k button:active,.bk:active,#touch button:active,#hud button:active{transform:scale(.97)}
```
revealHead: duration 560ms, stagger 14ms, blur 6px, rise .4em. Poster hero words (rare) keep their slower entrance.

## Repo conventions to follow

- Motion tokens live in the `:root` block at the top of `placet-business-plan.html`'s `<style>`; JS reads curves from the `EASE` constant near the top of the script.
- Reduced motion is checked once in script as `RM` and in CSS under `@media (prefers-reduced-motion:reduce)`.

## Steps

1. Apply the Target in `placet-business-plan.html`, keeping selectors and markup unchanged unless the Target names them.
2. Search the file for any other instance of the same pattern and apply the same change.

## Boundaries

- Do NOT change content, figures, the financial model or layout.
- Do NOT add dependencies.
- If a cited line no longer matches, STOP and report.

## Verification

- **Feel check**: every control dips to 97% on press and springs back in 160ms; a data-slide headline settles within about 1s.
- **Done when**: no control uses translateY for press feedback.
- Toggle `prefers-reduced-motion` and confirm movement is dropped but opacity feedback remains.
