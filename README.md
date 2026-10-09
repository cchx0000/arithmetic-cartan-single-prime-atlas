# Arithmetic Cartan single-prime atlas

**Current integrated TeX manuscript: [fixed129 — strict integral natural-$S_3$ marked contraction and Schreier/Hecke cochain projector](arithmetic_cartan_representations_closure_fixed129_s3_natural_strict_integral_hecke.tex)** (October 2026).

Earlier complete manuscripts are retained:
[fixed128](arithmetic_cartan_representations_closure_fixed128_s3_sylow_schreier_hecke.tex),
[fixed127](arithmetic_cartan_representations_closure_fixed127_exact_hilbert_full_marked_fox_bridge.tex),
[fixed126](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex),
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex),
and [fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

## Fixed129: substantive advances over fixed128

This version stays in the **genuine non-pro-2 residual sector**
\[
\Gamma=G_{\mathbb Q_2}\twoheadrightarrow S_3,\quad
H=G_{\mathbb Q_2(\sqrt[3]{2})},\quad[\Gamma:H]=3,
\]
but switches from the fixed128 adjoint Smith audit to the natural integral lattice
\[
T=\mathbb Z_2^2,\qquad
S=\begin{pmatrix}0&1\\1&0\end{pmatrix},\quad
U=\begin{pmatrix}-1&-1\\1&0\end{pmatrix}.
\]
The key extra property is the **exact integral tame norm-zero identity**
\(I+U+U^2=0\).

1. **Complete natural-coefficient marked $4\times8$ Fox matrix.**
   For crossed-derivation generator values $(a,b,c,d)$ at $(\sigma,\tau,x_0,x_1)$, the two relation blocks are exactly
   \[
   d^1(a,b,c,d)=
   (S^{-1}(U-I)a+(S^{-1}-I-U)b,\;-2c+S^{-1}d),
   \]
   while $d^0(v)=((S-I)v,(U-I)v,0,0)$.
   Both the tame $\sigma$ and wild $x_1$ blocks of $d^1$ are invertible over $\mathbb Z_2$.

2. **Closed strict integral deformation retract.**
   The finite full-marked coefficient complex has an explicit chain-homotopy equivalence
   \[
   \mathcal J^\bullet_{\Gamma,\mathrm{nat}}(T)\simeq T[-1].
   \]
   The retraction maps are \(p(a,b,c,d)=c\),
   \(i(t)=(0,0,t,2St)\), with
   \[
   h^1(a,b,c,d)=(U-I)^{-1}b,\quad
   h^2(u,w)=((S^{-1}(U-I))^{-1}u,0,0,Sw).
   \]
   All denominators are odd (powers of three), so the contraction is genuinely integral at $p=2$.
   Every continuous global cocycle has a unique gauge-normalized representative with values
   \(c_t(\sigma)=c_t(\tau)=0\),
   \(c_t(x_0)=t\), \(c_t(x_1)=2St\).

3. **Explicit nonnormal Sylow projector on eight Schreier evaluation words.**
   Put \(w_{ij}=\tau^i x_j\tau^{-i}\in H\), \(i=0,1,2\), \(j=0,1\).
   The integral formula
   \[
   \Phi_H(c)=\frac13\sum_{i=0}^{2}U^{-i}c(w_{i0})
   \]
   is a left inverse to restriction on $H^1$.
   Exact generator values of the restricted normalized cocycle give a concrete rank-two block projector
   \[
   E_{\rm Sch}=I_{\rm Sch}P_{\rm Sch}\in M_{16}(\mathbb Z_2),\qquad
   E_{\rm Sch}^2=E_{\rm Sch},
   \]
   with the complete $16\times16$ construction in the TeX.
   Consequently
   \(H^1(H,T)\cong\mathbb Z_2^2\oplus\mathbb Z_2^5\),
   with the first factor exactly the descended submodule.

4. **Strict bar-cochain representative of derived Hecke/Sylow descent.**
   The same degree-one evaluation defines strict cochain maps
   \(p_H:C^\bullet(H,T)\to T[-1]\),
   \(i_H:T[-1]\to C^\bullet(H,T)\)
   with \(p_Hi_H=1\).
   The strict idempotent
   \(\Pi_H=i_Hp_H\) represents
   \(\frac13\operatorname{res}\operatorname{cor}\)
   in the derived category.  The representative
   \(\mathsf T_{\rm Hk}^{\rm str}=3\Pi_H-I\)
   satisfies \((\mathsf T_{\rm Hk}^{\rm str})^2
   =\mathsf T_{\rm Hk}^{\rm str}+2I\)
   **as an actual cochain identity**, not merely on cohomology.
   Explicit strict maps between the finite marked complex and the bar-cochain Sylow summand compose to the projector and to the given marked contraction homotopy.

## Independent proof source / verification

The standalone insertion [fixed129 natural integral Schreier/Hecke proof](dyadic_s3_natural_integral_strict_transfer_retract_fixed129.tex) is included verbatim in the integrated manuscript.

An accompanying [SageMath 10.9 exact-matrix audit](checks/fixed129_s3_natural_integral_retract.sage) checks the full differential, all strong-retract homotopy identities, 2-adic integrality of every matrix, the 16-by-16 Schreier projector, and its literal Hecke polynomial. The new identities were also checked independently modulo $2^8$ during manuscript development. The repository script is provided for local reproduction; it is not being represented as a CI run.

## Precisely retained frontier

Fixed129 **does not** identify the eight Schreier evaluation words with a chosen minimal five-generator Demuškin presentation of
\(P_H=G_{\mathbb Q_2(\sqrt[3]{2})}(2)\), nor provide the associated complete integral relation-module syzygies.
The explicit strict projector applies to the fixed natural coefficient lattice $T$ and its descended bar-cochain summand.
It does not automatically apply to $\operatorname{ad}T$, whose tame $C_3$ invariants are nonzero; the fixed128 adjoint Smith certificate remains a separate result.
A uniform direct finite **minimal-Fox-to-Schreier** second-degree comparison for arbitrary non-pro-2 residual sectors therefore remains open.
The unconditional all-Sylow/Cayley–Hamilton derived faithful atlas is preserved.

Routine revisions are TeX-only unless a PDF is specifically requested.
