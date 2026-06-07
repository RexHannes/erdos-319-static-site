# Growth-Q Red-Team Checklist — 8 June 2026

This checklist records the red-team constraints for the Growth-Q entropy note. It should be checked before converting the checkpoint into a public research note or PDF.

## Core banned / required wording

### Erdős #319 positioning

Banned:

> We propose a route to solve Erdős #319.

Required:

> We propose a structural framework for the rigid branch of the growing-Q obstruction in Erdős #319.

### Bounded support

Banned:

> We proved that smooth reciprocal sets have bounded primitive support.

Required:

> We formalized or recorded the disproof of bounded primitive support via Egyptian-tree refinements, and shifted to an L1-weighted energy decomposition.

### Computation

Banned:

> Computation proves short-energy dominance.

Required:

> Exhaustive scans and targeted smooth sampling provide evidence that short identities dominate the observed entropy deficit in tested regimes.

## Four critical corrections

### 1. Entropy formula status

Unsafe:

> The entropy formula `D(Q) = log₂(1 + Σ E_s(Q)2^{-s})` is Lean-proved.

Safe:

> The exact collision-count decomposition is Lean-proved or Lean-supported. The entropy formula follows by elementary algebra from that decomposition, unless the Lean file contains the displayed entropy theorem as a named no-sorry theorem.

Reason: the Lean file reportedly proves `collisionPairs_card_eq_sum`; the conversion to `CP(Q)`, `H₂(Q)`, and `D(Q)` may not be assembled as one theorem.

### 2. Support-3 classification status

Unsafe:

> We give a complete Lean classification of all support-3 identities.

Safe:

> Type I and Type II families are proved or checked, and an axis-aligned rectangle impossibility is proved. Completeness is argued in Markdown/computational analysis unless a single assembled Lean theorem exists.

### 3. Unbounded-support cardinality status

Unsafe:

> For all `t`, Lean proves the family has support exactly `3+2t`.

Safe:

> The inductive chain-sum theorem verifies the reciprocal identity for all `t`. Specific cardinalities may be confirmed for small `t`; the general cardinality formula should be separately audited unless a universal Lean theorem is present.

### 4. Collision-counting convention

Unsafe:

> Each kernel vector contributes `2^{-s}` without specifying the counting convention.

Safe:

> Count ordered colliding subset pairs `(U,V)`. After cancelling the overlap, each collision has a canonical disjoint signed support `(A,B)`. An oriented reduced kernel vector of support `s` gives `2^{k-s}` ordered collision pairs, yielding the weighted term `E_s(Q)2^{-s}` after normalization.

## Dominant Short-Energy Conjecture

The correct conjectural target is not merely that long identities are individually negligible. A single support-100 identity contributes only `2^{-100}`, but if `E_100 ≈ 2^95`, the weighted contribution is `≈2^{-5}`, which is macroscopic.

Therefore the intended conjecture should be formulated as:

> For fixed smoothness parameter `y` and every `δ > 0`, there exist constants `C` and `c > 0` such that `D(Q) ≥ δ` implies `Σ_{s≤C} E_s(Q)2^{-s} ≥ c`.

This is stronger and more accurate than saying "long identities do not matter."

## Research-note outline

Suggested title:

> Reciprocal Subset-Sum Entropy and Signed-Kernel Energy in Smooth Egyptian-Fraction Identities

Suggested sections:

1. Introduction: Erdős #319, primitive signed reciprocal circuits, growing-Q obstacle, Rényi entropy `H₂(Q)`, deficit `D(Q)`.
2. Failure of bounded primitive support: Egyptian-tree refinements and the unbounded smooth-support family.
3. Exact energy-spectrum decomposition: collision count first; entropy deficit as algebraic corollary.
4. Computational evidence: exhaustive small scans, smooth random scans, waterfall drop after forbidding support `≤6` identities.
5. Dominant Short-Energy Conjecture: precise formulation and weaker shortest-vector corollary.
6. Bridge to Erdős #319: clearly labelled open realization step from internal Q-structure to P-side target hits.

## Final pre-publication checklist

Before public PDF / GitHub release, verify:

- [ ] no statement says #319 is solved;
- [ ] no statement says arbitrary fixed-Q or growing-Q is solved;
- [ ] no statement labels the entropy formula Lean-proved unless a named theorem exists;
- [ ] no statement claims complete support-3 classification in Lean unless assembled;
- [ ] unbounded-support cardinality is stated at the correct proof-status level;
- [ ] computational tables are labelled evidence, not proof;
- [ ] the exponentially-many-long-identities caveat is explicit;
- [ ] the direct #319 bridge is labelled as open.
