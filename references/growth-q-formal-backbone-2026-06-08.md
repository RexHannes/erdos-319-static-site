# Growth-Q Formal Backbone Checkpoint — 8 June 2026

This note records the Aristotle formalization checkpoint for the Growth-Q entropy route. It is a research-artifact checkpoint, not a proof of Erdős #319 and not a proof of the Dominant Short-Energy Conjecture.

## Executive summary

The Growth-Q project now has a Lean-facing formal backbone for the energy-spectrum framework:

```text
# ordered subset-sum collisions
= 2^k + Σ_s E_s(Q) · 2^(k-s)
```

where `k = |Q|` and `E_s(Q)` counts oriented nonzero reduced signed kernel vectors of support `s`.

This exact finite counting theorem gives the computational staircase experiments a precise interpretation: removing a support layer removes its corresponding weighted energy contribution.

## Status ledger

| Component | Status |
|---|---|
| Full Erdős #319 | Open |
| Claimed solution | No |
| Dominant Short-Energy Conjecture | Open / stated as conjecture only |
| Exact collision-count theorem | Reported Lean-proved theorem, zero-sorry except conjecture file |
| Rational collision probability corollary | Reported Lean-proved theorem |
| Logarithmic entropy formula | Algebraic/log corollary; not the main Lean theorem |
| Unbounded smooth primitive support | Reported Lean-proved with all-`t` cardinality theorem |
| Smooth23 classification | Type I/II/III families proved; completeness not Lean-proved |
| Kaggle y=13 staircase | Computational evidence, not theorem |

## Level 1: exact collision-count theorem

Primary theorem:

```text
collisionPairs_card_eq_diagonal_add_energy
```

in:

```text
RequestProject/EnergySpectrumExact.lean
```

Reported statement:

```text
#{ ordered collisions (U,V) : U,V ⊆ Q, R(U)=R(V) }
  = 2^k + Σ_{s=1}^{k} E_s(Q) · 2^{k−s}
```

The theorem formalizes the ordered-pair convention used in the computational scripts. The zero vector / diagonal pairs contribute `2^k`; nonzero signed kernel vectors are grouped by support size.

Supporting structure:

- `EnergySpectrum.lean` proves the fiber-level identity `#Collisions = Σ_{v∈Λ(Q)} 2^(k − ‖v‖₁)`.
- `EnergySpectrumExact.lean` splits off the diagonal and groups nonzero kernel vectors by support.
- Explicit overlap/kernal round-trip lemmas are reported as `collisionToKernel_kernelOverlap` and `kernelOverlap_roundtrip`.

## Level 2: rational CP corollary

Primary theorem:

```text
collisionProbability_eq
```

in:

```text
RequestProject/CollisionProbability.lean
```

Reported statement:

```text
CP(Q) = (1 + Σ_s E_s(Q) · 2^(-s)) / 2^k.
```

This supports the usual entropy-deficit expression

```text
D(Q) = log₂(1 + Σ_s E_s(Q) · 2^(-s))
```

as an algebraic/logarithmic corollary. The logarithmic entropy statement should still be labelled as a corollary outside the main Lean theorem unless a separate Lean theorem over real logs is added.

## Level 3: unbounded primitive support

Primary theorem:

```text
Bt_card_eq
```

Reported statement:

```text
|B_t| = 2 + 2t
```

for all `t`, upgrading the previous small-`t` `native_decide` checks.

The construction is based on

```text
1/6 = 1/8 + 1/24
1/n = 1/(2n) + 1/(3n) + 1/(6n)
```

and gives an unbounded-support family among `(2,3)`-smooth composite denominators.

This confirms that the naive bounded primitive support route is false. The corrected framework is therefore energy compression / dominant short-energy, not bounded primitive support.

## Level 4: Smooth23 audit and Type III correction

A missing Type III support-3 family was found and proved:

```text
1/(2^a·3^b) + 1/(2^(a-3)·3^b) = 1/(2^a·3^(b-2))
```

for suitable `a ≥ 3, b ≥ 2`.

The Lean theorem is reported as:

```text
smooth23_typeIII_identity
```

The correct label discipline is:

- Type I, Type II, Type III families: proved.
- Completeness of the three-family classification: not Lean-proved; currently Markdown/S-unit-equation level.

## Level 5: conjecture statement

`DominantShortEnergy.lean` reportedly contains formal statements of:

- `dominantShortEnergy_conjecture`
- `shortestVector_conjecture`

Both are intentionally left as `sorry` and clearly labelled conjectural.

This is acceptable as long as the repository and note do not treat these conjectures as proved.

## Level 6: inverse-lemma infrastructure

`InverseLemma.lean` reportedly proves basic algebra for signed kernel vectors, including:

- disjoint-support kernel vectors compose;
- negation preserves kernel membership;
- support is preserved under negation;
- documentation of why a naive coding-theoretic long-to-short argument fails for `{-1,0,1}` vectors.

This is useful infrastructure, but it is not yet a proof of the Dominant Short-Energy Conjecture.

## Kaggle staircase checkpoint

The current y=13 adversarial experiments give the following finite computational staircase:

| Filter | Best D | Min support | Tail / total weight |
|---|---:|---:|---:|
| anti-support ≤ 6 | 0.221587 | 7 | 0.166016 |
| anti-support ≤ 7 | 0.068778 | 8 | 0.048828 |
| anti-support ≤ 8 | 0.019591 | 9 | 0.013672 |

Exact spectra for the first two best candidates are small finite clusters, not uncontrolled long-tail growth:

```text
anti≤6 best: E_7=12, E_8=14, E_9=8, E_10=2
anti≤7 best: E_8=8, E_9=8, E_10=2
```

Interpretation: in the tested `y=13,N=80,k=10` require-13 regime, adversarial deficit is concentrated near the first available support layer and collapses when that layer is forbidden. This supports the Dominant Short-Energy picture, but remains finite computational evidence.

## Non-claims

This checkpoint does not claim:

- a solution to Erdős #319;
- a proof of the Dominant Short-Energy Conjecture;
- a proof of the logarithmic entropy theorem in Lean;
- a Lean proof of Smooth23 classification completeness;
- any asymptotic result as `y,k,N → ∞`.

## Recommended next direction

The best next formal target is not the full conjecture immediately. The recommended order is:

1. audit the Lean bundle and theorem labels;
2. attempt a rigorous `(2,3)`-smooth / y=3 completeness theorem using the S-unit equation or a finite exponent-normalized classification;
3. prove finite or semi-finite Dominant Short-Energy statements for y=3;
4. only then attempt broader y-smooth inverse theorems.
