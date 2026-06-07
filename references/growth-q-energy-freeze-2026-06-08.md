# Growth-Q Entropy Route Freeze — 8 June 2026

This note is a checkpoint for the Erdős #319-related Growth-Q entropy route. It is a progress record and research-artifact index, not a claimed proof of Erdős #319.

## Executive status

The previous naive route has been corrected:

> Primitive smooth reciprocal identities do **not** appear to have bounded total support.

The current corrected route is:

> Study reciprocal subset-sum collision probability through an `L^1`-weighted signed-kernel energy spectrum.

The new target is therefore not bounded primitive support, but energy compression / short-energy dominance.

## Current status ledger

| Item | Status |
|---|---|
| Full Erdős #319 | Open |
| Claimed solution | No |
| Bounded primitive smooth support route | False / abandoned as a proof route |
| Unbounded smooth support family | Reported Lean milestone; keep with artifact bundle and audit logs |
| Collision-energy identity | Framework / formalization target; label as Lean-proved only after zero-sorry audit |
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
B_t = {8} ∪ {48·6^i, 72·6^i : 0 ≤ i < t} ∪ {24·6^t},
```

with reciprocal sum `1/6` and support growing linearly in `t`. In signed-circuit form, this gives identities with unbounded support.

**Important label discipline:** unless the exact `UnboundedSupport.lean` file and `#print axioms` / no-sorry logs are attached, the public note should say "reported Lean milestone" rather than overstate a verified theorem.

## Corrected energy framework

For a finite denominator set `Q`, define

```text
R(U) = sum_{q in U} 1/q,
Σ(Q) = { R(U) : U ⊆ Q },
μ_Q(t) = 2^(-|Q|) #{ U ⊆ Q : R(U) = t },
CP(Q) = Σ_t μ_Q(t)^2.
```

Equivalently, if `v ∈ {-1,0,1}^Q` is a signed kernel vector satisfying

```text
Σ_q v_q / q = 0,
```

and `supp(v)` has size `s`, then that signed vector contributes with probability weight `2^{-|Q|-s}`. If `E_s(Q)` counts such signed kernel vectors of support `s`, then

```text
CP(Q) = 2^{-|Q|} Σ_s E_s(Q) 2^{-s}.
```

This is the key correction: long reciprocal identities are not automatically fatal, because their collision contribution is exponentially downweighted by support size. The remaining analytic/combinatorial question is whether there can be enough long identities to dominate the weighted energy.

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

> even though primitive smooth identities can have unbounded support, collision energy may still be controlled because long signed-kernel vectors are exponentially downweighted.

The research problem is now an energy-compression problem, not a bounded-support problem.

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
- that random finite evidence proves short-energy dominance.

## One-line summary

The Growth-Q route has moved from a false bounded-support conjecture to a more realistic `L^1`-weighted signed-kernel energy programme. This is a useful research checkpoint and portfolio artifact, but not a proof of Erdős #319.
