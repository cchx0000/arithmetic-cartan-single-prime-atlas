# SageMath 10.9: independent finite rational/integral-local verification of
# fixed129 strict S_3 natural-coefficient cochain contraction and
# 16-by-16 Schreier/Hecke projector.  No Magma or network access.
#
# Run:
#   sage checks/fixed129_s3_natural_integral_retract.sage
#
# Rational verification is sufficient for the displayed matrix identities:
# every denominator is odd, hence every matrix belongs to Z_2.
from sage.all import *

S = matrix(QQ, [[0,1],[1,0]])
U = matrix(QQ, [[-1,-1],[1,0]])
I = identity_matrix(QQ,2)
O = zero_matrix(QQ,2)

assert S**2 == I
assert U**3 == I
assert S**(-1)*U*S == U**2
assert I+U+U**2 == O

R_sigma = S-I
R_tau = U-I
L_sigma = S**(-1)*(U-I)
L_tau = S**(-1)-I-U
assert R_tau.det() == 3
assert L_sigma.det() == -3
assert S.det() == -1

d0 = block_matrix([[R_sigma], [R_tau], [O], [O]])
d1 = block_matrix([[L_sigma, L_tau, O, O],
                   [O, O, -2*I, S**(-1)]])
p  = block_matrix([[O, O, I, O]])
i  = block_matrix([[O], [O], [I], [2*S]])
h1 = block_matrix([[O, R_tau**(-1), O, O]])
h2 = block_matrix([[L_sigma**(-1), O],
                   [O, O],
                   [O, O],
                   [O, S]])

assert d0.nrows() == 8 and d0.ncols() == 2
assert d1.nrows() == 4 and d1.ncols() == 8
assert d1*d0 == 0
assert p*d0 == 0
assert d1*i == 0
assert p*i == I
assert h1*d0 == I
assert d1*h2 == identity_matrix(QQ, 4)
assert d0*h1 + h2*d1 == identity_matrix(QQ,8)-i*p

I_sch = block_matrix([[O], [O], [I], [U], [U**2],
                      [2*S], [2*U*S], [2*U**2*S]])
P_sch = (QQ(1)/3)*block_matrix([
          [O, O, I, U**(-1), U**(-2), O, O, O]])
E_sch = I_sch*P_sch

assert I_sch.nrows() == 16 and P_sch.ncols() == 16
assert P_sch*I_sch == I
assert E_sch**2 == E_sch
assert E_sch.rank() == 2

# All rational entries of the explicit contraction and projection are 2-integral.
for A in [d0, d1, p, i, h1, h2, I_sch, P_sch, E_sch]:
    assert all(ZZ(entry.denominator()) % 2 == 1 for entry in A.list())

E_mod2 = matrix(GF(2), E_sch.nrows(), E_sch.ncols(),
                [GF(2)(ZZ(x.numerator()) % 2) for x in E_sch.list()])
assert E_mod2.rank() == 2
assert E_mod2**2 == E_mod2

# Literal Hecke polynomial for the chosen strict rank-two projector.
T_hecke = 3*E_sch - identity_matrix(QQ,16)
assert T_hecke**2 == T_hecke + 2*identity_matrix(QQ,16)

print("PASS: fixed129 S3 integral marked contraction, Schreier projector,"
      " rank-two reduction and strict Hecke polynomial")
