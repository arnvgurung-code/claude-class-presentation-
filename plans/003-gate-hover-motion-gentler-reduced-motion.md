# 003 — Gate hover motion; keep gentle fades under reduced motion

- **Status**: TODO
- **Commit**: d18aafe
- **Severity**: MEDIUM
- **Category**: Accessibility
- **Estimated scope**: 1 file (placet-business-plan.html), CSS and script

## Problem

Hover lifts run on touch taps (`:144` .btn, `:203` menu items, `:321` IVR keys, `:393` canvas blocks), and the reduced-motion block at `:444` removes every animation and the page crossfade, so slide and page changes become hard cuts.

## Target

```css
@media (hover:hover) and (pointer:fine){ .btn:hover{transform:translateY(-1px)} #menu .mch button:hover{transform:translateX(4px)} .ivr-k button:hover{transform:translateY(-2px)} .bk:hover{transform:translateY(-2px)} }
```
Remove the transforms from the ungated rules. Under `prefers-reduced-motion: reduce`, keep `.page` opacity transitions and give slide changes a 200ms opacity crossfade (`ease`) in show(); still no movement, blur or scaling.

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

- **Feel check**: with Reduce motion on, slides and pages cross-fade in about 200ms and nothing moves; on a touch device, tapping a block does not leave it lifted.
- **Done when**: every hover transform sits inside the hover/fine-pointer query.
- Toggle `prefers-reduced-motion` and confirm movement is dropped but opacity feedback remains.
