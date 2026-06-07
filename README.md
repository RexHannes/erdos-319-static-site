# Erdos #319 Progress Notes and Formalization Blueprint

A curated status page for Erdos #319 exploratory progress. This is a progress
record and formalization blueprint, not a claimed proof or solution.

## Status Ledger

| Item | Status |
|---|---|
| Full Erdős #319 | Open |
| Claimed solution | No |
| Full Lean proof of #319 | No |
| Growth-Q formal backbone | 2026-06-08 checkpoint added; exact finite collision-count theorem and rational CP corollary reported Lean-proved |
| Dominant Short-Energy Conjecture | Open; formal statements only, deliberately conjectural |
| Growth-Q entropy route | Bounded primitive smooth-support route corrected to L1-weighted signed-kernel energy framework |
| Growth-Q red-team status | Critical corrections recorded: entropy formula status, support-3 classification status, unbounded-support cardinality, and collision-counting convention |
| B=6 Lean milestone | Consolidated update note added; exact-order bridge and clean B=6 certificate reported |
| Fixed-Q gate programme | Substantive theorem-candidate architecture |
| Singleton-side result | Theorem candidate / subclass result, subject to proof audit |
| Q-ledger addendum | Current best fixed-Q progress/correction |
| Raw transcript | Archive only; not the curated mathematical report |

## Reviewer Summary

Start with [`SUBSIDY_SUMMARY.md`](SUBSIDY_SUMMARY.md) for the one-page
reviewer-facing summary. The public site source is [`index.html`](index.html).

Latest Growth-Q formal backbone checkpoint:

- `references/growth-q-formal-backbone-2026-06-08.md` - Formal-backbone checkpoint. Records the reported Lean-proved exact collision-count theorem `#Collisions = 2^k + Σ_s E_s(Q)·2^(k-s)`, rational `CP(Q)` corollary, unbounded-support cardinality theorem, Smooth23 Type III correction, and non-claims.
- `references/growthq-formal-backbone-status-2026-06-08.md` - Status ledger for the Aristotle bundle. Separates reported proved theorems, deliberate conjectures, computational evidence, and remaining open problems.

Latest Growth-Q checkpoint:

- `references/growth-q-energy-freeze-2026-06-08.md` - Growth-Q entropy route freeze note. Records the correction from the false bounded primitive smooth-support route to the L1-weighted signed-kernel energy framework. Explicitly labels the current state as a research checkpoint, not a proof of Erdős #319.
- `references/growth-q-red-team-checklist-2026-06-08.md` - Red-team checklist recording the four critical corrections before writing the public note: entropy formula is algebraic unless separately Lean-proved, support-3 completeness is not yet a single Lean theorem, universal cardinality needs audit, and collision counting must specify ordered pairs / reduced signed kernels.

Latest Lean milestone update:

- `references/codex-update-erdos319-2026-06-05.md` - Codex upload/project update noting the B=6 milestone, exact-order bridge, clean subgroup-count theorem, B=10 placeholder caveat, and recommended audit commands.

Progress report files:

- `references/erdos319-progress-report.pdf`
- `references/erdos319-progress-report.docx`
- `references/erdos319-progress-report.md`
- `references/erdos319-lean-blueprint.lean`

Q-ledger addendum files:

- `references/erdos319-q-ledger-addendum-v02.pdf`
- `references/erdos319-q-ledger-addendum-v02.docx`
- `references/erdos319-q-ledger-addendum-v02.md`
- `references/erdos319-lean-addendum-q-ledger.lean`

Archive:

- `references/doc.pdf` - raw conversation archive only; not the curated mathematical report.

Release package:

- `v0.2-progress-package` contains the downloadable PDF/DOCX/MD/Lean assets.
- `v0.3-b6-milestone-update` contains the Codex update note and core package assets.
- `v0.4-growth-q-energy-freeze` contains the Growth-Q freeze note and red-team checklist.
- `v0.5-growth-q-formal-backbone` should contain the formal-backbone checkpoint, Aristotle status ledger, selected Lean files, Kaggle staircase summaries, and the Aristotle archive where available.
