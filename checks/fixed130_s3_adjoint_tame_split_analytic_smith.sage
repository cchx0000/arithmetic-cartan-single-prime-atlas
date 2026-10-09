# Sage 10.9 exact audit for fixed130: S3 adjoint tame splitting,
# explicit integral Fox diagonalization, and elementary Smith factors.
# Usage: sage checks/fixed130_s3_adjoint_tame_split_analytic_smith.sage
# The present commit supplies this reproducible source, not a CI assertion.
from sage.all import *

R=ZZ
Q=QQ
S=matrix(R, [[0,1],[1,0]])
U=matrix(R, [[-1,-1],[1,0]])
I=identity_matrix(R,2)
O=zero_matrix(R,2)
U2=U*U
assert S*S == I and U**3 == I and S*U*S == U2

# All four columns are genuine 2-adic integral endomorphisms.
V=(Q(1)/3)*matrix(Q,[[-1,1],[2,1]])
W=S*V*S
B=matrix(Q,4,4,[[-1,0,-Q(1)/3,Q(1)/3],
                [-1,1,Q(1)/3,Q(2)/3],
                [1,-1,Q(2)/3,Q(1)/3],
                [0,-1,Q(1)/3,-Q(1)/3]])
assert B.det() == 1
assert U*V*U2 == -V+W
assert U*W*U2 == -V
assert S*V*S == W
assert U+U2 == -I
assert all(x.denominator() % 2 for x in B.list()+B.inverse().list())

E11=matrix(Q,[[1,0],[0,0]])
E12=matrix(Q,[[0,1],[0,0]])
E21=matrix(Q,[[0,0],[1,0]])
E22=matrix(Q,[[0,0],[0,1]])
basis=[E11,E12,E21,E22]
def adjoint_matrix(g):
    gi=matrix(Q,g).inverse()
    return matrix(Q,4,4,
         [[(g*b*gi)[a//2,a%2] for b in basis]
           for a in range(4)])
AS=B.inverse()*adjoint_matrix(S)*B
AU=B.inverse()*adjoint_matrix(U)*B
assert AS == block_diagonal_matrix([S,S])
assert AU == block_diagonal_matrix([I,U])

# In the invariant summand U acts as 1 and S swaps U,U^2.
# Its literal full-group marked coefficient complex is
#    (Sa-2I)b, 3b+2c+(S-I)d .
L=S-2*I
d0_0=block_matrix([[S-I],[O],[O],[O]])
d1_0=block_matrix([[O,L,O,O],
                   [O,3*I,2*I,S-I]])
assert L.det() == 3
assert d1_0*d0_0 == 0

# On the complementary summand, action matrices are the natural S3 pair.
Rsig=S-I
Rtau=U-I
Lsig=S.inverse()*(U-I)
Ltau=S.inverse()-I-U
d0_1=block_matrix([[Rsig],[Rtau],[O],[O]])
d1_1=block_matrix([[Lsig,Ltau,O,O],
                   [O,O,-2*I,S.inverse()]])
assert d1_1*d0_1 == 0
assert Rtau.det() == 3 and Lsig.det() == -3

# Assemble full 4-dimensional ad(T) coefficient complex in
# coefficient-block order, equivalent by permutation to the original.
d0=block_diagonal_matrix([d0_0,d0_1])
d1=block_diagonal_matrix([d1_0,d1_1])
assert d0.nrows()==16 and d0.ncols()==4
assert d1.nrows()==8 and d1.ncols()==16
assert d1*d0==0
assert [abs(x) for x in d1.elementary_divisors()] == [1,1,1,1,1,1,1,2]
assert [abs(x) for x in d0.elementary_divisors()] == [1,1,1,0]

# Literal diagonal basis of the reduced invariant Fox core:
# v=r(1,1)+s(1,0), a=alpha(1,0)+beta(-1,1),
# c=c_e(1,0)+c_f(-1,1),
# d=d_e(1,0)+d_+(1,1).
ep=vector(R,[1,1])
e=vector(R,[1,0])
f=vector(R,[-1,1])
for k in range(32):
    r,s,alpha,beta,ce,cf,de,dp=(R(k*17+13*j+2) for j in range(8))
    v=r*ep+s*e
    a=alpha*e+beta*f
    c=ce*e+cf*f
    d=de*e+dp*ep
    assert (S-I)*v == s*f
    assert 2*c+(S-I)*d == (de+2*cf)*f+(2*ce)*e

# The unique top F2 class is represented by the U direction.
assert U.trace()==-1 and U2.trace()==-1
assert V.trace()==0 and W.trace()==0

print("PASS fixed130: unimodular tame decomposition, full integral"
      " block differentials, Smith (1^7,2), normalized Fox basis")
