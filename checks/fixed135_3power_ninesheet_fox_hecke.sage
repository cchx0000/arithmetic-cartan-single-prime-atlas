# SageMath 10.9 regression of fixed135 index-three/index-nine
# Fox--Shapiro matrices, 2-local Smith factors, tame/wild unit
# Tietze pivots, and strict nested integral Hecke idempotents.
#
# Run: sage checks/fixed135_3power_ninesheet_fox_hecke.sage
# (Uploaded regression source; not asserted to be a CI result.)
from sage.all import *

def coset_data(n):
    assert n in (3, 9)
    I = identity_matrix(ZZ,n)
    S = zero_matrix(ZZ,n)
    U = zero_matrix(ZZ,n)
    for i in range(n):
        S[i, (2*i)%n] = 1
        U[i, (i+1)%n] = 1
    assert S.inverse()*U*S == U**2
    assert U**n == I
    if n==9:
        assert S**6 == I
        assert S**3 != I
        assert S**3*U*(S**3).inverse() == U**(-1)
    else:
        assert S**2 == I

    N = matrix(ZZ,n,n,1)
    P = matrix(QQ,N)/n
    # Complete marked coinduced coefficient complex:
    #   0->Q^n -> (Q^n)^4 -> (Q^n)^2 ->0 .
    d0 = block_matrix([
        [S-I],[U-I],
        [zero_matrix(QQ,n,n)],
        [zero_matrix(QQ,n,n)]])
    d1 = block_matrix([
        [S.inverse()*(U-I), S.inverse()-I-U,
         zero_matrix(QQ,n,n), zero_matrix(QQ,n,n)],
        [zero_matrix(QQ,n,n), 3*P, 4*P-2*I,
         S.inverse()-P]])
    assert d1*d0 == zero_matrix(QQ,2*n,n)
    assert all(x.denominator()%2 for x in d1.list())

    # Remove n-1 tree columns in the tau coordinate, then
    # multiply the n wild relation rows by n (a 2-adic unit).
    keep = [j for j in range(4*n)
            if j not in list(range(n,2*n-1))]
    C = d1.matrix_from_columns(keep)
    D = matrix(ZZ,2*n,3*n+1,
      [ZZ(C[i,j]*(n if i>=n else 1))
       for i in range(2*n) for j in range(3*n+1)])
    block_expected=block_matrix([
      [S.inverse()*(U-I),
       matrix(ZZ,n,1,[ZZ(-(i==n-1)) for i in range(n)]),
       zero_matrix(ZZ,n,n),
       zero_matrix(ZZ,n,n)],
      [zero_matrix(ZZ,n,n),
       matrix(ZZ,n,1,[3]*n),
       4*N-2*n*I, n*S.inverse()-N]])
    assert D == block_expected
    assert matrix(GF(2),D).rank() == 2*n-1
    factors = [int(x) for x in D.elementary_divisors() if x != 0]
    def v2(x):
        x=abs(x);v=0
        while x%2==0:
            x//=2;v+=1
        return v
    assert sorted(v2(x) for x in factors)==[0]*(2*n-1)+[1]
    assert len(factors)==2*n

    # Exact n tame unit pivot (leave sigma_0), and the (n-1)
    # primitive wild relation minor against v_1,...,v_(n-1).
    tame = D.matrix_from_rows_and_columns(
       list(range(n)),list(range(1,n))+[n])
    assert tame.det() in (1,-1)
    # Wild v-block has row 0 removed and column v0 removed.
    wild = D.matrix_from_rows_and_columns(
       list(range(n+1,2*n)),list(range(2*n+2,3*n+1)))
    assert abs(wild.det())==n**(n-2)

    if n==9:
        cols = [0,1,2,3,4,5,6,7,9,10,
                19,20,21,22,23,24,25,26]
        A18 = D.matrix_from_columns(cols)
        assert A18.det() == -18*9**7
        B17 = D.matrix_from_rows_and_columns(
            list(range(17)),
            [0,1,2,3,4,5,6,7,9,
             19,20,21,22,23,24,25,26])
        assert B17.det() == -9**7

    return (S,U,d0,d1,D)

S3,U3,_,_,D3=coset_data(3)
S9,U9,d0,d1,D9=coset_data(9)
I9=identity_matrix(QQ,9)
P1=matrix(QQ,9,9,lambda i,j: QQ(1)/9)
P3=matrix(QQ,9,9,lambda i,j:
    QQ(1)/3 if i%3==j%3 else QQ(0))
E=[P1,P3-P1,I9-P3]
assert [x.rank() for x in E] == [1,2,6]
assert sum(E)==I9
for i,e in enumerate(E):
    assert e**2==e
    assert e*S9==S9*e and e*U9==U9*e
    for j,f in enumerate(E):
        if i!=j: assert e*f==zero_matrix(QQ,9)
assert P3*P1==P1 and P1*P3==P1
for e in E+[P3]:
    E1=block_diagonal_matrix([e]*4)
    E2=block_diagonal_matrix([e]*2)
    assert E1*d0==d0*e
    assert E2*d1==d1*E1
    assert all(x.denominator()%2 for M in [e,E1,E2] for x in M.list())

print("PASS fixed135: index9 (18x28) mod2 rank17,"
      " 2-local SNF (1^17,2), minors -9^7/-18*9^7,"
      " 3-power tame/wild primitive minors and strict"
      " rank-1/2/6 chain Hecke projectors")
