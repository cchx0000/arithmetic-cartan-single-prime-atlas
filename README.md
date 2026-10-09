# Arithmetic Cartan single-prime atlas

**Current integrated TeX manuscript: [fixed132 — quadratic-étale crossed wild transport, dyadic return parity and Schreier exchange elimination](arithmetic_cartan_representations_closure_fixed132_crossed_etale_schreier_exchange.tex)** (October 2026).

Earlier complete sources remain preserved:
[fixed131](arithmetic_cartan_representations_closure_fixed131_universal_tame_wild_obstruction.tex),
[fixed130](arithmetic_cartan_representations_closure_fixed130_s3_adjoint_tame_analytic_smith.tex),
[fixed129](arithmetic_cartan_representations_closure_fixed129_s3_natural_strict_integral_hecke.tex),
[fixed128](arithmetic_cartan_representations_closure_fixed128_s3_sylow_schreier_hecke.tex),
[fixed127](arithmetic_cartan_representations_closure_fixed127_exact_hilbert_full_marked_fox_bridge.tex),
[fixed126](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex),
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex),
and [fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

## The new fixed132 result

Continue on the full completed framed residual deformation family
\[
G_{\mathbb Q_2}\twoheadrightarrow
S_3\simeq\mathrm{GL}_2(\mathbb F_2),
\]
not only on its fixed tame representation. Write the actual tame lifts
\(X=\rho(\tau)\), \(Y=\rho(\sigma)\).
The fixed131 tame relation proves
\(X^3=1\), \(X^2+X+1=0\), \(Y^2=q\in A^\times\)
and the **integral native frame**
\[
M_2(A)=C\oplus CY,\qquad
C=A[X]\simeq A[T]/(T^2+T+1),\quad
\iota(X)=X^2.
\]

1. **A complete crossed quadratic-étale multiplication and inverse.** For \(a,b,c,d\in C\),
   \[
   (a+bY)(c+dY)
   =(ac+qb\iota(d))+(ad+b\iota(c))Y,
   \quad
   (a+bY)^{-1}
   =\frac{\iota(a)-bY}{N(a)-qN(b)}.
   \]
   Thus the previously abstract four adjoint \(M_0/M_1\) transport blocks are now explicit, integral rational functions of transport-native coefficients, with unit denominators only.

2. **Precise quadratic return defect and an extra factor of two.** The wild noncentral component \(b\) satisfies the exact commutator
   \([a+bY,X]=b(X^2-X)Y\).
   The diagonal \(M_0\) transport differs from the identity only at order \(b^2\). For arbitrary group elements, the exact two-step projected return defects obey
   \[
   \mathscr F_{00}\in\mathfrak J^2,\qquad
   \mathscr F_{11}\in2\mathfrak J^2,
   \]
   where \(\mathfrak J\) is the wild off-isotypic ideal. The paper gives both complete closed expressions. **In characteristic two the projected \(M_1\) diagonal block is exactly multiplicative even in a nonsplit family**; the \(M_0\) block can still show genuine quadratic return. A concrete test over \(\mathbb F_2[u,v]/(u^2,v^2)\) has
   \(\mathscr F_{00}(I+uY,I+vXY)(X)=uv I\neq0\) and \(\mathscr F_{11}=0\). It is a matrix-carrier example, not an unsupported claim of a complete Galois deformation.

3. **Actual index-three Schreier exchange identities.** For \(w_{ij}=\tau^ix_j\tau^{-i}\),
   \[
   \rho(w_{ij})=a_j+b_jX^{2i}Y,\qquad
   b_{0j}+b_{1j}+b_{2j}=0.
   \]
   The \(3\times3\) quadratic diagonal-return array has **every row and column sum zero**, integrally at all orders. If \(a_j=1\), it becomes the exact complete-graph \(K_3\) Laplacian:
   \[
   \mathscr K_{i\ell}(z)=
   \frac{qN(b_j)}{(1-qN(b_j))^2}
   (3\delta_{i\ell}-1)(z-\iota(z)).
   \]

4. **Elimination of two of the four wild split equations.** The actual Roe–Turturean wild matrix relation, projected onto the \(CY\) part, has an invertible \(2\times2\) Jacobian in the second wild off-isotypic coordinate \(b_1\). A formal implicit-function/Hensel argument uniquely solves \(b_1=\mathcal G(b_0;\text{tame and diagonal data})\), with
   \[
   \mathcal G(0)=0,\qquad b_1\in\mathfrak m(b_0).
   \]
   Consequently, **on the full complete genuine residual deformation ring**, the scheme-theoretic fixed131 tame-isotypic split ideal is
   \[
   \boxed{\mathfrak I_{\mathrm{split}}=(\eta_0,\xi_0)},
   \]
   where \(b_0=\eta_0+\xi_0X\). Two scalar generators suffice, and fixed131 already shows they are linearly independent at the residual point. The full proof includes a finite-precision terminating Hensel row algorithm for \(b_1\bmod\mathfrak m^t\). The ideal is not asserted to be regular or to define a smooth quotient.

5. **One-source control and the remaining actual syzygy frontier.** After the complete marked wild relation is imposed, the first wild off-isotypic packet \(b_0\) controls both wild generators' off-block transport, all six Schreier conjugates, and their quadratic return arrays. The resulting finite coefficient exchange identities are **not** identities among relators in \(\mathbb Z_2[[G_F(2)]]\). Constructing the explicit minimal rank-five Demuškin Fox relation and integral degree-two syzygy comparison remains a stronger open task.

## Sources and reproducibility

The standalone [fixed132 crossed-étale / Schreier exchange proof](dyadic_s3_crossed_etale_schreier_exchange_fixed132.tex) is included verbatim in the complete main TeX.

Two SageMath 10.9 regression sources were committed:
- [Crossed multiplication, four blocks, dyadic return factor and \(K_3\) curvature](checks/fixed132_s3_crossed_schreier_return.sage).
- [Finite-level literal marked-word regression for second-wild elimination](checks/fixed132_s3_wild_elimination_finite_levels.sage).

Independent modular matrix checks during authoring covered 125 general crossed-algebra inverses/blocks, 342 general-alpha Schreier quadratic returns and zero sums modulo \(256\), all nine normalized \(K_3\) entries in 40 cases, and the marked-wild relation at moduli \(8\) and \(16\). These repository Sage sources are provided for reproduction and are **not** claimed to have run as CI. Routine iterations remain TeX-only unless PDF is specifically requested.
