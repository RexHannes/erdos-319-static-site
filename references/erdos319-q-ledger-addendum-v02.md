# Erdos #319 - Q-Ledger Addendum v0.2

**Purpose.** This addendum updates the earlier Erdos #319 progress package. It is not a replacement for the full progress report. It records the new status after the final messages in the uploaded transcript, especially the verifiable formulation on fixed `Q`, arbitrary fixed `Q`, the `sigma_Q` joint gate, and the cross-number correction.

**Headline.** The project should now be framed as:

> We have not solved Erdos #319. We have, however, made serious fixed-`Q` progress. The arbitrary fixed-`Q` problem is now closer because it has been reduced to a precise target-selection / finite zero-sum / cross-number obstruction problem. Growing `Q_N` and the full problem remain long-term.

This is a stronger and cleaner position than the earlier report, but it is not a claim of completion.

---

## 1. Delta from the previous report

The previous report already said: fixed-`Q` gate theorem candidate plausible; Liu-Sawhney interface still pending; arbitrary `Q` and growing `Q_N` unsolved.

The update is that the end of the transcript adds a sharper internal ledger:

1. The `Phi_q` gate is a mostly elementary/checkable analytic inequality.
2. The fixed-`Q` singleton-gate theorem candidate is still not fully verified, but its proof architecture is clean.
3. The arbitrary fixed-`Q` problem is now expressed as a target-selection problem over
   `T_Q = { R(Q') : empty != Q' subsetneq Q }`.
4. A dynamic single-prime gate lemma candidate was isolated.
5. A joint-avoidance / `sigma_Q` gate appears to be a genuinely provable fixed-`Q` lemma.
6. Prime-only fixed `Q` is likely close, conditional on the Liu-Sawhney reachability interface.
7. Composite/mixed fixed `Q` reduces to a finite target-selection obstruction.
8. The target-selection obstruction has a natural finite abelian-group / zero-sum / cross-number formulation.
9. The attempted one-line cross-number closure failed; the failure is important and must be preserved.

---

## 2. Global notation

Let

```text
R(X) := sum_{x in X} 1/x,

theta := 1 - 1/e.
```

Write a signed reciprocal circuit as two sides

```text
P, Q subseteq {1,...,N},     R(P) = R(Q).
```

The circuit is primitive if there is no non-empty proper pair

```text
P' subseteq P,     Q' subseteq Q
```

such that

```text
R(P') = R(Q').
```

For fixed `Q`, write

```text
S_Q := R(Q).
```

The fixed-`Q` programme aims to prove statements of the form:

```text
|P| >= (theta + epsilon) N and R(P) = S_Q
    implies the circuit is not primitive.
```

This would be a serious fixed-negative-side obstruction. It would not, by itself, solve full Erdos #319.

---

## 3. Updated status table

| Layer | Current status | What is new in this addendum | Distance to full #319 |
|---|---|---|---|
| Concrete example `Q=(3,5,7,9,11,13,15,17)` | Strong numerical sanity check | Keep as example-level evidence only | Very far |
| Fixed-`Q` singleton gate | Strong architecture, not fully verified | Needs exact Liu-Sawhney parameter audit | Meaningful partial result if completed |
| Minimal-over-one fixed `Q` | Promising but technical | May feed into singleton-gate theorem | Partial |
| Arbitrary fixed `Q` | Closer but still open | Now reduced to target-selection / zero-sum / cross-number | Medium-far |
| Prime-only fixed `Q` | Likely close conditional on reachability | `sigma_Q` joint gate gives a cleaner route | Partial, plausible |
| Composite/mixed fixed `Q` | Main finite obstruction | Need prove/disprove target-selection lemma | Open |
| Growing `Q_N` | Long-term | Constants may decay; uniform estimates needed | Far |
| Full Erdos #319 | Open | Needs two-sided spectrum/intersection theorem | Far |

---

## 4. The `Phi_q` gate

Define `Phi_q(u)` as the minimum reciprocal mass of `uN` integers in `[1,N]` avoiding multiples of `q`. The working formula is

```text
Phi_q(u) = (1 - 1/q) * log( (1 - 1/q) / (1 - 1/q - u) ).
```

**Verification route.** Sort the nonmultiples of `q` in `[1,N]`; the reciprocal sum is minimized by choosing the largest `uN` such nonmultiples; approximate by an integral; recover the displayed formula.

**Status.** Essentially elementary/checkable, subject to finite-`N` error terms.

---

## 5. Fixed-`Q` singleton-gate theorem candidate

Let `D in Q`. Suppose

```text
S_Q < min_{p^a || D} Phi_{p^a}(theta).
```

The intended theorem is:

```text
For every epsilon > 0, for all sufficiently large N,
there is no primitive circuit with fixed Q, arbitrary P,
|P| >= (theta + epsilon)N, and R(P)=S_Q.
```

**Intended proof architecture.**

1. The `Phi` gate forces positive local mass in `P` at every prime power `p^a || D`.
2. Liu-Sawhney reachability should produce `B subseteq P` with `R(B)=1/D`.
3. Then `B union {D}` is a proper signed zero-subcircuit, contradicting primitivity.

**Status.** Strong proof architecture, not yet a fully verified theorem.

**Remaining verification.** Liu-Sawhney Proposition 5.2 parameter interface; smoothness/bounded-`Omega`/local-mass pruning; exact target `1/D`; Archimedean window.

---

## 6. Dynamic single-prime gate

For a prime `p`, define

```text
P_p := { n in P : p divides n },
alpha := p R(P_p).
```

Since

```text
|P_p| <= N R(P_p) = alpha N / p,
```

the set `P_not_p := P \ P_p` has density at least

```text
theta + epsilon - alpha/p.
```

Applying the `Phi_p` bound to `P_not_p` gives

```text
S_Q - alpha/p >= Phi_p(theta + epsilon - alpha/p).
```

Thus if

```text
S_Q < Phi_p(theta + epsilon),
```

one expects

```text
alpha = p R(P_p) >= c_{p,Q,epsilon} > 0.
```

**Status.** Promising lemma candidate. Needs rigorous monotonicity, error control, and finite-`N` handling.

---

## 7. Joint-avoidance / `sigma_Q` gate

Define

```text
pi(Q) := { p : p divides q for some q in Q },

sigma_Q := product_{p in pi(Q)} (1 - 1/p).
```

Let

```text
P* := { n in P : gcd(n, product_{p in pi(Q)} p)=1 }.
```

Then approximately

```text
|P*| <= sigma_Q N + o(N).
```

Using the union bound,

```text
|P| <= |P*| + sum_{p in pi(Q)} |P_p|
     <= sigma_Q N + N sum_{p in pi(Q)} R(P_p) + o(N).
```

Therefore, if

```text
|P| >= (theta + epsilon)N,
```

then

```text
sum_{p in pi(Q)} R(P_p) >= theta + epsilon - sigma_Q - o(1).
```

For fixed `Q`, this gives quantitative local mass at some prime in `pi(Q)` whenever the right side is positive.

**Status.** This looks like a genuinely provable fixed-`Q` lemma and is one of the strongest additions from the final messages.

---

## 8. Prime-only fixed `Q`

If

```text
Q = {p_1,...,p_k}
```

is prime-only and `S_Q > 1`, then `pi(Q)=Q`. By the joint gate, some `p_0 in Q` should have

```text
R(P_{p_0}) >= c_{Q,epsilon} > 0.
```

Taking

```text
Q' = {p_0},     R(Q') = 1/p_0,
```

Liu-Sawhney reachability, if applicable, should allow `P` to hit `1/p_0`, producing a proper subcircuit.

**Status.** Likely close, conditional on reachability. Still not a proof until the Liu-Sawhney interface is verified.

---

## 9. Composite/mixed fixed `Q`: target-selection problem

For composite-only or mixed `Q`, the joint gate may force mass at primes in `pi(Q)` even when those primes are not themselves elements of `Q`. Example:

```text
Q = {15,21,35,...},     pi(Q) = {3,5,7,...},
```

but `3,5,7` need not belong to `Q`. Hence target `1/p` may not be available.

Define a finite target set:

```text
T_Q := { R(Q') : empty != Q' subsetneq Q }.
```

The arbitrary fixed-`Q` target-selection problem is:

```text
Find Q' subsetneq Q such that Liu-Sawhney-type reachability can force
B subseteq P with R(B)=R(Q').
```

Then `B union Q'` is a proper subcircuit.

**Status.** Correct formulation for arbitrary fixed `Q`. Computational evidence suggests composite/interval-like `Q` often have smooth targets, while prime-only `Q` defeats the naive smooth-denominator proxy; hence target selection is real, not cosmetic.

---

## 10. Obstruction group / zero-sum formulation

Let `F(Q)` denote the set of primes that remain forced/visible in the reduced denominator of `S_Q` or in the relevant bad-prime quotient. For primes outside `F(Q)`, define a finite `p`-adic obstruction group `G_Q`. Map each `q in Q` to an obstruction vector

```text
v_q in G_Q.
```

The condition that `R(Q')` has denominator supported only on forced primes should correspond to

```text
sum_{q in Q'} v_q = 0 in G_Q.
```

If target selection fails, the sequence `(v_q)_{q in Q}` should become a minimal zero-sum sequence, or atom, in `G_Q`.

Define the cross number

```text
k((v_q)) := sum_{q in Q} 1 / ord(v_q).
```

Since `ord(v_q) <= q`, we have

```text
S_Q = sum_{q in Q} 1/q <= k((v_q)).
```

**Status.** Correct framework, not yet a proof. The next algebraic task is to obtain a special bound for reciprocal-realizable atoms.

---

## 11. Failed one-line cross-number closure

A proposed closure was:

1. `G_Q` is cyclic.
2. `K(G_Q)=1`.
3. Therefore `S_Q <= 1`, contradicting `S_Q > 1`.

This fails because `K(C_n)=1` is false for composite cyclic groups in the required maximal-cross-number sense.

Counterexample in `C_6`:

```text
(2,2,3,5)
```

is minimal zero-sum because

```text
2+2+3+5 = 12 == 0 mod 6,
```

and no proper subsequence sums to zero. The orders are

```text
ord(2)=3, ord(2)=3, ord(3)=2, ord(5)=6.
```

So the cross number is

```text
1/3 + 1/3 + 1/2 + 1/6 = 4/3 > 1.
```

The valid conclusion is only

```text
S_Q <= k((v_q)) <= K(G_Q).
```

Thus target selection is forced if

```text
S_Q > K(G_Q),
```

not merely if `S_Q > 1`.

**Status.** One-line closure rejected. The cross-number route remains valuable, but the theorem needed is special: reciprocal-realizable high-cross-number atoms must be ruled out or classified.

---

## 12. Current problem list

**Problem A: Liu-Sawhney interface.** Verify that the reachability theorem applies to target `R(Q')` under our local-mass hypotheses.

**Problem B: Composite target selection.** Prove or disprove: if `Q` is fixed, `1 notin Q`, and `S_Q > 1`, then there exists proper `Q'` whose target denominator uses only forced primes.

**Problem C: Reciprocal atom cross-number bound.** If target selection fails, the obstruction sequence is a minimal zero-sum atom. We need either:

```text
No reciprocal-realizable atoms with S_Q > 1 exist,
```

or a weaker sufficient condition such as

```text
S_Q > K(G_Q).
```

**Problem D: Growing Q_N.** Even if fixed `Q` closes, growing `Q_N` requires uniform bounds. Constants from joint gate and local mass may decay.

---

## 13. Updated honest conclusion

The best current characterization is:

```text
Arbitrary fixed Q is closer, but still open.
Growing Q_N and full #319 remain long-term.
```

More precisely:

1. Fixed-`Q` gate theorem architecture is serious.
2. Prime-only fixed `Q` is likely close through the `sigma_Q` joint gate, modulo Liu-Sawhney reachability.
3. Composite/mixed fixed `Q` has been reduced to a target-selection / zero-sum / cross-number problem.
4. The one-line cross-number proof failed and should not be reused.
5. The remaining algebraic task is to prove a special cross-number bound for reciprocal-realizable atoms, or to classify counterexamples.

---

## 14. Wording for subsidy / public progress report

Recommended wording:

> We have not solved Erdos #319. The strongest new progress is a fixed-negative-side programme: a `Phi`-based gate theorem candidate, a joint-avoidance `sigma_Q` local-mass lemma, and a reduction of arbitrary fixed `Q` to a finite target-selection problem. The latter now has a precise zero-sum/cross-number formulation. A proposed one-line closure was rejected after finding a cyclic-group counterexample, so the remaining task is sharply localized: verify the Liu-Sawhney reachability interface and prove or classify the reciprocal-realizable atom obstruction. This is genuine progress, but not a completed theorem or a full solution.

Not recommended:

```text
Solved Erdos #319.
Arbitrary fixed Q solved.
Dynamic gate theorem proved.
The cross-number closure works because K(C_n)=1.
```

---

## 15. Immediate next actions

1. **Liu-Sawhney parameter dictionary.** Create a line-by-line table matching our notation to Proposition 5.2 and the pruning lemmas.
2. **Prove the `sigma_Q` gate cleanly.** This is the lowest-risk new lemma and should be written first.
3. **Prime-only fixed-Q test.** Use the joint gate plus target `1/p_0`; isolate exactly what reachability statement is needed.
4. **Target-selection enumerator.** For a fixed `Q`, enumerate all non-empty proper `Q'`, reduce `R(Q')`, and classify denominator supports.
5. **Cross-number obstruction notebook.** For target-selection failures, build `G_Q`, compute orders, cross number, and compare with `S_Q` and known `K(G_Q)` bounds.
6. **Do not attack growing Q_N first.** Fixed `Q` has stable constants; growing `Q_N` needs uniform estimates and should be treated as a later project.
