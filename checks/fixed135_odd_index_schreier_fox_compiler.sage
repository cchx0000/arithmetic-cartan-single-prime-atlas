# SageMath 10.9: fixed135 uniform odd-index Roe--Turturean Fox compiler.
# Usage: sage checks/fixed135_odd_index_schreier_fox_compiler.sage
#
# A. Exact index-5 Q2(2^(1/5)) permutation/affine Fox matrix.
# B. Odd-unit/one-two Smith certificates at indices 3,5,15,17.
# C. Strict normalized-coset projector transitivity at indices 3,5,15.
# The group-level finite-wreath universality and Burnside--Nielsen
# proof is in the TeX; modular matrix tests are regression evidence.
# The existence of this script in GitHub is not a claim of CI execution.
from sage.all import *

def matrices(m):
    I = identity_matrix(ZZ,m)
    S = matrix(ZZ,m,m,lambda i,j: 1 if j==(2*i)%m else 0)
    T = matrix(ZZ,m,m,lambda i,j: 1 if j==(i+1)%m else 0)
    Si = S.inverse()
    Si2 = Si*Si
    N = matrix(ZZ,m,m,lambda i,j: 1)
    assert Si*T*S == T**2
    assert T**m == I
    assert sum([T**j for j in range(m)],
               zero_matrix(ZZ,m,m)) == N
    assert S.det().is_unit() and T.det().is_unit()
    # Multiply the m wild-face rows by m, an odd Z_2 unit.
    J = zero_matrix(ZZ,2*m,4*m)
    J.set_block(0,0,Si*(T-I))
    J.set_block(0,m,Si-I-T)
    J.set_block(m,m,(Si2+2*I)*N)
    J.set_block(m,2*m,(Si2+3*I)*N-2*m*I)
    J.set_block(m,3*m,m*Si-N)
    return I,S,T,N,J

def two_adic_minor_certificate(J):
    nr,nc = J.nrows(),J.ncols()
    assert nc==2*nr
    # Exact elimination over Z/4: choose odd unit pivots only.
    A=[[int(J[i,j])%4 for j in range(nc)] for i in range(nr)]
    rank=0
    cols=[]
    for j in range(nc):
        q=rank
        while q<nr and A[q][j]%2==0:
            q+=1
        if q==nr:
            continue
        A[q],A[rank]=A[rank],A[q]
        inv=1 if A[rank][j]==1 else 3
        A[rank]=[(inv*x)%4 for x in A[rank]]
        for k in range(nr):
            if k!=rank:
                v=A[k][j]
                if v:
                    A[k]=[(A[k][c]-v*A[rank][c])%4
                          for c in range(nc)]
        cols.append(j+1)
        rank+=1
        if rank==nr:
            break
    assert rank==nr-1
    assert any(entry==2 for entry in A[rank])
    return cols, A[rank]

for m in [3,5,15,17]:
    I,S,T,N,J=matrices(m)
    rank=matrix(GF(2),J).rank()
    assert rank==2*m-1
    piv,tail=two_adic_minor_certificate(J)
    assert len(piv)==2*m-1
    assert any(x==2 for x in tail)
    order=1
    t=2%m
    while t!=1:
        order+=1
        t=(2*t)%m
    assert order & (order-1)==0   # cyclic tame 2-power complement
    print("m=%d: ord_m(2)=%d, mod2 rank=%d, %d unit pivots"
          " and one exact factor 2" % (m,order,rank,len(piv)))

# Index-five exact integer determinants.
I,S,T,N,J=matrices(5)
cols9=[0,1,2,3,5,15,16,17,18]
cols10=cols9+[10]
minor9=J.matrix_from_rows_and_columns(list(range(9)),cols9)
minor10=J.matrix_from_rows_and_columns(list(range(10)),cols10)
assert minor9.det()==-125
assert minor10.det()==-1250
assert sorted(abs(t) for t in J.elementary_divisors()) == [1]*9+[2]

# Strict cover-to-cover maps on the scalar coefficient complex.
# Each degree has 1,4,2 copies of the same uniform coset transfer.
def direct_sum(M, n):
    return block_diagonal_matrix([M]*n)
def pcoset(m,n):
    return matrix(QQ,m,n,lambda i,j: QQ(1)/n)
def cochain_data(m):
    I,S,T,N,J=matrices(m)
    I,S,T,N=map(lambda X: matrix(QQ,X),[I,S,T,N])
    P=N/m
    d0=block_matrix([[S-I],[T-I],
                     [zero_matrix(QQ,m,m)],[zero_matrix(QQ,m,m)]])
    d1=block_matrix([
      [S.inverse()*(T-I),S.inverse()-I-T,
       zero_matrix(QQ,m,m),zero_matrix(QQ,m,m)],
      [zero_matrix(QQ,m,m),(S.inverse()**2+2*I)*P,
       (S.inverse()**2+3*I)*P-2*I,
       S.inverse()-P]
    ])
    assert d1*d0==zero_matrix(QQ,2*m,m)
    return d0,d1

for m in [3,5,15]:
    d0m,d1m=cochain_data(m)
    for n in [3,5,15]:
        d0n,d1n=cochain_data(n)
        A0=pcoset(m,n)
        A1=direct_sum(A0,4)
        A2=direct_sum(A0,2)
        assert d0m*A0==A1*d0n
        assert d1m*A1==A2*d1n
        for A in [A0,A1,A2]:
            assert all(int(x.denominator())%2 for x in A.list())

for m in [3,5,15]:
    for n in [3,5,15]:
        for k in [3,5,15]:
            assert pcoset(k,n)*pcoset(n,m)==pcoset(k,m)
            assert pcoset(m,n)*pcoset(n,m)==pcoset(m,m)

print("PASS fixed135: index-5 minors -125/-1250;"
      " odd Sylow indices 3/5/15/17; strict cross-cover"
      " three-degree cochain maps and exact transitivity")
