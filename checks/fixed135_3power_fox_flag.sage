# SageMath 10.9 exact regression for fixed135.
#
# Run locally:
#   sage checks/fixed135_3power_fox_flag.sage
#
# It verifies the complete cyclic 3^r coinduced Fox differential,
# its primitive mod-two top trace and exact integer right-inverse
# over Z/256 for r=1,2,3, the new exact 9-sheet 17x17/18x18
# determinant certificates, and strict 9-sheet projector coherence.
# This uploaded source is NOT represented as an executed CI run.
from sage.all import *

def perms(m):
    assert m%2==1
    u=inverse_mod(2,m)
    sigma=zero_matrix(ZZ,m,m)
    tau=zero_matrix(ZZ,m,m)
    for j in range(m):
        sigma[(u*j)%m,j]=1
        tau[(j+1)%m,j]=1
    eye=identity_matrix(ZZ,m)
    assert sigma.inverse()*tau*sigma==tau**2
    return sigma,tau

def mark_matrix(m):
    S,T=perms(m)
    I=identity_matrix(QQ,m)
    P=ones_matrix(QQ,m,m)/m
    Z=zero_matrix(QQ,m)
    A=S.inverse()*(T-I)
    B=S.inverse()-I-T
    J=block_matrix(QQ,2,4,[
        A,B,Z,Z,
        Z,3*P,4*P-2*I,S.inverse()-P
    ],subdivide=False)
    d0=block_matrix(QQ,4,1,[
        S-I,T-I,Z,Z
    ],subdivide=False)
    assert J*d0==zero_matrix(QQ,2*m,m)
    return S,T,I,P,d0,J

def exact_solve(m,loops=25):
    S0,T0=perms(m)
    R=Integers(256)
    S=matrix(R,S0)
    T=matrix(R,T0)
    I=identity_matrix(R,m)
    P=R(m)**(-1)*ones_matrix(R,m,m)
    Q=I-P
    antider=R(m)**(-1)*sum(
        (j*T**j for j in range(m)),zero_matrix(R,m))
    assert (T-I)*antider==Q
    def eval_d1(a,b,c,d):
        tame=S.inverse()*(T-I)*a+(S.inverse()-I-T)*b
        wild=3*P*b+(4*P-2*I)*c+(S.inverse()-P)*d
        return tame,wild
    for k in range(loops):
        # Keep honest integer lifts so division by two is legitimate.
        ft=[(19*k+13*i+3)%256 for i in range(m)]
        fw=[(31*k+47*i+5)%256 for i in range(m)]
        tr=3*sum(ft)+sum(fw)
        if tr%2:
            fw[0]+=1
            tr+=1
        t=vector(R,ft)
        w=vector(R,fw)
        a=antider*S*Q*t
        b=-P*t
        c=R(tr//2)*R(m)**(-1)*vector(R,[1]*m)
        d=S*Q*w
        got=eval_d1(a,b,c,d)
        assert got==(t,w)
        v=vector(R,[17*k+11*i+1 for i in range(m)])
        da=(S-I)*v
        db=(T-I)*v
        assert eval_d1(da,db,vector(R,m),vector(R,m))==(
            vector(R,m),vector(R,m))

for r in [1,2,3]:
    m=3**r
    S,T,I,P,d0,J=mark_matrix(m)
    Jmod2=matrix(GF(2),2*m,4*m,[
        GF(2)(ZZ(q.numerator())%2)
        /GF(2)(ZZ(q.denominator())%2)
        for q in J.list()
    ])
    assert Jmod2.rank()==2*m-1
    assert matrix(GF(2),4*m,m,[GF(2)(ZZ(q)) for q in d0.list()]).rank()==m-1
    lam=vector(QQ,[3]*m+[1]*m)
    wanted=vector(QQ,[0]*(2*m)+[2]*m+[0]*m)
    assert lam*J==wanted
    exact_solve(m)
    print("m=%d: mod-2 Fox rank %d, exact trace solver passed"
          %(m,2*m-1))

# The new nine-sheet exact minor certificate; multiply the
# wild face rows by the odd unit 9 to obtain an integer matrix.
m=9
S,T,I,P,d0,J=mark_matrix(m)
D=matrix(ZZ,2*m,4*m,[
    ZZ(J[i,j]) if i<m else ZZ(m*J[i,j])
    for i in range(2*m) for j in range(4*m)
])
piv=[0,1,2,3,4,5,6,7,17,27,28,29,30,31,32,33,34]
rows17=list(range(9))+list(range(10,18))
det17=D.matrix_from_rows_and_columns(rows17,piv).det()
det18=D.matrix_from_columns(piv+[26]).det()
assert det17==-3**14
assert det18==-2*3**16
assert matrix(GF(2),D).rank()==17

# All 17 unit source columns avoid the eight tau tree edges 9..16.
assert all(j<9 or j>16 for j in piv)
assert D.nrows()==18 and D.ncols()==36

# Canonical nested nine-sheet fiber averaging, 1+2+6.
C=matrix(QQ,9,9,lambda i,j: QQ(1)/3 if i%3==j%3 else 0)
E0=P
E1=C-P
E2=I-C
Es=[E0,E1,E2]
for j,A in enumerate(Es):
    assert A**2==A
    assert A*S==S*A and A*T==T*A
    for k,B in enumerate(Es):
        assert A*B==(A if j==k else zero_matrix(QQ,9))
assert sum(Es,zero_matrix(QQ,9))==I
assert [A.rank() for A in Es]==[1,2,6]
for A in Es+[C]:
    assert all(ZZ(x.denominator())%2 for x in A.list())

# The quotient of the nine roots by the intermediate cubic extension
# is reduction of root exponents modulo three, equivariant under
# j->j+1 and j->5j.
assert all((5*j)%3==(2*(j%3))%3 for j in range(9))
assert all(((j+1)%9)%3==(j+1)%3 for j in range(9))

print("PASS fixed135: nine-sheet exact 17/18 minors,"
      " uniform 3-power primitive Fox trace, and strict"
      " integral 1+2+6 Hecke projector flag")
