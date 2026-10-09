# SageMath 10.9 exact 3-sheet Fox-Shapiro and Hecke chain projector.
# Run: sage checks/fixed134_s3_coinduced_strict_hecke.sage
#
# This verifies, over QQ with only odd denominators, the strict
# integral diagonal/augmentation splitting in cochain degrees 0,1,2.
# The same Γ-linear scalar coset projector extends to any complete
# coefficient module B with pro-2 restriction to H, by Fox naturality.
# This source is provided for local execution, not asserted to be CI-run.
from sage.all import *

I=identity_matrix(QQ,3)
Z=zero_matrix(QQ,3)
Sigma=matrix(QQ,[[1,0,0],[0,0,1],[0,1,0]])
Tau=matrix(QQ,[[0,1,0],[0,0,1],[1,0,0]])
P=(I+Tau+Tau**2)/3
Q=I-P

assert Sigma**2==I and Tau**3==I
assert Sigma*Tau*Sigma==Tau**2
assert P**2==P and Q**2==Q
assert P*Q==0 and P+Q==I

# Three-sheet full marked coefficient complex, trivial H-coefficients.
# d0: 3 -> 12, d1: 12 -> 6.
d0=block_matrix([[Sigma-I],
                 [Tau-I],
                 [Z],
                 [Z]])
d1=block_matrix([
 [Sigma*(Tau-I),Sigma-I-Tau,Z,Z],
 [Z,3*P,4*P-2*I,Sigma-P]
])
assert d0.nrows()==12 and d0.ncols()==3
assert d1.nrows()==6 and d1.ncols()==12
assert d1*d0==zero_matrix(QQ,6,3)

E0=P
E1=block_diagonal_matrix([P,P,P,P])
E2=block_diagonal_matrix([P,P])
assert E1*d0==d0*E0
assert E2*d1==d1*E1
assert E1**2==E1 and E2**2==E2
assert (E0.rank(),E1.rank(),E2.rank())==(1,4,2)

# The two genuine augmentation vectors give the natural rank-two
# S3 lattice on all three coset fibers (note the exact ordering).
one=vector(QQ,[1,1,1])
b1=vector(QQ,[-1,0,1])
b2=vector(QQ,[-1,1,0])
B=matrix(QQ,[list(one),list(b1),list(b2)]).transpose()
S=matrix(QQ,[[0,1],[1,0]])
U=matrix(QQ,[[-1,-1],[1,0]])
assert B.det()==-3
assert B.inverse()*Sigma*B==block_diagonal_matrix([matrix(QQ,[[1]]),S])
assert B.inverse()*Tau*B==block_diagonal_matrix([matrix(QQ,[[1]]),U])
assert P*B.column(0)==B.column(0)
assert P*B.column(1)==zero_vector(QQ,3)
assert P*B.column(2)==zero_vector(QQ,3)

D0=block_diagonal_matrix([B.inverse(),B.inverse(),
                          B.inverse(),B.inverse()])
D1=block_diagonal_matrix([B,B])
# Complete degree-1 and degree-2 fiber transformations:
A0=B.inverse()
A1=block_diagonal_matrix([B.inverse()]*4)
A2=block_diagonal_matrix([B.inverse()]*2)
transd0=A1*d0*B
transd1=A2*d1*block_diagonal_matrix([B]*4)
# In the direct-sum basis (scalar,natural_2) per generator:
# the full transformed matrices have no mixing of the 1 and 2
# sectors at any generator/relator block.
for i in range(4):
    assert transd0[3*i,1] == 0 and transd0[3*i,2] == 0
    assert transd0[3*i+1,0] == 0 and transd0[3*i+2,0] == 0
for i in range(2):
    for j in range(4):
        top=transd1[3*i:3*i+3,3*j:3*j+3]
        assert top[0,1]==0 and top[0,2]==0
        assert top[1,0]==0 and top[2,0]==0

# Explicit global trivial two-relator Fox row and natural T row:
J_scalar=matrix(QQ,[[0,-1,0,0],[0,3,2,0]])
Ls=S*(U-identity_matrix(QQ,2))
Lt=S-identity_matrix(QQ,2)-U
Jn=block_matrix([
 [Ls,Lt,zero_matrix(QQ,2),zero_matrix(QQ,2)],
 [zero_matrix(QQ,2),zero_matrix(QQ,2),-2*identity_matrix(QQ,2),S]
])
for i in range(2):
    for j in range(4):
        block=transd1[3*i:3*i+3,3*j:3*j+3]
        assert block[0,0]==J_scalar[i,j]
        assert block[1:3,1:3]==Jn[2*i:2*i+2,2*j:2*j+2]

# The projection is strictly integral at p=2.
for A in [B,B.inverse(),P,Q,E0,E1,E2,d0,d1,
          transd0,transd1]:
    assert all(ZZ(x.denominator())%2 for x in A.list())

print("PASS fixed134: exact coinduced 3-sheet Fox differential,"
      " strict degree-0/1/2 idempotents, global scalar/natural"
      " block decomposition and integral coset averaging")
