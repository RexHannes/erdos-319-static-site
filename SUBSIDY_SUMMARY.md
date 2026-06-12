# Subsidy Summary: Erdős #319 Progress Package

This repository is a progress record and formalization blueprint, not a claimed
solution of Erdős Problem #319.

## What Was Achieved

- Reframed Erdős #319 as a primitive signed reciprocal circuit problem.
- Isolated the elementary `P`/`Q` subset-sum spectrum-intersection criterion.
- Built a Lean-facing scaffold separating elementary combinatorics from
  analytic black-box inputs.
- Organized a fixed-negative-side (`fixed-Q`) programme around gate lemmas,
  target selection, and reachability.
- Added the Q-ledger correction: the one-line cross-number closure is rejected
  by the composite cyclic-group counterexample, so arbitrary fixed `Q` remains
  open.
- Added a 2026-06-05 Codex update note recording a B=6 formal milestone:
  exact-order bridge, cleaned subgroup-count theorem, clean B=6 obstruction
  certificate, and audit caveats around remaining `sorry` placeholders.

## What Is Not Claimed

- No solution of full Erdős #319 is claimed.
- No sorry-free Lean proof is claimed.
- Arbitrary fixed `Q` is not claimed solved.
- The Liu-Sawhney reachability interface is not claimed fully verified.
- No raw chat transcript is published as part of this curated proof package.

## Why It Matters

The value of the package is not a final theorem. It converts a vague attack on
Erdős #319 into auditable components: formal definitions, elementary Lean proof
obligations, fixed-`Q` theorem candidates, explicit analytic interfaces, and a
recorded correction preventing overclaiming.

## Current Best Status

| Item | Status |
|---|---|
| Problem and notation | Stable |
| Primitive circuit definition | Elementary / formalizable |
| Spectrum-intersection criterion | Lean-verifiable target; proof obligation remains |
| B=6 obstruction certificate | Reported as the current clean formal milestone in the Codex update note |
| Singleton-side optimality | Candidate subclass result; proof audit needed |
| Fixed-Q dynamic gate | Promising partial theorem candidate |
| Sigma_Q joint gate | Likely useful lemma candidate |
| Prime-only fixed Q | Conditional on reachability |
| Composite/mixed Q | Reduced to target-selection / zero-sum / cross-number obstruction |
| Growing Q_N | Long-term / unresolved |
| Full Erdős #319 | Open |

## Next Proof Obligations

- Audit the exact Liu-Sawhney proposition and pruning lemmas.
- Prove the elementary spectrum-intersection criterion in Lean.
- Formalize the fixed-`Q` gate contradiction.
- Test target-selection obstructions for composite `Q`.
- Separate provable finite/computational certificates from conjectural analytic
  bridges.
- Treat B=6 as frozen and continue next with the B=10 certificate, without
  claiming the whole repository is sorry-free while the B10 placeholder remains.
