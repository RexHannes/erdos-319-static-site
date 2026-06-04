/-
Erdos #319 Lean-facing blueprint
Date: 2026-06-04

This file is a FORMALIZATION BLUEPRINT, not a locally checked Lean certificate.
The current environment used to generate this file did not contain Lean/Mathlib.

Goal:
  Separate the elementary combinatorial core of Erdős #319 from analytic
  black-box inputs such as Croot/Bloom/Liu-Sawhney.

Main verified target for a real Lean repository:
  primitive_iff_spectrum_intersection

Analytic inputs should initially be stated as axioms/theorem assumptions, not as
proved facts.
-/

import Mathlib

noncomputable section
open scoped BigOperators
open Finset

namespace Erdos319

/-- Reciprocal sum of a finite set of natural numbers, interpreted in Q. -/
def R (X : Finset Nat) : Rat :=
  X.sum (fun n => if h : n = 0 then 0 else (1 : Rat) / (n : Rat))

/-- Subset-sum spectrum of reciprocal sums. -/
def Sigma (X : Finset Nat) : Finset Rat :=
  (X.powerset.image R)

/-- A signed reciprocal circuit represented by positive and negative sides. -/
structure Circuit where
  P : Finset Nat
  Q : Finset Nat
  disjoint : Disjoint P Q
  positiveP : forall n in P, 0 < n
  positiveQ : forall n in Q, 0 < n
  balanced : R P = R Q

/-- A proper signed zero-subcircuit is a pair of sub-sides not both empty and not both full. -/
def HasProperZeroSubcircuit (C : Circuit) : Prop :=
  exists P' Q' : Finset Nat,
    P' ⊆ C.P /\ Q' ⊆ C.Q /\
    R P' = R Q' /\
    ¬ (P' = ∅ /\ Q' = ∅) /\
    ¬ (P' = C.P /\ Q' = C.Q)

/-- Primitive means no non-empty proper signed zero-subcircuit. -/
def Primitive (C : Circuit) : Prop :=
  ¬ HasProperZeroSubcircuit C

/-- The total reciprocal mass of a circuit. -/
def totalMass (C : Circuit) : Rat := R C.P

/-- Spectrum-intersection formulation of primitivity.

This is the first elementary theorem to prove in Lean.
-/
theorem primitive_iff_spectrum_intersection (C : Circuit) :
    Primitive C ↔
      forall x, x ∈ Sigma C.P -> x ∈ Sigma C.Q ->
        x = 0 ∨ x = totalMass C := by
  /-
  Proof plan:
  * Unfold Sigma: x in Sigma P iff x = R P' for some P' subset P.
  * A collision R P' = R Q' gives a signed zero-subcircuit.
  * The empty-empty collision is x = 0.
  * The full-full collision is x = R P = R Q = totalMass C.
  * Any other collision contradicts Primitive.
  -/
  sorry

/-- Singleton-side upper-bound theorem statement.

This is not meant to be proved from scratch at first. It depends on harmonic-sum
asymptotics and Croot/Adenwalla for the matching lower bound.
-/
def SingletonSide (C : Circuit) : Prop :=
  C.P.card = 1 ∨ C.Q.card = 1

/-- Placeholder asymptotic statement for singleton-side optimality. -/
def singletonSideOptimalityStatement : Prop := True

/-- Large-prime-factor obstruction: exact statement still to be audited. -/
def largePrimeFactorObstructionStatement : Prop := True

/-- Dynamic-gate fixed-Q theorem, stated as a conditional theorem schema. -/
def EpsilonGoodTarget
    (Q Q' : Finset Nat) (epsilon theta : Real) : Prop :=
  -- In the final version, this will say every prime power in den(R Q')
  -- satisfies S_Q < Phi_{p^a}(theta + epsilon).
  True

/-- Liu-Sawhney target reachability interface.

This is an analytic black box. It should be replaced by a precise theorem once the
correct target-r statement is available.
-/
axiom liu_sawhney_target_reachability
  (P : Finset Nat) (target : Rat) : Prop

/-- Conditional fixed-Q theorem skeleton. -/
theorem fixed_Q_dynamic_gate_schema
    (C : Circuit) (Q' : Finset Nat) (epsilon theta : Real)
    (hQ'Q : Q' ⊆ C.Q)
    (hQ'nonempty : Q'.Nonempty)
    (hQ'proper : Q' ≠ C.Q)
    (hgood : EpsilonGoodTarget C.Q Q' epsilon theta)
    (hhit : exists B : Finset Nat, B ⊆ C.P /\ R B = R Q') :
    ¬ Primitive C := by
  intro hprim
  rcases hhit with ⟨B, hBP, hB⟩
  have hzero : HasProperZeroSubcircuit C := by
    refine ⟨B, Q', hBP, hQ'Q, ?_, ?_, ?_⟩
    · exact hB
    · intro hempty
      rcases hempty with ⟨hBempty, hQempty⟩
      exact hQ'nonempty.ne_empty hQempty
    · intro hfull
      rcases hfull with ⟨hBfull, hQfull⟩
      exact hQ'proper hQfull
  exact hprim hzero

end Erdos319
