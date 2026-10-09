# Arithmetic Cartan single-prime atlas

**Latest complete integrated manuscript: [fixed131 — universal dyadic tame rigidity, explicit wild obstruction and semilinear split locus](arithmetic_cartan_representations_closure_fixed131_universal_tame_wild_obstruction.tex)** (October 2026).

Earlier full versions remain preserved:
[fixed130](arithmetic_cartan_representations_closure_fixed130_s3_adjoint_tame_analytic_smith.tex),
[fixed129](arithmetic_cartan_representations_closure_fixed129_s3_natural_strict_integral_hecke.tex),
[fixed128](arithmetic_cartan_representations_closure_fixed128_s3_sylow_schreier_hecke.tex),
[fixed127](arithmetic_cartan_representations_closure_fixed127_exact_hilbert_full_marked_fox_bridge.tex),
[fixed126](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex),
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex), and
[fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

## Fixed131: the full framed S3 deformation-family frontier

Let $\bar\rho:G_{\mathbb Q_2}\twoheadrightarrow S_3\simeq\mathrm{GL}_2(\mathbb F_2)$ and let $\rho_A$ be any continuous rank-two **framed** deformation over a complete Noetherian local $2$-adic coefficient algebra $A$ with residue $\bar\rho$. Write $X=\rho_A(\tau)$, $Y=\rho_A(\sigma)$, $X_j=\rho_A(x_j)$.

1. **The tame generator is rigid over the entire framed residual family.** The exact tame relation $Y^{-1}XY=X^2$, together with $\bar X=\bar U$, forces
   \[
   \det X=1,\quad\operatorname{tr}X=-1,\quad
   X^2+X+I=0,\quad X^3=I.
   \]
   Thus the canonical order-three part of $X$ equals $X$ itself: there is **no tame pro-2 component to extract**. The tame projector
   \[
   \Pi_A=\frac13(1+\operatorname{Ad}_X+\operatorname{Ad}_{X^2})
   \]
   is therefore an *exact finite polynomial* throughout the universal residual ring, not merely a finite-precision binomial expression.

2. **A complete transport-native integral basis.** The four matrices
   \[
   \mathcal B_A=(I,X,Y,XY)
   \]
   form an $A$-basis of $\operatorname{End}_A(A^2)$; their residual vectorization has determinant $-3$, a $2$-adic unit. In this basis $\Pi_A=\operatorname{diag}(1,1,0,0)$, so $M_{0,A}=A\{I,X\}$ and $M_{1,A}=A\{Y,XY\}$ are rank-two integral submodules. Both tame generator adjoint actions have **explicit constant $2\times2$ matrices**, and $Y^2$ is scalar.

3. **Exact proper wild-centralizer split locus.** Write the two wild matrices uniquely as
   \[
   X_j=a_jI+b_jX+\eta_jY+\xi_jXY,\qquad j=0,1.
   \]
   The tame projector commutes with **all** Galois transport iff both wild matrices commute with $X$, equivalently iff
   \[
   \mathfrak I_{\rm split}=(\eta_0,\xi_0,\eta_1,\xi_1)=0.
   \]
   On this closed subfunctor, $\rho_A(\Gamma)$ normalizes the quadratic étale algebra $C_A=A[X]$, and the universal adjoint coefficient complex splits integrally and compatibly with base change. The four equations have **only two independent linear conditions at the residual point**; the framed tangent dimension drops from $9$ to $7$, and the unframed $H^1$ tangent dimension drops from $6$ to $4$. No regular-sequence claim is made.

4. **Rank-one quadratic-étale/semilinear parametrization of the split subfunctor.** The $A$-module $A^2$ is canonically a free rank-one $C_A$-module (using the framed cyclic vector). With $\Gamma'=G_{\mathbb Q_2(\zeta_3)}$ and $\iota(X)=X^2$, a split representation is specified by a character $\chi:\Gamma'\to C_A^\times$ and a semilinear Frobenius $m_b\iota$ satisfying
   \[
   \chi(\sigma h\sigma^{-1})=\iota\chi(h),\qquad
   b\iota(b)=\chi(\sigma^2).
   \]
   Its integral adjoint decomposition is $\operatorname{End}_A(C_A)=C_A\oplus C_A\iota$. The first summand is always $\operatorname{Ind}_{\Gamma'}^\Gamma A$, giving a **family-level derived Shapiro equivalence** $R\Gamma(\Gamma,M_{0,A})\simeq R\Gamma(\Gamma',A)$ on the split locus. The second carries the generally nontrivial character $\chi/\iota\chi$.

5. **Actual first-order nonsplit Galois deformation: strong no-go.** Over $A=\mathbb F_2[\varepsilon]/(\varepsilon^2)$ take
   \[
   \rho(\sigma)=\bar S,\quad
   \rho(\tau)=\bar U,\quad
   \rho(x_0)=I+\varepsilon\bar V,\quad
   \rho(x_1)=I,
   \quad \bar V=\begin{pmatrix}1&1\\0&1\end{pmatrix}.
   \]
   The *literal* Roe–Turturean marked relations and pro-2 wild condition hold, but $[\bar V,\bar U]=\bar V\ne0$. There is therefore **no equivariant deformation of the fixed130 tame projector** on the unrestricted universal ring, even if the projector itself is allowed to vary.

6. **Exact curved two-block substitute outside the split locus.** Write the full adjoint transport in $M_0\oplus M_1$ blocks as $\begin{psmallmatrix}A_g&B_g\\C_g&D_g\end{psmallmatrix}$. Flat multiplication implies
   \[
   A_{gh}=A_gA_h+B_gC_h,\qquad
   D_{gh}=D_gD_h+C_gB_h
   \]
   and exact accompanying off-diagonal laws. Thus the wild off-blocks quantify precisely how a diagonal-only projection loses true transport; no fictitious globally invariant splitting is used.

## Reproducible sources and checked scope

The standalone [fixed131 tame projector / wild obstruction proof](dyadic_s3_universal_tame_projector_wild_obstruction_fixed131.tex) is fully integrated into the linked complete manuscript. A [SageMath 10.9 verification script](checks/fixed131_s3_tame_rigidity_wild_nosplit.sage) tests the tame rigidity, native-frame projection, a literal first-order marked Galois deformation, and the rank-two obstruction. Independent exact/modular matrix checks were completed during authoring; the uploaded Sage source is **not claimed to have been executed in CI**.

The split coefficient decomposition does not extend to arbitrary wild transport; the unrestricted all-Sylow/Cayley–Hamilton derived atlas remains valid and is unaffected by this no-go. The general, canonical Schreier-to-minimal rank-five Demuškin **integral syzygy map** on arbitrary non-pro-2 residual families is still a separate stronger frontier. Routine iterations remain TeX-only unless a PDF is explicitly requested.
