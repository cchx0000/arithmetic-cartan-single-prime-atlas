# Arithmetic Cartan single-prime atlas

**Latest integrated manuscript: [fixed135 — Uniform odd-index dyadic Schreier–Fox compilation and cross-Sylow coherence](arithmetic_cartan_representations_closure_fixed135_odd_sylow_fox_compiler.tex)** (October 2026).

Every prior complete manuscript is retained:
[fixed134](arithmetic_cartan_representations_closure_fixed134_s3_integral_fox_tate_trace.tex),
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

## Fixed135: the main extension beyond the index-three S3 source

Version fixed134 achieved exact integral Fox--Shapiro/Tate cohomology on the chosen $S_3$ residual quotient of $G_{\mathbb Q_2}$. Fixed135 identifies a **uniform odd-index marked pro-2 source compiler**, based on the externally verified Roe–Turturean presentation, with the original *normal pro-2 wild-closure requirement kept explicitly*.

For **any** odd-index open $H\subset G_{\mathbb Q_2}$ of index $m$, this normal wild subgroup lies in $\operatorname{Core}_\Gamma(H)$. The actual marked Schreier cover then contains $m$ vertices, $4m$ directed generator edges and $2m$ indexed relation faces. Contracting a coset spanning tree leaves
\[
d=3m+1\ \text{generators},\quad r=2m\ \text{relators}.
\]

1. **Exact pro-2 subgroup presentation via finite wreath induction.** Every finite 2-group quotient of the rewritten Schreier relations induces an admissible finite wreath quotient of the original four-generator marked source, because the wild generator images lie in the normal 2-group base. Conversely the genuine $H(2)$ quotients satisfy those relations. This proves that the Schreier relator quotient is *exactly*
   \[
   \boxed{H(2)=G_F(2),\quad [F:\mathbb Q_2]=m}
   \]
   without silently discarding the marked wild condition or assuming that the two bare full-group relators present $G_{\mathbb Q_2}$.

2. **Uniform primitive integral Fox/Nielsen elimination.** Local Demuškin duality gives minimal $H(2)$ generator rank $m+2$ and one defining relation. The actual $2m\times(3m+1)$ **augmented Fox matrix** therefore has rank
   \[
   \boxed{\operatorname{rank}_{\mathbb F_2}J_{\rm aug}=2m-1.}
   \]
   Selecting a $(2m-1)$-unit minor identifies an actual pro-2 free Nielsen basis in which precisely $2m-1$ indexed relators become generator letters. Their elimination gives a genuine, finite-jet-computable presentation with $m+2$ generators and one relation. For any coefficient module $B$ factoring through $H(2)$, the complete cover Fox complex has an **integral group-level chain decomposition**
   \[
   \boxed{
   C^\bullet_{\rm cover}(H,B)\cong
   C^\bullet_{\rm Fox}(H(2),B)
   \oplus[B^{m-1}\xrightarrow{1}B^{m-1}]_{[0,1]}
   \oplus[B^{2m-1}\xrightarrow{1}B^{2m-1}]_{[1,2]}.}
   \]
   All inverse Nielsen words and their Fox derivatives terminate in every specified finite pro-2 quotient/coefficient jet.

3. **The literal four-generator/two-relator marked coefficient complex now covers *every* residual sector of $G_{\mathbb Q_2}$.** For any finite projective continuous 2-adic module $B$ over a complete local algebra with finite residual field, take $H$ to be the preimage of a Sylow-2 subgroup of its finite residual image. Then $m=[\Gamma:H]$ is odd and $\rho_B(H)$ is pro-2. The coinduced coefficient representation
   \[
   V=\operatorname{Coind}_H^\Gamma(B|_H)
   \]
   has a strict integral coset projector
   \[
   \boxed{P_H=\tfrac1m{\bf1}_m{\bf1}_m^t}.
   \]
   Coinduced Fox–Shapiro, the group-level odd-index compiler and Shapiro descent yield
   \[
   \boxed{\mathcal J^\bullet_{\Gamma,\rm marked}(B)
       \simeq R\Gamma(G_{\mathbb Q_2},B)}
   \]
   on **every** such residual coefficient sector. This remains a *marked coefficientwise* result; there is no claim that the bare two-word full profinite relator complex is independently a universal finite free resolution over $\mathbb Z_2[[G_{\mathbb Q_2}]]$.

4. **One fixed marked Q2 cochain compiler for every finite dyadic $K$.** For any finite $K/\mathbb Q_2$, of odd or even degree, and any finite projective $G_K$ coefficient module $B$, finite-index coinduction $V_K=\operatorname{Coind}_{G_K}^{G_{\mathbb Q_2}}B$ gives
   \[
   \boxed{\mathcal J^\bullet_{G_{\mathbb Q_2},\rm marked}(V_K)
     \simeq R\Gamma(G_K,B).}
   \]
   This is a finite *coefficient-cochain* reduction, not a claim that every $G_K$ has the same four-generator marked word presentation.

5. **Strict overlap coherence without intersecting Sylows.** For any two odd-index covers $H_i,H_j$ applicable to the same coefficient module, let $\iota_i$ and $p_i$ be their constant-coset embedding/normalized averaging. The strict maps $\Phi_{ji}=\iota_jp_i$ satisfy
   \[
   \boxed{\Phi_{kj}\Phi_{ji}=\Phi_{ki},\qquad
   \Phi_{ij}\Phi_{ji}=E_i.}
   \]
   This works even when $H_i\cap H_j$ has even index, so there is no unnecessary common-Sylow assumption. After chosen minimal Fox contractions $C_i\rightleftarrows F_i$ with homotopy $h_i$, the first **explicit higher transition** is
   \[
   \mathfrak H_{kji}
   =q_k\Phi_{kj}h_j\Phi_{ji}j_i,\qquad
   T_{ki}-T_{kj}T_{ji}
   =d\mathfrak H_{kji}+\mathfrak H_{kji}d.
   \]
   The projected layer is strictly coherent; preferred all-arity canonical minimal Fox Nielsen frames are not claimed.

6. **A new independent index-five tame test.** Let
   \[
   F_5=\mathbb Q_2(\sqrt[5]2),\quad
   \operatorname{Gal}(F_5(\zeta_5)/\mathbb Q_2)
   \simeq C_5\rtimes C_4.
   \]
   Its genuine index-five Sylow cover has degrees $(5,20,10)$ and reduces to the seven-generator one-relator Demuškin group $G_{F_5}(2)$. An exact coinduced **$10\times20$ integer Fox matrix** is displayed in block-permutation form in the TeX. Its mod-2 rank is nine. A 9-by-9 minor is **$-125$**, and a 10-by-10 minor is **$-1250$**, proving the 2-adic Smith list
   \[
   \boxed{(1,1,1,1,1,1,1,1,1,2).}
   \]
   Additional cyclic tame cases of indices $3,15,17$ pass independent modulo-four unit-pivot tests, with exactly $2m-1$ unit directions and one factor 2.

## Files and validation

The full substantive addition is preserved as
[fixed135 general odd-index proof source](dyadic_general_odd_sylow_fox_coherence_fixed135.tex),
included verbatim in the linked complete master TeX.

The new [SageMath 10.9 exact matrix/regression script](checks/fixed135_odd_index_schreier_fox_compiler.sage) verifies the index-five integer minors, odd-index unit pivots for $m=3,5,15,17$, and strict cover-to-cover cochain maps at $m=3,5,15$ when executed. Independent modulo-256 arithmetic checks of the three index-changing cochain maps and 27 strict composition triples passed during authoring. This repository script is provided as reproducible source, **not** represented as CI-executed.

**Remaining boundary:** the native marked coefficient compiler is general on the $G_{\mathbb Q_2}$ source, and ordinary dyadic extension cohomology follows by coinduction. Still missing is a *single canonical, marking-independent minimal pro-2 presentation and all-arity closed higher-coherence chart* for every finite dyadic field and every changing residual image. The theorem's Nielsen inverses and minimal gauges are explicitly choice-dependent, though finite-jet-computable. Routine versions are TeX-only unless a PDF is explicitly requested.
