# Arithmetic Cartan single-prime atlas

**Latest complete integrated TeX manuscript: [fixed134 — Integral dyadic Fox–Tate top traces and strict three-sheet coinduced Hecke descent](arithmetic_cartan_representations_closure_fixed134_s3_integral_fox_tate_trace.tex)** (October 2026).

All earlier full versions are preserved:
[fixed133](arithmetic_cartan_representations_closure_fixed133_s3_minimal_schreier_fox_syzygy.tex),
[fixed132](arithmetic_cartan_representations_closure_fixed132_crossed_etale_schreier_exchange.tex),
[fixed131](arithmetic_cartan_representations_closure_fixed131_universal_tame_wild_obstruction.tex),
[fixed130](arithmetic_cartan_representations_closure_fixed130_s3_adjoint_tame_analytic_smith.tex),
[fixed129](arithmetic_cartan_representations_closure_fixed129_s3_natural_strict_integral_hecke.tex),
[fixed128](arithmetic_cartan_representations_closure_fixed128_s3_sylow_schreier_hecke.tex),
[fixed127](arithmetic_cartan_representations_closure_fixed127_exact_hilbert_full_marked_fox_bridge.tex),
[fixed126](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex),
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex),
and [fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

## Fixed134: source-owned integral Tate trace and an exact coefficient-uniform S3 projector

Continue in the **same genuine non-pro-2 residual sector**
\[
\Gamma=G_{\mathbb Q_2}\twoheadrightarrow S_3,\qquad
H=G_F,\quad F=\mathbb Q_2(\sqrt[3]{2}),\quad[\Gamma:H]=3.
\]
Fixed133 gave the actual three-indexed wild Schreier relators and their pro-2 Nielsen reduction to the minimal five-generator one-relator Demuškin group \(P_F=H(2)\). Fixed134 supplies its complete rank-one **degree-two trace** and upgrades the index-three covering comparison into a strict cochain projector for the whole selected residual coefficient category.

### Exact rank-one Fox--Tate matrices and a primitive three-face trace

In the seven-generator, three-relator coordinates
\((s,a_0,a_1,a_2,v_0,v_1,v_2)\), the cyclotomic orientation is
\[
\theta(s)=1,\quad\theta(a_i)=-1,\quad\theta(v_i)=-1/3.
\]
The full **twisted integral Fox row** is
\[
J_\theta=
\begin{pmatrix}
0&0&-2&2&6/7&-9/7&3/7\\
0&2&0&-2&3/7&27/7&-30/7\\
0&-2&2&0&-9/7&-18/7&27/7
\end{pmatrix}.
\]
Its column sums vanish, and its indicated two-by-two minor is \(27/7\), a 2-adic unit. Therefore
\[
\operatorname{im}J_\theta
=\ker\bigl(\operatorname{Tr}_F:\mathbb Z_2^3\to\mathbb Z_2\bigr),
\quad \operatorname{Tr}_F(q_0,q_1,q_2)=q_0+q_1+q_2,
\]
and **\(H^2(P_F,\mathbb Z_2(1))\cong\mathbb Z_2\)** by the literal face sum.

For trivial coefficients, the equally explicit matrix \(J_{\mathbf1}\) instead has
\[
\operatorname{im}J_{\mathbf1}
=\{q:\operatorname{Tr}_F(q)\in2\mathbb Z_2\},
\]
so **\(H^2(P_F,\mathbb Z_2)\cong\mathbb Z/2\)** by the same trace reduced mod two.

Their complete Fox cochain homotopy types show the unique elementary Bockstein pair shifts degree:
\[
\begin{aligned}
C^\bullet(P_F,\mathbb Z_2)
&\simeq \mathbb Z_2[0]\oplus\mathbb Z_2^4[-1]
 \oplus[\mathbb Z_2\xrightarrow{2}\mathbb Z_2]_{[1,2]},\\
C^\bullet(P_F,\mathbb Z_2(1))
&\simeq [\mathbb Z_2\xrightarrow{2}\mathbb Z_2]_{[0,1]}
 \oplus\mathbb Z_2^4[-1]\oplus\mathbb Z_2[-2].
\end{aligned}
\]
The marked mod-four Wu class is
\(w_F=\chi_{a_0}+\chi_{a_1}+\chi_{a_2}\); it satisfies
\(\chi^2=\chi\cup w_F\) for every mod-two \(H^1\) class, agreeing with the fixed133 nonalternating cup matrix.

### Full-group face rows and an exact factor-three restriction

For the rank-one trivial/cyclotomic modules the Roe–Turturean full marked **two-relator** Fox rows, with source \((\sigma,\tau,x_0,x_1)\) and target (tame,wild), are
\[
J_{\Gamma,\mathbf1}=
\begin{pmatrix}0&-1&0&0\\0&3&2&0\end{pmatrix},
\qquad
J_{\Gamma,\theta}=
\begin{pmatrix}0&-1&0&0\\0&-3&0&0\end{pmatrix}.
\]
The global top-face functionals are \(w+3t\bmod2\) and \(w-3t\), respectively.
After normalizing the tame face to zero, one wild face lifts to
\((c,c,c)\) on the three Schreier sheets. Hence
\[
\operatorname{Tr}_{F,\theta}\operatorname{res}_{F/\mathbb Q_2}
=3\operatorname{Tr}_{\Gamma,\theta},
\]
with the corresponding reduction modulo two for the trivial coefficient. This is the explicit source normalization of the local Tate invariant restriction/corestriction law.

### Stronger theorem: strict Hecke/Fox projector for **all** residual S3 coefficient modules

Let \(A\) be a complete local 2-adic coefficient algebra and \(B\) a finite projective continuous \(\Gamma\)-representation whose restriction to the selected \(H\) has pro-2 image. This includes the universal S3 residual framed family and its adjoints/tensor coefficient modules.

The coinduced module
\[
V=\operatorname{Coind}_H^\Gamma(B|_H)
\simeq B\otimes_{\mathbb Z_2}\mathbb Z_2[\Gamma/H]
\]
has the **integral strict coset projector**
\[
P_3=\tfrac13
\begin{pmatrix}1&1&1\\1&1&1\\1&1&1\end{pmatrix}.
\]
It acts on the entire three-sheet marked Fox complex in degrees \(0,1,2\) through
\[
E^0=P_3,\qquad E^1=\operatorname{diag}(P_3,P_3,P_3,P_3),\qquad
E^2=\operatorname{diag}(P_3,P_3).
\]
These are **literal commuting chain idempotents**. In the augmentation basis
\(e_2-e_0,\ e_1-e_0\), the complementary 2-dimensional coset action is the natural integral \(S_3\) lattice \(T\) of fixed128–129. Thus
\[
\boxed{
C_{\rm cover}^\bullet(H,B)
\cong C_{\rm marked}^\bullet(\Gamma,B)
\oplus C_{\rm marked}^\bullet(\Gamma,B\otimes T).
}
\]
The genuine fixed133 group-level Schreier–Fox resolution of \(H(2)\), together with Shapiro and the odd index, proves **sectorwise coefficient completeness**
\[
C_{\rm marked}^\bullet(\Gamma,B)\simeq R\Gamma(\Gamma,B)
\]
through all three degrees; the selected strict cochain idempotent represents
\(\frac13\operatorname{res}\operatorname{cor}\).
For \(B=\mathbb Z_2\) and \(B=\mathbb Z_2(1)\), the augmentation complement has derived type \(\mathbb Z_2^2[-1]\); the fixed129 contraction gives a concrete homotopy in the untwisted case.

**Scope:** This is a theorem on the fixed S3 residual sector and its pro-2 Sylow preimage, not a universal projective two-relator resolution over \(\mathbb Z_2[[G_{\mathbb Q_2}]]\) for arbitrary residual images. The unweighted top-face trace is specialized to the two rank-one coefficients; the cochain completeness and projector hold for the indicated arbitrary \(B\).

## Sources and reproducibility

The [independent fixed134 proof insertion](dyadic_s3_relative_fox_tate_trace_fixed134.tex) is integrated verbatim into the main TeX. Two reproduction scripts have been committed:

- [Sage/Python exact twisted/trivial Fox matrices and Tate trace](checks/fixed134_s3_fox_tate_trace.sage).
- [Sage exact coinduced three-sheet projector and natural-augmentation matrix splitting](checks/fixed134_s3_coinduced_strict_hecke.sage).

During authoring, the rows, 2-adic unit minors, global/full-group marked rows, and degree-0/1/2 strict projector identities were independently checked in exact rational Python/SymPy. The repository Sage scripts are provided for independent reproduction and are not claimed as CI runs. Routine manuscript revisions remain TeX-only unless a PDF is requested.

## Remaining frontier

For this chosen index-three S3 extension, fixed133–fixed134 provide the group-level minimal Demuškin Fox resolution and a coefficient-uniform odd-index chain comparison. What remains stronger is a **canonical**, marking-independent and higher-coherent direct Schreier-to-minimal-Fox system covering *arbitrary* odd-index non-pro-2 residual quotients and finite dyadic base fields, with explicit changes of syzygy frames under transitions. The global all-Sylow/Cayley–Hamilton derived atlas remains unchanged.
