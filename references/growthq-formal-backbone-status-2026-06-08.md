# Growth-Q Formal Backbone Status Ledger — 8 June 2026

This status ledger summarizes the Aristotle bundle `dense 3.gz`. It records what is reported as Lean-proved, what is deliberately conjectural, and what remains outside the formal proof.

## Build and audit status reported by Aristotle

| Item | Status |
|---|---|
| `lake build` | PASS, 8036 jobs, 0 errors |
| Remaining `sorry` | 2, both deliberate conjectures in `DominantShortEnergy.lean` |
| Remaining `admit` / custom `axiom` / `unsafe` | 0 reported |
| Main theorem axioms | `propext`, `Classical.choice`, `Quot.sound` only reported |
| Full #319 proof | Not claimed |
| Dominant Short-Energy Conjecture | Not proved |

## Core completed theorem families

### `EnergySpectrum.lean`

| Theorem | Meaning | Status |
|---|---|---|
| `collision_iff_kernel` | subset-sum collision iff signed difference vector lies in reciprocal kernel | Reported proved |
| `sign3Fiber_card` | fiber over a sign vector has cardinality `2^(zero count)` | Reported proved |
| `sign3ZeroCount_add_support` | zero count + support = `k` | Reported proved |
| `collisionPairs_card_eq_sum` | `#Collisions = Σ_{v∈Λ(Q)} 2^(k − ‖v‖₁)` | Reported proved |
| `sign3Fiber_biUnion` / disjointness lemmas | fibers partition ordered pairs | Reported proved |

### `EnergySpectrumExact.lean`

| Theorem | Meaning | Status |
|---|---|---|
| `collisionPairs_split_diagonal` | zero-vector diagonal contribution splits off as `2^k` | Reported proved |
| `collisionPairs_card_eq_diagonal_add_energy` | `#Collisions = 2^k + Σ_s E_s(Q) · 2^(k−s)` | Reported proved |
| `collisionToKernel_kernelOverlap` | collision to kernel/overlap round-trip | Reported proved |
| `kernelOverlap_roundtrip` | kernel/overlap to collision round-trip | Reported proved |

### `CollisionProbability.lean`

| Theorem | Meaning | Status |
|---|---|---|
| `collisionProbability_eq` | `CP(Q) = (1 + Σ_s E_s(Q)·2^(-s)) / 2^k` | Reported proved |
| `one_le_deficitProxy` | `Z(Q) ≥ 1` | Reported proved |
| `deficitProxy_eq_one_of_no_collisions` | no collisions implies `Z(Q)=1` | Reported proved |

### `UnboundedSupport.lean`

| Theorem | Meaning | Status |
|---|---|---|
| `refinement_identity` | `1/n = 1/(2n)+1/(3n)+1/(6n)` | Reported proved |
| `chainSum_eq_sixth` | reciprocal sum of `B_t` equals `1/6` for all `t` | Reported proved |
| `Bt_card_eq` | `|B_t| = 2 + 2t` for all `t` | Reported proved |
| `support_unbounded_with_identity` | support is unbounded while identity sum persists | Reported proved |

### `Smooth23.lean`

| Theorem | Meaning | Status |
|---|---|---|
| `smooth23_typeI_identity` | Type I support-3 family | Reported proved |
| `smooth23_typeII_identity` | Type II support-3 family | Reported proved |
| `smooth23_typeIII_identity` | newly found Type III support-3 family | Reported proved |
| `no_rectangle_identity` | no axis-aligned rectangle gives a `2+2` identity | Reported proved |
| `diamond_identity_false` | proposed diamond identity is false | Reported proved |

Important caveat: completeness of the support-3 classification is **not** reported as Lean-proved. It remains at Markdown / S-unit equation level.

### `InverseLemma.lean`

| Theorem | Meaning | Status |
|---|---|---|
| `kernel_add_disjoint` | disjoint-support kernel vectors compose | Reported proved |
| `kernel_neg` | negation preserves kernel membership | Reported proved |
| `sign3Neg_support` | negation preserves support | Reported proved |

## Deliberate conjectures

| Conjecture | File | Status |
|---|---|---|
| `dominantShortEnergy_conjecture` | `DominantShortEnergy.lean` | `sorry` by design, open |
| `shortestVector_conjecture` | `DominantShortEnergy.lean` | `sorry` by design, open |

These are not proof failures if the file clearly labels them conjectural. They should not be counted as proved results.

## Mathematical interpretation

The exact combinatorial identity now gives a formal interpretation to the weighted energy spectrum:

```text
#Collisions = 2^k + Σ_s E_s(Q)·2^(k-s)
CP(Q) = (1 + Σ_s E_s(Q)·2^(-s)) / 2^k.
```

Thus, the computational `E_s 2^(-s)` staircase is not a heuristic normalization; it is the finite counting normalization arising from ordered subset collisions and reduced signed kernel supports.

## Computational checkpoint connected to this formalization

The current Kaggle y=13 adversarial staircase is:

| Filter | Best D | Min support | Tail / total weight |
|---|---:|---:|---:|
| anti-support ≤ 6 | 0.221587 | 7 | 0.166016 |
| anti-support ≤ 7 | 0.068778 | 8 | 0.048828 |
| anti-support ≤ 8 | 0.019591 | 9 | 0.013672 |

The best anti≤6 spectrum is:

```text
E_7=12, E_8=14, E_9=8, E_10=2.
```

The best anti≤7 spectrum is:

```text
E_8=8, E_9=8, E_10=2.
```

This is finite computational evidence for bounded short-energy dominance in the tested regime, not a theorem.

## What remains open

- Dominant Short-Energy Conjecture.
- Any asymptotic control as `y,k,N` grow.
- Smooth23 classification completeness in Lean.
- The analytic / target-realization bridge back to Erdős #319.
- Erdős #319 itself.

## Recommended next formal target

The next formal target should be a restricted `(2,3)`-smooth / `y=3` completeness or finite-energy theorem, not an immediate attempt at the full Dominant Short-Energy Conjecture.
