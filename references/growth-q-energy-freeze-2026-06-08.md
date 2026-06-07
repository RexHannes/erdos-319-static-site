# Growth-Q Entropy Route Freeze — 8 June 2026

This note is a checkpoint for the Erdős #319-related Growth-Q entropy route. It is a progress record and research-artifact index, not a claimed proof of Erdős #319.

## Executive status

The previous naive route has been corrected:

> Primitive smooth reciprocal identities do **not** have bounded total support in the naive sense needed for the original route.

The current corrected route is:

> Study reciprocal subset-sum collision probability through an `L^1`-weighted signed-kernel energy spectrum.

The new target is therefore not bounded primitive support, but energy compression / dominant short-energy behaviour.

## Current status ledger

| Item | Status |
|---|---|
| Full Erdős #319 | Open |
| Claimed solution | No |
| Bounded primitive smooth support route | False / abandoned as a proof route |
| Unbounded smooth support family | Reported Lean milestone; construction verified by the inductive chain-sum theorem, with cardinality claims to be separately audited |
| Collision-count decomposition | Reported Lean-proved component, subject to file-level no-sorry audit |
| Entropy deficit formula | Algebraic corollary of the collision-count decomposition; do **not** label as a standalone Lean theorem unless such a theorem is present |
| Support-3 smooth identity classification | Type I / Type II families and an impossibility result are proved or checked; completeness should be labelled Markdown/computational unless a single Lean theorem is assembled |
| Kaggle energy-spectrum runs | Finite computational evidence, not theorem |
| Direct bridge to #319 | Still open and not yet claimed |

## Formal component: unbounded smooth support

The reported formal milestone constructs an infinite family of reciprocal identities among `(2,3)`-smooth composite denominators. The seed identity is

```text
1/6 = 1/8 + 1/24
```

and the recursive splitting rule is

```text
1/n = 1/(2n) + 1/(3n) + 1/(6n).
```

A convenient family is

```text
B_t = {8} ∪ {48·6^i, 72·6^i : 0 ≤ i < t} ∪ {24·6^t}.
```

The inductive chain-sum theorem verifies the reciprocal-sum construction for all `t`. The general cardinality statement, such as `|B_t| = 2 + 2t` or total signed support `3 + 2t`, should be treated as structurally clear but separately audited unless a universal Lean theorem is present. In particular, if the Lean file only confirms specific cardinalities by `native_decide` for small `t`, the note should say so.

**Important label discipline:** unless the exact `UnboundedSupport.lean` file and `#print axioms` / no-sorry logs are attached, the public note should say "reported Lean milestone" rather than overstate a verified theorem.

## Corrected energy framework

For a finite denominator set `Q`, let `k = |Q|` and define

```text
R(U) = sum_{q in U} 1/q,
Σ(Q) = { R(U) : U ⊆ Q },
μ_Q(x) = 2^(-k) #{ U ⊆ Q : R(U) = x },
CP(Q) = Σ_x μ_Q(x)^2,
H₂(Q) = -log₂ CP(Q),
D(Q) = k - H₂(Q).
```

The clean counting convention is as follows. Count ordered collision pairs `(U,V)` with `U ≠ V` and `R(U)=R(V)`. After cancelling the overlap `U ∩ V`, each collision has a canonical disjoint signed support `(A,B)` with `A ∩ B = ∅` and `R(A)=R(B)`. Equivalently, it corresponds to an oriented signed kernel vector

```text
v ∈ {-1,0,1}^Q,   v ≠ 0,   Σ_q v_q/q = 0.
```

For `v` of support size `s`, there are exactly `2^(k-s)` choices of common outside overlap, hence exactly `2^(k-s)` ordered colliding pairs produced by that oriented reduced kernel vector. Therefore, if `E_s(Q)` counts oriented nonzero reduced signed kernel vectors of support `s`, then

```text
# ordered colliding pairs = 2^k + Σ_{s≥1} E_s(Q) 2^(k-s),
CP(Q) = 2^(-k) (1 + Σ_{s≥1} E_s(Q) 2^(-s)),
D(Q) = log₂(1 + Σ_{s≥1} E_s(Q) 2^(-s)).
```

**Red-team correction:** the collision-count decomposition may be Lean-proved as `collisionPairs_card_eq_sum`, but the displayed entropy-deficit formula should be described as an algebraic corollary unless the Lean file contains this exact theorem.

This is the key correction: long reciprocal identities are not automatically fatal, because their collision contribution is exponentially downweighted by support size. The remaining analytic/combinatorial question is whether there can be exponentially many long identities, for example `E_100 ≈ 2^95`, whose weighted contribution `E_100 2^(-100) ≈ 2^(-5)` is still macroscopic.

## Dominant Short-Energy Conjecture

The mature conjectural target is not "long identities do not matter." The correct target is dominant short-energy:

> For fixed smoothness parameter `y` and every `δ > 0`, there should exist constants `C` and `c > 0` such that, for every tested or admissible denominator set `Q` in the relevant `y`-smooth universe, if `D(Q) ≥ δ`, then
>
> ```text
> Σ_{1≤s≤C} E_s(Q) 2^(-s) ≥ c.
> ```

A weaker possible corollary is a shortest-vector statement: positive entropy deficit forces some nonzero signed kernel vector with bounded `L^1` norm / support. This weaker form is useful but may miss cases where many medium-length identities collectively dominate.

## Computational evidence recorded so far

The current finite experiments support, but do not prove, short-energy dominance.

### Smooth `y=7`, `N=50`

After forbidding identities of support at most `6`, random scans for `k=8,...,12` found best examples with small entropy deficits, typically around `0.04` to `0.12` bits, and minimum remaining relation support `7`.

### Smooth `y=11`, `N=60`, `k=10`

The unrestricted anti-support-`≤6` scan and the require-11 scan both retained small deficits and minimum remaining relation support `7`. The require-11 diagnostic reduced the concern that the `y=11` examples were merely old `y=7` clusters.

### Identity-family diagnostic

For both `y=7` and require-11 `y=11` tests, top support-7 relation families appeared dispersed rather than dominated by a single repeated identity family.

**Evidence label:** these are random finite computational checks. They justify further experiments and a technical note, not a theorem and not a proof of #319.

## Interpretation

The failed route was:

> prove primitive smooth reciprocal identities have bounded support.

The corrected route is:

> even though primitive smooth identities can have unbounded support, collision energy may still be controlled if the weighted signed-kernel energy is dominated by short or locally generated identities.

The research problem is now an energy-compression problem, not a bounded-support problem.

## Required wording discipline

Use:

> We propose a structural framework for the rigid branch of the growing-`Q` obstruction in Erdős #319.

Do not use:

> We propose a route to solve Erdős #319.

Use:

> Exhaustive scans and targeted smooth sampling provide evidence that short identities dominate the observed entropy deficit.

Do not use:

> Computation proves short-energy dominance.

Use:

> The exact collision-count decomposition is Lean-proved or Lean-supported, and the entropy formula follows algebraically.

Do not use:

> The entropy-deficit formula is Lean-proved.

unless that exact theorem appears in the Lean file and passes no-sorry audit.

## Recommended next actions

1. Freeze the current artifact bundle.
2. Red-team theorem-status labels and overclaims.
3. Publish a clean GitHub note separating theorem, computation, heuristic, and conjecture.
4. Run multi-seed `y=7,11,13`, `k=8,...,12` energy-spectrum checks only after the freeze note is stable.
5. Delay the direct #319 bridge until the energy-spectrum framework is cleanly documented.

## Artifact checklist

The intended reproducibility bundle should contain:

- `FinalGrowthQStatus.md`
- `EnergySpectrum.lean`
- `UnboundedSupport.lean`
- `Smooth23Analysis.md`
- Kaggle energy-spectrum CSVs
- Aristotle tar.gz archive
- scanner scripts used to compute `E_s(Q)` and entropy deficits

## Non-claims

This checkpoint does **not** claim:

- a solution to Erdős #319;
- an upper bound matching the Adenwalla/Croot lower bound;
- arbitrary fixed-`Q` closure;
- growing-`Q_N` closure;
- a fully audited Lean project unless the no-sorry artifact is attached;
- that random finite evidence proves short-energy dominance;
- that the entropy-deficit formula is already a standalone Lean theorem unless verified;
- that support-3 identities are completely classified in Lean unless a single assembled theorem exists.

## One-line summary

The Growth-Q route has moved from a false bounded-support conjecture to a more realistic `L^1`-weighted signed-kernel energy programme. This is a useful research checkpoint and portfolio artifact, but not a proof of Erdős #319.
