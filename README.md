# Arithmetic Cartan single-prime atlas

**Latest integrated manuscript: [fixed128 — genuine non-pro-2 S3 Sylow–Schreier–Hecke and marked Jacobian certificate](arithmetic_cartan_representations_closure_fixed128_s3_sylow_schreier_hecke.tex)** (October 2026).

Prior full manuscripts are preserved:
[fixed127](arithmetic_cartan_representations_closure_fixed127_exact_hilbert_full_marked_fox_bridge.tex),
[fixed126](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex),
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex), and
[fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

## New in fixed128

This version crosses **the remaining pro-2-image boundary in one genuine residual example**, without claiming a universal full-group resolution.

1. **A real S3 / GL2(F2) local Galois sector.** For
   \[
   L=\mathbb Q_2(\sqrt[3]{2},\zeta_3),\quad
   \Gamma=G_{\mathbb Q_2},\quad
   H=G_{\mathbb Q_2(\sqrt[3]{2})},
   \]
   the quotient \(\Gamma\to\operatorname{Gal}(L/\mathbb Q_2)\simeq S_3\) is tame and the Sylow-2 preimage has odd index three. The integral standard 2-dimensional carrier is
   \[
   S_0=\begin{pmatrix}0&1\\1&0\end{pmatrix},
   \quad U_0=\begin{pmatrix}-1&-1\\1&0\end{pmatrix}.
   \]
   The maximal pro-2 quotient of \(H\) is a rank-five, \(q=2\) Demuškin group with full orientation image.

2. **Exact finite Schreier table and degree-one integral corestriction.** Right coset representatives \(1,\tau,\tau^2\) yield the literal Schreier words \(\sigma,\tau^3,\tau^i x_j\tau^{-i}\) (six wild conjugates). On the standard \(T=\mathbb Z_2^2\), corestriction kills the tame values of a cocycle and gives
   \[
   (\operatorname{cor}c)(x_j)=
   \sum_{i=0}^2 U_0^{-i}c(\tau^ix_j\tau^{-i}).
   \]
   The all-arity bar formula is included; it is not mislabeled as a minimal Fox change-of-basis map.

3. **A genuine nonnormal integral Hecke projector.** On \(R\Gamma(H,T)\), put \(A=\operatorname{res}\operatorname{cor}\), \(\mathsf T_{\rm Hk}=A-I\). Then
   \[
   A^2=3A,\quad \mathsf T_{\rm Hk}^2=\mathsf T_{\rm Hk}+2I,\quad
   e_H=\frac{I+\mathsf T_{\rm Hk}}3.
   \]
   The nontrivial double coset is \(\operatorname{cor}_N^H\circ(\tau)_*\circ\operatorname{res}_N^H\), with \(N=G_L\). It uses no division by two. The exact natural-lattice cohomology ledgers are
   \[
   (H^0,H^1,H^2)(\Gamma,T)=(0,\mathbb Z_2^2,0),
   \quad
   (H^0,H^1,H^2)(H,T)=(\mathbb Z_2,\mathbb Z_2^7,\mathbb F_2).
   \]
   Thus \(e_H\) kills the degree-zero and degree-two classes of \(H\), and projects its rank-seven \(H^1\) to rank two.

4. **The first native, non-pro-2, second-degree marked coefficient certificate.** For \(M=\operatorname{ad}T\),
   \[
   (H^0,H^1,H^2)(\Gamma,M)
      =(\mathbb Z_2,\mathbb Z_2^5,\mathbb F_2),\qquad
   (\dim H^0,\dim H^1,\dim H^2)(\Gamma,M/2)=(1,6,1).
   \]
   The actual full Roe–Turturean marked two-relation Jacobian is an **8 by 16 integral matrix**. Its mod-2 rank is 7. The one-based columns \(\{1,2,5,6,9,13,14,15\}\) have a displayed mod-4 submatrix of determinant \(2\bmod4\). Therefore its Smith factors are \(1^7,2\), and the full marked coefficient complex has the precise local cohomology above. A finite (noncanonical) integral homotopy comparison with the Sylow–Fox retract follows by elementary-divisor reduction.

## Scope of the new theorem

The computation proves a **coefficient-specific** full-marked/Fox derived comparison for the standard tame S3 adjoint carrier. It does not claim that the two Roe–Turturean relators give a universally exact projective resolution of \(\mathbb Z_2\) over \(\mathbb Z_2[[G_{\mathbb Q_2}]]\). A general direct, canonical Schreier-to-minimal-Demuškin integral chain map, including its relation syzygies, remains open for arbitrary non-pro-2 residual sectors. The prime-uniform all-Sylow/Cayley–Hamilton derived existence theorem is preserved.

The **[fixed128 standalone insert](dyadic_s3_sylow_schreier_hecke_jacobian_fixed128.tex)** is fully integrated into the linked mother TeX. Earlier standalone inserts remain in the repository for provenance.

Routine revisions are TeX-only unless PDF is requested.
