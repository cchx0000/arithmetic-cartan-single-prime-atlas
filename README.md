# Arithmetic Cartan single-prime atlas

**Current integrated manuscript: [fixed127 — Exact dyadic reciprocity and strict full-marked/Nielsen–Fox bridge](arithmetic_cartan_representations_closure_fixed127_exact_hilbert_full_marked_fox_bridge.tex)** (October 2026).

Earlier integrated TeX versions are retained:
[fixed126](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex),
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex), and
[fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

## What's newly proved in fixed127

**1. The last Hilbert–Fox coordinate shear is exactly zero.**
The full Roe–Turturean arithmetic-reciprocity marking fixes the pro-2 abelianizations of the standard Demuškin generators:
\[
\bar a=\operatorname{rec}(-4),\quad
\bar s=\operatorname{rec}(1/2),\quad
\bar y=\operatorname{rec}(-3).
\]
Hilbert evaluation gives \(\kappa_{-1}=\chi_a\), \(\kappa_5=\chi_s\), \(\kappa_2=\chi_y\), with no remaining \(\epsilon\). Thus the square-class Hilbert pairing is the Fox formula \((u,v)_2=(-1)^{bb'+ch'+hc'}\) in the coordinates \(u=(-1)^b5^c2^h\), \(v=(-1)^{b'}5^{c'}2^{h'}\).
Under the literal Nielsen change \(\sigma=s\), \(x_1=y\), \(x_0=s^{-2}a^{-1}\), the marked generator classes are \(\operatorname{rec}(1/2)\), \(\operatorname{rec}(-3)\), and \(\operatorname{rec}(-1)\).

**2. Exact compression of the full-GQ2 marked presentation on pro-2 residual image sectors.**
If \(\operatorname{im}\bar\rho\) is a 2-group, every integral framed deformation lift has pro-2 image, the tame generator satisfies \(\tau=1\), and every \(\omega_2\)-power is the identity on this sector. The full marked relators reduce to the three-generator relation
\[
 R=P_0Q_0,\qquad P_0=x_0^{\sigma^2}x_0,\qquad Q_0=[x_1,\sigma].
\]
The corresponding full-group and maximal-pro-2 framed deformation rings coincide on the complete residual sector.

**3. Closed integral chain equivalence, not just an abstract zigzag.**
The relation identity
\[
R=Q_0^{-1}(a^2s^4[s,y])^{-1}Q_0
\]
under \(a=x_0^{-1}\sigma^{-2},s=\sigma,y=x_1\)
gives an explicit strict Nielsen–Fox cochain isomorphism in degrees 0, 1 and 2.
The complete marked pro-2 Fox differential is written as a literal finite noncommutative derivative row. The full tame/wild Jacobian splits as
\[
\begin{pmatrix}0&L\\d_{\rm mark}^1&B_\tau\end{pmatrix},
\quad
L=\rho_M(\sigma)^{-1}-2I,
\]
where \(L\) is a unit and \(B_\tau\) has a closed formula in the marked transport matrices. Row elimination leaves the standard Demuškin Fox perfect complex plus a contractible tame block.
This gives a direct integral full-group marked-Jacobian-to-Sylow–Fox chain comparison **when the residual image is a 2-group**.

**4. Complete rank-one marked equations and exact Jacobian.**
On the trivial residual rank-one chart the literal scalar full-group relations are \(r_t=T^{-1}\) and \(r_{\rm wild}=X_0^2T^3\). Their complete relation ideal is
\[
(z_\tau,\ z_0(z_0+2)),
\]
giving the same hypersurface deformation ring as fixed126. The exact integral adjoint cochain Jacobian in \((\sigma,\tau,x_0,x_1)\) coordinates is
\[
\begin{pmatrix}0&-1&0&0\\0&3&2&0\end{pmatrix},
\]
whose cohomology is \(H^1=\mathcal O_E^2\), \(H^2=\mathcal O_E/2\mathcal O_E\). After reduction to \(k_E\), the tangent dimension jumps to 3 and the obstruction dimension is 1.

## Source sections and scope

The standalone source [dyadic reciprocity and strict Nielsen–Fox bridge](dyadic_reciprocity_sylow_nielsen_bridge_v1.tex) is included verbatim in fixed127. The previous separate insertions remain available:
[dyadic classification](dyadic_fox_bockstein_orientation_completion_v1.tex),
[Fox–Wu–Tate](dyadic_fox_wu_tate_completion_v1.tex),
and [Hilbert-marked profinite-power formulas](dyadic_hilbert_marked_power_effectivity_v1.tex).

The bridge above is *not* claimed on arbitrary non-pro-2 residual images: those require a finite-index Sylow preimage, restriction/corestriction and a further Schreier/syzygy comparison. The broader all-Sylow/Cayley–Hamilton derived finite-atlas results are unchanged. Formal profinite idempotent matrix powers on non-pro-2 residual sectors still use the finite-jet binomial construction of fixed126.

Routine revisions are TeX-only unless a PDF is specifically requested.
