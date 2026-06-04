# Erdős Problem #319: progress report and formalization roadmap

Date: 2026-06-04

## Executive summary

This is not a claimed solution of Erdős Problem #319. The current public status is still open. What has been achieved in the past few days is a substantial reframing and a set of proof-level intermediate targets:

1. A clean signed-circuit formulation of the problem.
2. A spectrum-intersection criterion for primitivity.
3. A separation between the known Croot/Adenwalla lower-bound mechanism and the genuinely open upper-bound/minimality problem.
4. Finite computational evidence near the constant 1 - 1/e, useful as validation but not as proof.
5. A singleton-side theorem candidate / subclass result, subject to proof audit: the Croot/Adenwalla constant is expected to be asymptotically optimal when one sign class has exactly one element.
6. A fixed-Q proof programme using dynamic gates, target selection, and Liu-Sawhney-type reachability.
7. A Lean-facing scaffold in which the elementary combinatorial layer can be verified, while the analytic unit-fraction machinery is isolated as explicit black-box assumptions.

The most honest subsidy framing is: we have converted a difficult open Erdős problem into a structured formalization and proof-search programme with genuine intermediate deliverables. We have not solved the full problem.

## 1. Statement and notation

Let

    R(X) = sum_{x in X} 1/x.

For a signed set A subset {1,...,N}, write

    A = P disjoint_union Q,

where P is the positive side and Q is the negative side. The signed zero-sum condition is

    R(P) = R(Q) = S.

Erdős #319 asks for the largest size of such an A subject to the additional minimality/primitivity condition: no non-empty proper signed subcollection has total signed reciprocal sum zero.

Define the subset-sum spectra

    Sigma(P) = { R(P') : P' subset P },
    Sigma(Q) = { R(Q') : Q' subset Q }.

Then A is primitive exactly when

    Sigma(P) intersection Sigma(Q) = {0, S}.

This is one of the central reductions. It turns #319 into a two-colour reciprocal subset-sum spectrum intersection problem.

## 2. Known lower bound

Croot's short-interval unit-fraction theorem implies that for rational r > 0 one can represent r as a sum of reciprocals with denominators in a short interval. For r = 1, this gives a set B in approximately [(1/e)N, N] with

    sum_{b in B} 1/b = 1.

Then

    A = {1} union B

with signs -1 on 1 and +1 on B gives a signed reciprocal zero-sum circuit. Since all reciprocals in B are positive, no proper subset of B can still sum to 1 after deleting a term. This gives the known lower bound

    c(N) >= (1 - 1/e + o(1)) N.

This is lower-bound progress only. It does not prove that larger primitive signed circuits are impossible.

## 3. Computational evidence

The exact-rational and Croot-style interval searches found near-misses around N = 50 and N = 60. For example, the N = 60, alpha = 0.340 search produced a support of size 37 with reciprocal sum extremely close to 1. If repaired to exact equality, this would give |A| = 38 and 38/60 = 0.6333..., close to

    1 - 1/e = 0.6321....

This supports the Croot/Adenwalla constant numerically. It is not a proof, because #319 requires exact equality and minimality, and finite examples do not prove an asymptotic upper bound.

## 4. Proof-level output A: spectrum-intersection criterion

The following is an elementary theorem and should be the first Lean-verifiable lemma.

Theorem. Let P and Q be disjoint finite sets of positive integers with R(P) = R(Q) = S. Then the signed circuit P disjoint_union Q is primitive if and only if

    Sigma(P) intersection Sigma(Q) = {0, S}.

Proof. A signed subcircuit is determined by subsets P' subset P and Q' subset Q. Its signed reciprocal sum is zero exactly when R(P') = R(Q'). The empty-empty choice gives 0, and the full-full choice gives S. Any other equality gives a non-empty proper zero-subcircuit. Conversely, any non-empty proper zero-subcircuit gives such an equality. Therefore primitivity is exactly the assertion that the only spectral collisions are 0 and S.

This proof is fully formalizable without analytic number theory.

## 5. Proof-level output B: singleton-side optimality candidate

Define c_1(N) to be the largest size of a primitive #319 circuit in {1,...,N} in which one sign class has exactly one denominator.

Theorem. As N tends to infinity,

    c_1(N) = (1 - 1/e + o(1)) N.

Proof sketch. If the singleton side is {d}, then the other side Q satisfies

    R(Q) = 1/d.

For a fixed number k of denominators in {1,...,N}, the smallest possible reciprocal sum is obtained by taking the k largest denominators. Thus, if k = alpha N, the minimum possible reciprocal mass is asymptotically

    integral_{1-alpha}^1 dx/x = log(1/(1-alpha)).

Therefore the condition R(Q) = 1/d implies

    log(1/(1-alpha)) <= 1/d,

so

    alpha <= 1 - exp(-1/d) + o(1).

This is maximized at d = 1, giving alpha <= 1 - 1/e + o(1). The matching lower bound is the Croot/Adenwalla construction with singleton denominator 1.

This is not a full solution of #319, because in the full problem both sign classes may be large. It should be treated as a theorem candidate / subclass result until the proof is audited and written independently.

## 6. Proof-level output C: large-prime-factor obstruction

The working lemma is a p-adic top-layer obstruction: very large minimal signed reciprocal circuits cannot freely use denominators with very large prime factors. In the current notes it is formulated roughly as follows.

Lemma candidate. If A is a primitive signed reciprocal circuit, |A| > K, and K is chosen so that the p-adic top-layer argument applies, then every denominator n in A has largest prime factor at most about N/K. With K around log N, this gives a saving of order

    N log log N / log N

from the trivial upper bound N.

Status: mathematically plausible and useful as a structural obstruction, but modest. It should be treated as a warm-up lemma, not as a breakthrough. Its exact hypotheses should be rechecked before being presented as a final theorem.

## 7. Fixed-Q programme

Fix a finite negative side Q, and let

    S_Q = R(Q).

The upper-bound task becomes: if P subset {1,...,N} satisfies

    R(P) = S_Q

and

    |P| >= (theta + epsilon) N,

where theta = 1 - 1/e, must P contain a subset B with

    R(B) = R(Q')

for some non-empty proper Q' subset Q? If yes, then B union Q' is a proper signed zero-subcircuit, contradicting primitivity.

This is the fixed-Q target-hitting problem.

### Dynamic gate

For a prime power q, define a tail-avoidance reciprocal-mass threshold Phi_q(u): the asymptotic minimum reciprocal mass of uN integers in {1,...,N} when multiples of q are forbidden. The dynamic gate principle is:

    if S_Q < Phi_q(theta + epsilon),
    then P must contain quantitatively enough q-divisible mass.

This converts the balance equation R(P) = S_Q into local divisibility forcing.

### Conditional fixed-Q theorem candidate

For fixed Q and epsilon > 0, suppose there is a non-empty proper target Q' subset Q such that every prime power appearing in the denominator of R(Q') is epsilon-good, i.e. controlled by the dynamic gate. Assuming the relevant Liu-Sawhney target-reachability interface, no primitive circuit P disjoint_union Q can have

    |P| >= (theta + epsilon) N

for all large N.

This is a serious partial theorem candidate. The remaining analytic black box is a target-r version of the Croot/Bloom/Liu-Sawhney unit-fraction machinery.

## 8. Arbitrary fixed Q versus growing Q_N

For arbitrary fixed Q, the project is now much sharper than before. The hard part is no longer vague; it is the small-epsilon regime and target selection. A possible route is:

1. For each fixed Q, list all proper targets Q' subset Q.
2. Compute the excess threshold epsilon_Q^target needed for their denominator prime powers.
3. If epsilon > epsilon_Q^target, use dynamic gate plus Liu-Sawhney reachability.
4. If epsilon <= epsilon_Q^target, prove a near-extremal stability or gate-absorption lemma.

For growing Q_N, the problem is harder. Constants depending on Q may collapse as N grows, and the pruning/reachability machinery may lose the very layers needed for the target. Full #319 likely requires a two-sided spectrum theorem rather than a fixed-target theorem.

## 9. New target-selection idea: cross-number route

The newest idea in the notes is a cross-number target-selection argument. It attempts to show that if S_Q > 1, then some proper target Q' subset Q has denominator supported only on the forced prime set. If correct, this would greatly strengthen the fixed-Q programme.

However, this should currently be written as a candidate lemma, not as a proved theorem, until the following implication is audited:

    target-selection fails => the associated sequence is a minimal zero-sum atom.

That implication is where hidden assumptions may enter. The cross-number inequality itself is plausible, but the reduction to an atom needs verification.

## 10. Lean/Aristotle formalization status

The Lean-facing decomposition should be:

### Layer 1: elementary definitions, verifiable now

- reciprocal sum R(X);
- signed circuit P disjoint_union Q;
- primitive/minimal circuit;
- subset-sum spectrum Sigma(X);
- proof that primitivity is equivalent to Sigma(P) intersection Sigma(Q) = {0,S}.

### Layer 2: elementary finite lemmas, formalizable next

- singleton-side upper bound, modulo standard harmonic-sum estimates;
- large-prime-factor obstruction, after exact p-adic hypotheses are finalized;
- finite Fourier subset-sum bridge in finite abelian groups.

### Layer 3: analytic black boxes

- Croot short-interval unit-fraction theorem;
- Bloom density theorem;
- Liu-Sawhney target-reachability theorem, especially target-r rather than only target 1;
- smooth/pruning/local-mass lemmas.

A good Aristotle/Lean claim is therefore:

    We have separated the proof into a Lean-verifiable combinatorial core and explicit analytic proof obligations. The project has not yet produced a completed Lean proof of Erdős #319.

## 11. Honest status table

| Item | Status |
|---|---|
| Full Erdős #319 | Open. Not solved. |
| Full Lean proof | Not available. |
| Spectrum-intersection reformulation | Proven/elementary; ready for Lean. |
| Croot/Adenwalla lower bound | Known literature; explains 1 - 1/e. |
| Computations near N = 50,60 | Useful evidence; not proof. |
| Singleton-side theorem | Candidate subclass result; proof audit needed. |
| Large-prime-factor obstruction | Useful but modest; audit exact statement. |
| Fixed-Q dynamic-gate theorem | Serious conditional theorem candidate. |
| Cross-number target selection | Promising but unaudited candidate. |
| Growing Q_N / full #319 upper bound | Long-term; needs new two-sided spectrum or stability theorem. |

## 12. Suggested subsidy wording

Over the first few days, we did not solve Erdős Problem #319, but we achieved a structured reduction and formalization programme. We reformulated the problem as one about primitive signed reciprocal circuits and subset-sum spectrum intersections. This separated the known Croot/Adenwalla lower-bound construction from the genuinely open upper-bound/minimality direction.

We isolated a singleton-side subclass result candidate: the known constant 1 - 1/e should be asymptotically optimal among singleton-side signed circuits, subject to a proof audit. We also identified a large-prime-factor obstruction and a fixed-Q dynamic-gate strategy that reduces several cases to explicit target-reachability inputs from Croot/Bloom/Liu-Sawhney-type unit-fraction machinery.

The current research frontier is the arbitrary fixed-Q problem. It has been reduced to target selection, small-epsilon near-extremal stability, and a target-r Liu-Sawhney interface. The full problem, where both sign classes may grow with N, remains substantially harder and likely requires a two-sided spectrum-intersection theorem.

This is genuine early-stage progress: not a completed solution, but a clear programme with formal definitions, proof obligations, computational tests, and at least one clean theorem suitable for a short internal note.
