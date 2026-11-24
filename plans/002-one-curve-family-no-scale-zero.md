# 002 — Use one strong curve family; never pop from scale(0)

- **Status**: TODO
- **Commit**: d18aafe
- **Severity**: MEDIUM
- **Category**: Easing & duration / Physicality
- **Estimated scope**: 1 file (placet-business-plan.html), CSS and script

## Problem

Five hand-typed curves (`:17` --ease .16,1,.3,1 and --inout .87,0,.13,1; `:929` EASE; `:1049` odometer .2,.9,.1,1; `:1117` slide transition .83,0,.17,1), an ease-in exit at `:1601` (`cubic-bezier(.5,0,.75,0)` on the demo's deleted transcript), and two pops from nothing:

```js
// :1058 cue markers and :1064 Placet column checks
[{transform:'scale(0)'},{transform:'scale(1.4)',offset:.6},{transform:'none'}]
```

## Target

```css
--ease-out: cubic-bezier(0.23, 1, 0.32, 1);      /* every entrance, exit, count and draw */
--ease-in-out: cubic-bezier(0.77, 0, 0.175, 1);  /* the playhead scrub across the stage */
```
JS `EASE` = the same ease-out string; slide transition easing = the ease-in-out string; odometer and the deleted-transcript exit use ease-out. Pops become `[{opacity:0,transform:'scale(.9)'},{opacity:1,transform:'scale(1.06)',offset:.6},{opacity:1,transform:'none'}]`.

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

- **Feel check**: at 10% playback, markers and checks grow from 90%, never from a point; the transcript wipe starts moving on the first frame.
- **Done when**: only the two tokens (plus the spring) appear as cubic-beziers; no `scale(0)` entrance remains.
- Toggle `prefers-reduced-motion` and confirm movement is dropped but opacity feedback remains.
