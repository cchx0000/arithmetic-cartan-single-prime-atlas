# Arithmetic Cartan single-prime atlas

**Latest integrated main manuscript: [fixed133 — actual index-three pro-2 Schreier relators and integral minimal Fox syzygy closure](arithmetic_cartan_representations_closure_fixed133_s3_minimal_schreier_fox_syzygy.tex)** (October 2026).

Previous complete manuscripts are preserved:
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

## Fixed133: first genuine group-relator (not coefficient-only) Schreier--Fox closure

Continue on the **real non-pro-2 S3 quotient** of $G_{\mathbb Q_2}$ with Sylow preimage
\[
H=G_F,\quad F=\mathbb Q_2(\sqrt[3]{2}),\quad
[\Gamma:H]=3,\quad P_F=H(2).
\]
The previous fixed128–132 computations did not fully identify the three Schreier wild relations with a minimal relation module. Fixed133 closes this **specific marked** pro-2 group-relator interface.

1. **Actual three-sheet marked Reidemeister–Schreier relation words.**
   Before tame elimination the covering has ten Schreier generators
   \[
   s_0=\sigma,\ s_1=\tau\sigma\tau^{-2},\
   s_2=\tau^2\sigma\tau^{-1},\
   t=\tau^3,\
   w_{ij}=\tau^i x_j\tau^{-i}.
   \]
   The three indexed tame relators are precisely
   \[
   s_0^{-1}s_1,\quad
   s_2^{-1}ts_0t^{-1},\quad
   s_1^{-1}s_2t^{-1}.
   \]
   In the maximal pro-2 quotient they force $s_0=s_1=s_2=s$ and $t=1$.
   The indexed wild relators are then **literal completed pro-2 words**
   $R_i=H_i u_{1,i}^{-1}s^{-1}v_{2i}s c_i$,
   with all auxiliary words written explicitly in the integrated manuscript and the [standalone proof](dyadic_s3_pro2_schreier_fox_tietze_fixed133.tex).
   In particular
   \[
   u_{j,i}=(w_{i,j}w_{i+1,j}w_{i+2,j})^{1/3},
   \]
   where cyclic indices are valid **after** $t=1$.
   Finite wreath quotients preserve the original Roe–Turturean marked wild pro-2 condition. This is an actual presentation of $P_F$, not a false bare-two-relator presentation of the full absolute Galois group.

2. **Two primitive wild relation directions and a complete five-generator / one-relator reduction.**
   The genuine three-by-seven augmented Fox matrix has
   \[
   \varepsilon(\partial_{a_k}R_i)=4/3-2\delta_{ik},
   \quad
   \varepsilon(\partial_{v_k}R_i)=\delta_{k,2i}-1/3,\quad
   \varepsilon(\partial_s R_i)=0.
   \]
   The $(R_1,R_2)$ vs $(v_0,v_1)$ determinant is **$-1/3$**, a $2$-adic unit. Hence the map replacing $v_0,v_1$ by $R_1,R_2$ is a true automorphism of the free pro-2 group (pro-p Burnside basis theorem). Its inverse gives a choice-dependent but finite-jet-computable one-relator presentation
   \[
   P_F\simeq\langle s,a_0,a_1,a_2,v_2\mid \mathscr R_F\rangle_{\mathrm{pro}-2}.
   \]

3. **The literal surviving degree-two Fox symbol is nondegenerate.**
   Adding $R_0R_1R_2$ has the exact integral first Fox row $(0,2,2,2,0,0,0)$, and the surviving mod-two quadratic symbol is
   \[
   \boxed{\sigma_2(\mathscr R_F)
   =A_0^2+A_1^2+A_2^2+SV+VS}.
   \]
   Its cup matrix, in the ordered basis $(s,a_0,a_1,a_2,v_2)$, is
   \[
   B_F=
   \begin{pmatrix}
   0&0&0&0&1\\
   0&1&0&0&0\\
   0&0&1&0&0\\
   0&0&0&1&0\\
   1&0&0&0&0
   \end{pmatrix},\qquad\det_{\mathbb F_2}B_F=1.
   \]
   This is the nonalternating rank-five dyadic Demuškin form, and its augmented Fox ideal is exactly $(2)$.

4. **An explicit six-by-ten integral three-sheet Fox certificate.**
   Coinduce the trivial $H$-lattice along the three cosets. The genuine full marked Fox two-skeleton has degrees $(3,12,6)$ and admits two primitive tree-edge contractions. The remaining six-by-ten augmented face matrix, after multiplying its three wild rows by the odd unit $3$, has **mod-two rank five**. Explicit minors of size five and six have determinants **$-3$ and $-18$**. Thus its Smith factors are $(1,1,1,1,1,2)$, recovering
   \[
   (H^0,H^1,H^2)(H,\mathbb Z_2)
   =(\mathbb Z_2,\mathbb Z_2^4,\mathbb F_2).
   \]

5. **Actual completed group-algebra Fox chain cancellation.**
   For *any* complete coefficient module $M$ with $H$-action factoring through $P_F$, the marked covering two-complex admits an integral chain change
   \[
   \boxed{
   C_{\mathrm{cover}}^\bullet(H,M)
   \cong C_{\mathrm{Fox}}^\bullet(P_F,M)
   \oplus[M^2\xrightarrow{1}M^2]_{[0,1]}
   \oplus[M^5\xrightarrow{1}M^5]_{[1,2]}.}
   \]
   The seven cancellations are exactly two tree edges, three tame Nielsen pairs and two wild Nielsen pairs. Over $\mathbb Z_2[[P_F]]$, the remaining single relation gives the genuine exact length-two Demuškin resolution. Its Fox Jacobian transition comes from the explicit marked Schreier scan and the invertible pro-2 Nielsen automorphism; every prescribed finite pro-2 word/coefficient jet can be evaluated by a terminating quotient computation. This is a **choice-dependent integral group-relator bridge** for the selected $S_3$ Sylow preimage and therefore applies across all coefficient sectors restricted to this fixed $P_F$.

## Proof source and independent reproducibility

- [Complete fixed133 pro-2 Schreier, Nielsen and Fox theorem insertion](dyadic_s3_pro2_schreier_fox_tietze_fixed133.tex) — already integrated verbatim in the linked main TeX.
- [SageMath 10.9 audit: group Schreier relations, degree-two Magnus, full coinduced Fox matrix and finite wreath checks](checks/fixed133_s3_pro2_schreier_fox_tietze.sage).
- The earlier [fixed132 crossed-étale wild and Schreier exchange work](dyadic_s3_crossed_etale_schreier_exchange_fixed132.tex) is retained intact, but its exchange identities are no longer mistaken for the group relations themselves.

During authoring, the three indexed group-word identities were checked in 144 finite wreath/affine cases, the quadratic Magnus cup matrix was independently calculated with all seven generators, and the exact augmented Fox minors were verified. The Sage script is provided for local reproduction and is **not** claimed to have been executed in CI. Routine iterations remain TeX-only unless PDF is requested.

## The remaining (strictly stronger) frontier

Fixed133 settles a genuine source-level Schreier-to-minimal Fox relation and degree-two syzygy comparison **for the chosen index-three field $F=\mathbb Q_2(\sqrt[3]{2})$**. The selected Nielsen inverse is an effective pro-2 *inverse-limit* word, not a universally finite ordinary word. It is not canonical under arbitrary markings and does not by itself supply a uniform presentation for every finite dyadic extension or every non-pro-2 residual image. A global, presentation-independent minimal Fox gauge across all such fields remains a separate problem. The original all-Sylow/Cayley–Hamilton derived faithful finite-atlas theorem is unaffected.
