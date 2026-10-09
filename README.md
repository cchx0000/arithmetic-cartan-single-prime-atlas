# Arithmetic Cartan single-prime atlas

**Latest integrated manuscript: [fixed130 — analytic tame-$C_3$ decomposition and integral adjoint Smith/Hecke closure](arithmetic_cartan_representations_closure_fixed130_s3_adjoint_tame_analytic_smith.tex)** (October 2026).

Previous complete versions are preserved:
[fixed129](arithmetic_cartan_representations_closure_fixed129_s3_natural_strict_integral_hecke.tex),
[fixed128](arithmetic_cartan_representations_closure_fixed128_s3_sylow_schreier_hecke.tex),
[fixed127](arithmetic_cartan_representations_closure_fixed127_exact_hilbert_full_marked_fox_bridge.tex),
[fixed126](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex),
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex),
and [fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

## Fixed130: a genuinely structural advance

The setting is the same real non-pro-2 local residual quotient as fixed128–129,
\[
\Gamma=G_{\mathbb Q_2}\twoheadrightarrow
 S_3\simeq\mathrm{GL}_2(\mathbb F_2),\quad
H=G_{\mathbb Q_2(\sqrt[3]{2})},\quad[\Gamma:H]=3.
\]
On the standard integral lattice \(T=\mathbb Z_2^2\) with
\(S=\begin{psmallmatrix}0&1\\1&0\end{psmallmatrix}\),
\(U=\begin{psmallmatrix}-1&-1\\1&0\end{psmallmatrix}\), the rank-four adjoint coefficient module \(M=\operatorname{End}_{\mathbb Z_2}(T)\) splits canonically under the tame order-three idempotent
\[
\Pi_0=\frac{1+\operatorname{Ad}_U+\operatorname{Ad}_{U^2}}3.
\]

1. **A fully explicit, unimodular 2-adic basis.** Put
   \[
   V=\frac13\begin{pmatrix}-1&1\\2&1\end{pmatrix},\qquad
   W=SVS^{-1}=\frac13\begin{pmatrix}1&2\\1&-1\end{pmatrix}.
   \]
   The basis \((U,U^2,V,W)\) of \(\operatorname{End}(T)\) has determinant **exactly \(1\)** over \(\mathbb Z_2\). The tame invariant block \(M_0=\langle U,U^2\rangle\) has \(U\)-action identity and \(S\)-action swap; the complementary block \(M_1=\langle V,W\rangle\) has precisely the original natural \(S_3\) action.

   Therefore, **integrally and \(S_3\)-equivariantly**,
   \[
   \operatorname{ad}T
   \simeq
   \operatorname{Ind}_{G_{\mathbb Q_2(\zeta_3)}}^{G_{\mathbb Q_2}}
        \mathbb Z_2\ \oplus\ T.
   \]

2. **Literal integral marked Fox diagonalization, replacing the numerical Smith witness.** On \(M_1\simeq T\), reuse the fixed129 strong contraction \(M_1[-1]\). On \(M_0\), the full two-relator marked differential is
   \[
   d^1(a,b,c,d)=
      ((S-2I)b,\ 3b+2c+(S-I)d)
   \]
   and \(d^0(v)=((S-I)v,0,0,0)\).
   The integral row operation \((u,w)\mapsto(u,w-3(S-2I)^{-1}u)\) cancels the tame two-dimensional contractible block. The remaining three-generator Fox core admits an **explicit unimodular coordinate change** to
   \[
   d^0(r,s)=(0,s,0,0,0,0),\qquad
   d^1(\alpha,\beta,c_f,c_e,\widetilde d_e,d_+)
      =(\widetilde d_e,2c_e).
   \]
   Combining the two blocks yields
   \[
   \mathcal J^\bullet(\Gamma,\operatorname{ad}T)
   \simeq
   \mathbb Z_2[0]\oplus
   \mathbb Z_2^5[-1]\oplus
   [\mathbb Z_2\xrightarrow2\mathbb Z_2]_{[1,2]}.
   \]
   Thus the fixed128 marked \(8\times16\) Jacobian has exactly seven unit Smith factors and one factor \(2\), now **proved analytically** rather than inferred solely from a mod-four determinant.

3. **Exact normalized cohomology and a visible integral top obstruction.** The five free \(H^1\) coordinates are \((\lambda,\mu,\nu,t)\in\mathbb Z_2^3\oplus M_1\) and have explicit marked generator values in the new theorem. The unique \(H^2\simeq\mathbb F_2\) class is the reduction of \(U\in M_0\); matrix trace modulo \(2\) is a nonzero scalar detector of this class. The complementary natural summand \(M_1\) contributes no global \(H^2\).

4. **Shapiro and the degree-two Hecke projector identify which obstruction descends.** On \(\Gamma\),
   \[
   H^\bullet(\Gamma,M_0)
     =(\mathbb Z_2,\mathbb Z_2^3,\mathbb F_2),\quad
   H^\bullet(\Gamma,M_1)
     =(0,\mathbb Z_2^2,0).
   \]
   On the Sylow preimage \(H\), each restricted block is an induced rank-two permutation lattice from \(N=G_L\) with \(L=\mathbb Q_2(\sqrt[3]{2},\zeta_3)\), and
   \[
   H^\bullet(H,M_i)
     =(\mathbb Z_2,\mathbb Z_2^7,\mathbb F_2),\quad i=0,1.
   \]
   The genuine nonnormal index-three projector on \(H^2(H,M)=\mathbb F_2^2\) is
   \[
   e_H^{(2)}=\begin{pmatrix}1&0\\0&0\end{pmatrix}
   \]
   in the canonical tame-invariant/norm-zero splitting. The first torsion direction is the odd-degree restriction of the local \(H^2(G_{\mathbb Q_2(\zeta_3)},\mathbb Z_2)\) class; the second is killed.

## Standalone sources and independent checks

- [fixed130 tame idempotent, analytic Smith, Shapiro and Hecke proof](dyadic_s3_adjoint_tame_splitting_analytic_smith_fixed130.tex) — integrated verbatim into fixed130.
- [Sage 10.9 exact matrix audit](checks/fixed130_s3_adjoint_tame_split_analytic_smith.sage) — validates unimodular basis, full integral differentials, Smith factors, and normalized Fox coordinates when run.
- The fixed129 [natural-lattice strict Schreier projector](dyadic_s3_natural_integral_strict_transfer_retract_fixed129.tex) remains a separate complementary result.

Independent modular arithmetic checks were performed during manuscript generation; the Sage script is provided for local execution and is **not** claimed as a completed CI run.

## Remaining mathematical frontier

The split \(M_0\oplus M_1\) is a theorem for the **fixed tame \(S_3\) adjoint lattice**, not for arbitrary framed deformations: wild transport need not preserve this fixed $C_3$-isotypic decomposition. The general non-pro-2 residual-family Schreier-to-**minimal rank-five Demuškin Fox** integral syzygy map, and a canonical strict global full-group comparison in every residual sector, remain open. The unconditional all-Sylow/Cayley–Hamilton derived finite-atlas theorem is unchanged.

Routine iterations are TeX-only unless PDF is specifically requested.
