# 001 — Animate bars, cue, knobs and progress without layout properties

- **Status**: TODO
- **Commit**: d18aafe
- **Severity**: HIGH
- **Category**: Performance
- **Estimated scope**: 1 file (placet-business-plan.html), CSS and script

## Problem

Bars grow by transitioning `width` (layout + paint every frame), the light sweep animates `left`, and the section cue, switch knobs and progress line slide `left`/`width`.

```css
/* placet-business-plan.html:159 — current */
.hb .bar i{...width:0;...transition:width 1.2s var(--spring);overflow:hidden}
/* :355 */ .fr .fb{...width:0;transition:width 1.1s var(--spring);...}
/* :413 */ .acc .mt i{...width:0;...transition:width 1.1s var(--spring);...}
/* :162 */ @keyframes sheen{0%{left:-80px}55%,100%{left:110%}}
/* :46  */ #secs .cue{...left:0;width:0;...transition:left .7s var(--ease),width .7s var(--ease),opacity .3s}
/* :50, :142 */ .knob{...left:3px;width:0;...transition:left .5s ...,width .5s ...}
/* :51  */ #prog{...width:0;...transition:width .9s var(--ease)}
```

## Target

```css
.hb .bar i,.acc .mt i{width:100%;clip-path:inset(0 100% 0 0 round 0 6px 6px 0);transition:clip-path 1.2s var(--spring)}
.fr .fb{clip-path:inset(0 100% 0 0 round 0 6px 6px 0);transition:clip-path 1.1s var(--spring)} /* width set at once */
@keyframes sheen{0%{transform:translateX(-80px)}55%,100%{transform:translateX(900px)}}  /* left fixed at 0 */
#secs .cue{width:100px;transform-origin:0 0;transition:transform .7s var(--ease-out),opacity .3s}  /* translateX(x) scaleX(w/100) */
.knob{width:100px;transform-origin:0 0;transition:transform .5s var(--ease-out)}  /* translateX(x) scaleX(w/100) */
#prog{width:100%;transform-origin:0 0;transform:scaleX(0);transition:transform .9s var(--ease-out)}
```
Script: grow()/hbSet()/growAcc()/growFun() write `clip-path` (inset right = 100% − value%) instead of `width`; knob()/updTop() write `transform`; show() writes `#prog` transform `scaleX(n/25)`.

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

- **Mechanical**: open the deck, no console errors; growth, costs, funnel and accelerator bars reach the same end lengths as before.
- **Feel check**: in DevTools Animations at 10%, bars reveal from the left edge with the rounded end intact; the knob slides and resizes without a jump; the sweep never paints outside its bar.
- **Done when**: no `transition` or `@keyframes` in the file animates `width`, `left`, `top`, `height`, `margin` or `padding`.
- Toggle `prefers-reduced-motion` and confirm movement is dropped but opacity feedback remains.
