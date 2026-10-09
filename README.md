# Arithmetic Cartan single-prime atlas

**Current integrated main manuscript: [fixed126 — Dyadic Hilbert-marked Fox and profinite-power effectivity](arithmetic_cartan_representations_closure_fixed126_dyadic_hilbert_marked_power_streamlined.tex)** (October 2026).

All earlier substantive manuscripts remain available unchanged:
[fixed125](arithmetic_cartan_representations_closure_fixed125_dyadic_wu_tate_streamlined.tex),
[fixed124](arithmetic_cartan_representations_closure_fixed124_dyadic_streamlined.tex), and
[fixed123](arithmetic_cartan_representations_closure_fixed123_streamlined.tex).

The following standalone insertions are already integrated into the main manuscript:
- [Dyadic four-case classification and orientation](dyadic_fox_bockstein_orientation_completion_v1.tex).
- [Dyadic Fox–Wu–Tate extension](dyadic_fox_wu_tate_completion_v1.tex).
- [Fixed126: Hilbert-marked and profinite-power extension](dyadic_hilbert_marked_power_effectivity_v1.tex).

## Fixed126: substantive new results

1. **Exact Hilbert-marked Fox comparison.** For the marked Demuškin relator $a^2s^4[s,y]$ with unramified marking $\nu_{\rm ur}(a,s,y)=(-2,1,0)$, two Kummer characters are canonically located:
   $\kappa_{-1}=\chi_a$ and $\kappa_5=\chi_s$.
   The third is $\kappa_2=\chi_y+\epsilon\chi_s$, where $\epsilon\in\mathbb F_2$ records a genuine **remaining coordinate shear**, not a cup-product invariant.
   Both the Fox and Hilbert cup matrices in the corresponding bases are
   $\begin{psmallmatrix}1&0&0\\0&0&1\\0&1&0\end{psmallmatrix}$.

2. **Integral rank-one deformation ring.** The trivial residual character of $G_{\mathbb Q_2}$ has universal framed deformation ring
   \[
   R^\square_{\mathbf1}\simeq\mathcal O_E[[u,v,w]]/(u(u+2)).
   \]
   Its special fiber $k_E[[u,v,w]]/(u^2)$ is genuinely nonreduced, witnessing the nonalternating Fox cup-square obstruction. After inverting $2$ the branches $u=0,-2$ are separated by the idempotent $-u/2$.

3. **Explicit local profinite idempotent power.** For $X\in\mathrm{GL}_r(A)$ with residual order $N=2^a m$ ($m$ odd), choose $e\equiv1\bmod 2^a$ and $e\equiv0\bmod m$; with $c=(1-e)/N\in\mathbb Z_2$,
   \[
   X^{\omega_2}=X^e\sum_{j\ge0}\binom cj(X^N-I)^j.
   \]
   Each $\mathfrak m^t$-quotient needs only $j<t$, and the full matrix Jacobian has a terminating formula with $j\le t$.

4. **Formal-native full-$G_{\mathbb Q_2}$ marked-word solver.** Conditional on the cited Roe–Turturean marked presentation, the $\sigma^{\omega_2}$ and $(x_i\tau)^{\omega_2}$ terms in the literal full-group relations are explicitly evaluable on every complete genuine residual sector. The ambient complete matrix-equation quotient is the framed deformation ring; its first derivative has kernel $Z^1(G_{\mathbb Q_2},\mathrm{ad}\,\bar\rho)$. The marked wild pro-$2$ condition is automatic on these genuine sectors.

## Scope and remaining boundaries

- The calculations above are **integral formal**, including arbitrary requested finite-order jets, but do not claim that the infinite profinite-power series globally belongs to a single finite-type polynomial chart.
- The remaining Hilbert-to-Fox shear $\epsilon$ is coordinate data requiring one more generator marking; it does not prevent computation of the cup form.
- A full uniform marked profinite word presentation for **every** finite dyadic extension $K/\mathbb Q_2$, and a preferred direct raw-Herr-to-marked-word chain map, are *not* claimed.
- The unconditional prime-uniform all-Sylow/Cayley–Hamilton derived faithful atlas and the integral-versus-rational Herr separation are retained from fixed123–fixed125.
