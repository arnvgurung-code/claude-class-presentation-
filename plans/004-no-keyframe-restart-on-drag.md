# 004 — Stop restarting the bump keyframe on every slider tick

- **Status**: TODO
- **Commit**: d18aafe
- **Severity**: MEDIUM
- **Category**: Interruptibility
- **Estimated scope**: 1 file (placet-business-plan.html), CSS and script

## Problem

`bump()` restarts a 500ms `@keyframes` on each `input` event while a slider is dragged, so the figures jitter from frame zero dozens of times a second:

```js
// :1328 uRate, :1536 sOrd/sYrs, :1553 planP
$('#uRate').addEventListener('input',()=>{calcUnit();...;['#uMade','#uSold','#uLeft'].forEach(s=>bump($(s)));});
```

## Target

Drop `bump` from the three continuous `input` handlers. Keep it on discrete changes only (the T switch, clicker beats).

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

- **Feel check**: dragging any slider updates figures smoothly with no pulsing; pressing T still gives one bump.
- **Done when**: no `addEventListener('input', …)` handler calls `bump`.
- Toggle `prefers-reduced-motion` and confirm movement is dropped but opacity feedback remains.
