# Animation plans (Emil Kowalski improve-animations)

Audit of `placet-business-plan.html` at commit d18aafe, standard effort, run inline.

| # | Plan | Severity | Status |
| --- | --- | --- | --- |
| 001 | Animate bars, cue, knobs and progress without layout properties | HIGH | DONE |
| 002 | Use one strong curve family; never pop from scale(0) | MEDIUM | DONE |
| 003 | Gate hover motion; keep gentle fades under reduced motion | MEDIUM | DONE |
| 004 | Stop restarting the bump keyframe on every slider tick | MEDIUM | DONE |
| 005 | Scale press feedback; quicker headline letters on data slides | LOW | DONE |

Execution order: 001, 002, 003, 004, 005. 001 and 005 both touch the control rules; apply 001 first.

No missed opportunities reported: the deck already animates its state changes (slide scrub, page fades, rolling figures, chart draws).

All five executed. The review below (review-animations) was run against the result.

## Review: review-animations, against STANDARDS.md

| Before | After | Why |
| --- | --- | --- |
| `bump()` keyframe (scale 1.08, 500ms spring) fired by the unit, licence, sales and projection switches | Deleted; the figures already roll or redraw | Keyframes on toggles restart from zero, and T can flip a switch rapidly; the redraw is the feedback |
| `.seg .knob`, `#curT .knob`: `transform .5s var(--ease-out)` | `transform 250ms var(--inout)` | UI stays under 300ms; a knob moving across the switch is on-screen movement, so ease-in-out |
| `#secs .cue`: `transform .7s` | `transform 300ms var(--inout)` | Same rule; the cue travels between section names |
| `#prog`: `transform .9s` | `transform 300ms var(--ease-out)` | UI duration over 300ms with no reason |
| `#toast`: `opacity .3s, transform .5s var(--ease)` | `opacity 400ms ease, transform 400ms ease` | Toasts use Sonner's 400ms `ease` |
| `.ivr, .res` dialog: `transform .7s var(--spring)` | `transform 400ms var(--ease-out)`, opacity 300ms | Modal budget is 200 to 500ms; no bounce on UI |
| `input[type=range]:hover::-webkit-slider-thumb{transform:scale(1.15)}` | Inside `@media (hover:hover) and (pointer:fine)` | Ungated hover motion fires on tap |
| `.pgno .bts b`: `height 9px → 15px` transition | Fixed 15px, `scaleY(.6)` → `none`, 250ms ease-out | Animating height runs layout |
| `#wave` marks: `transition: height .3s` | Removed (their height never changes) | Dead layout transition |
| `#menu .mch button`: `transform .3s var(--ease)` | `transform 200ms var(--ease-out)` | Hover row nudge, seen tens of times; reduce it |
| Press rule at the top of the stylesheet | Moved last, `.bk` added | Each control's own `transition` shorthand came later and won, so the 160ms scale(.97) press snapped |
| Projection switch blur: `460ms 'ease-out'` | `300ms` on the custom ease-out | Built-in easing is too weak; UI under 300ms |

### Verdict

1. **Feel-breaking regressions**: none left. No `ease-in`, no `transition: all`, nothing enters from `scale(0)`
   (the consent burst particles exit to it while fading out, a rare celebration).
2. **Performance**: no layout properties animate; bars reveal with `clip-path`; poster loop measured at 61fps.
3. **Interruptibility**: switches, knobs and bars are transitions that retarget; the remaining `bump` runs
   only on presenter builds (customers, risks), one per click.
4. **Accessibility**: hover motion is gated; under reduced motion slides crossfade in 200ms and charts rest.
5. **Kept on purpose**: slide transitions (780 to 1050ms), poster letters and chart draws are explanatory
   motion in a presentation, which STANDARDS.md allows to run longer.

**Approve.**
