# Erdős 319 — Codex Upload / Project Update

Date: 2026-06-05
Status: B=6 milestone consolidated; exact-order bridge and clean subgroup-count theorem added.

## Repository status

This upload contains the current Lean project after today’s Aristotle run. The key files are:

- `RequestProject/InvariantRoute.lean`
- `RequestProject/Bridge.lean`
- `RequestProject/ExactOrder.lean`
- `RequestProject/Certificate.lean`
- `RequestProject/CertificateProof.lean`
- `RequestProject/Certificates/B10.lean`
- `RequestProject/AuditReport.md`
- `ARISTOTLE_SUMMARY.md`

## Main completed results

### 1. Exact-order bridge

A concrete reciprocal exact-order theorem has been proved:

```lean
theorem addOrderOf_aqMap_eq_badPart (Q : Finset ℕ) (q : ℕ) (hq : q ∈ Q)
    (hQ : ∀ q ∈ Q, 0 < q) (hB : 0 < obstructionB Q) :
    addOrderOf (aqMap Q q) = badPart q (denomPrimes Q)
```

This removes the previous external order hypothesis in the reciprocal subgroup-count argument.

### 2. Clean subgroup-count theorem

The cleaned theorem removes both the external order hypothesis and the earlier `h_not_all` hypothesis:

```lean
theorem reciprocal_subgroup_count_unconditional_clean (Q : Finset ℕ)
    (hQ_comp : ∀ q ∈ Q, q ≥ 4 ∧ ¬ Nat.Prime q)
    (hB_gt : 1 < obstructionB Q)
    (h_no_target : ¬ TargetSelectionSucceeds Q)
    (d : ℕ) (hd : d ∣ obstructionB Q) (hd_lt : d < obstructionB Q) :
    (Q.filter (fun q => badPart q (denomPrimes Q) ∣ d)).card ≤ d - 1
```

The key cleanup lemma is:

```lean
exists_badPart_not_dvd_of_proper_divisor
```

It proves that if `d ∣ obstructionB Q` and `d < obstructionB Q`, then not all bad parts can divide `d`; otherwise the lcm defining `obstructionB Q` would divide `d`, contradiction.

### 3. Clean B=6 certificate

The cleaned B=6 theorem is:

```lean
theorem recipSum_le_one_of_obstructionB_eq_six_clean (Q : Finset ℕ)
    (hQ_comp : ∀ q ∈ Q, q ≥ 4 ∧ ¬ Nat.Prime q)
    (hB_eq : obstructionB Q = 6)
    (h_no_target : ¬ TargetSelectionSucceeds Q) :
    recipSum Q ≤ 1
```

The proof uses:

1. target-free implies a minimal zero-sum sequence in `ZMod 6`;
2. minimal zero-sum length in `ZMod 6` is at most 6;
3. every admissible composite denominator in the B=6 case satisfies `q ≥ 6`;
4. hence `recipSum Q ≤ |Q| / 6 ≤ 1`.

### 4. Computational certificate framework

`Certificate.lean` and `CertificateProof.lean` provide a framework for relaxed invariant certificates. The computational table suggests that several small non-prime-power kernels close by relaxed invariant bounds, including:

```text
B = 6, 10, 12, 15, 18, 20, 30
```

However, these are not all fully formal theorem certificates yet. B=6 is fully proved. `Certificates/B10.lean` currently contains a setup/skeleton and an intentional theorem placeholder.

## Audit caveats

A grep scan currently reports:

```text
RequestProject/CrossNumber.lean:161: sorry
RequestProject/CrossNumberInduction.lean:111: sorry
RequestProject/Certificates/B10.lean:52: sorry
```

Interpretation:

- The two cross-number sorries are pre-existing and intentionally out of scope.
- The B10 sorry is an intentional placeholder/skeleton, not part of the clean B=6 milestone.
- The clean B=6 theorem and exact-order bridge should be checked with `#print axioms` and should depend only on standard axioms.

Important: do not claim the entire repository is sorry-free while `Certificates/B10.lean` contains a placeholder.

## Suggested audit commands

Run:

```bash
lake build
grep -Rn "sorry\|admit\|axiom" RequestProject/ --include="*.lean"
```

Then in Lean:

```lean
#print axioms addOrderOf_aqMap_eq_badPart
#print axioms reciprocal_subgroup_count_unconditional_clean
#print axioms recipSum_le_one_of_obstructionB_eq_six_clean
#print axioms q_ge_six
#print axioms minimalZeroSum_card_le
```

Expected result for the clean theorems: only standard axioms such as `propext`, `Classical.choice`, and `Quot.sound`.

## Recommended next tasks

### Task A — Keep B=6 frozen

Treat the current B=6 theorem as the first clean formal milestone. Avoid editing it unless only refactoring names/imports.

### Task B — Prove B=10 formally

`RequestProject/Certificates/B10.lean` currently has the theorem statement and layer analysis. Next target:

```lean
theorem recipSum_le_one_of_obstructionB_eq_ten
```

Use the existing clean subgroup-count theorem and the documented B=10 layer bounds.

### Task C — Add B=12 and B=15 certificate files

After B=10, create:

```text
RequestProject/Certificates/B12.lean
RequestProject/Certificates/B15.lean
```

Goal: convert computational relaxed certificates into sorry-free Lean theorem certificates.

### Task D — Do not jump to B=24/B=40 yet

B=24, B=36, B=40, B=48, B=56, and B=60 remain stress cases where the relaxed invariant bound is insufficient. They likely require stronger machinery, such as proper-subgroup cross-number bounds, triple-existence constraints, or self-consistency collapse.

## Suggested Codex prompt

Please audit and continue the Erdős 319 Lean formalization from the current B=6 milestone.

Do not touch the two pre-existing cross-number sorries:

```lean
crossNumber_le_one_prime_power
crossNumber_inductive_step
```

Do not claim the whole repository is sorry-free while `RequestProject/Certificates/B10.lean` contains a placeholder.

First run:

```bash
lake build
grep -Rn "sorry\|admit\|axiom" RequestProject/ --include="*.lean"
```

Then check:

```lean
#print axioms addOrderOf_aqMap_eq_badPart
#print axioms reciprocal_subgroup_count_unconditional_clean
#print axioms recipSum_le_one_of_obstructionB_eq_six_clean
```

Main task:

Prove the B=10 certificate theorem in `RequestProject/Certificates/B10.lean`, using the already-proved exact-order bridge and clean subgroup-count theorem. Keep the proof local and do not introduce new permanent `sorry`, `admit`, or custom `axiom`.

If B=10 becomes blocked, stop and report the exact lemma or arithmetic inequality that is blocking the proof.

## Suggested commit message

```text
Formalize exact-order bridge and clean B=6 obstruction certificate

- Add exact-order theorem addOrderOf_aqMap_eq_badPart
- Prove clean reciprocal subgroup-count theorem without external order or h_not_all hypotheses
- Prove clean B=6 certificate recipSum_le_one_of_obstructionB_eq_six_clean
- Add relaxed invariant certificate framework and B=10 skeleton
- Preserve old cross-number sorries as out-of-scope placeholders
```
