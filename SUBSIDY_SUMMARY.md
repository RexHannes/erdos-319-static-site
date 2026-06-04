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

## What Is Not Claimed

- No solution of full Erdős #319 is claimed.
- No sorry-free Lean proof is claimed.
- Arbitrary fixed `Q` is not claimed solved.
- The Liu-Sawhney reachability interface is not claimed fully verified.
- The raw chat transcript is archive material only, not a curated proof.

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
