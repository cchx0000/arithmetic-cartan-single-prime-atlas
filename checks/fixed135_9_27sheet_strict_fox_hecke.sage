# SageMath 10.9 / Python 3 exact finite-ring audit for fixed135.
# Usage: sage checks/fixed135_9_27sheet_strict_fox_hecke.sage
#
# Certifies:
#  - tame C9 ⋊ C6 right-coset permutations on 9 and 27 sheets;
#  - complete coinduced marked Fox matrices (9,36,18), (27,108,54);
#  - d1*d0=0, 2-adic Smith classes (1^(2n-1),2);
#  - rank-(n-1) primitive degree-zero boundary;
#  - integral four-stage nested coset projectors 1,3,9,27;
#  - orthogonal layer ranks 1,2,6,18 and strict Hecke polynomial;
#  - selected columns of the LITERAL marked group wild/tame words
#    in a finite affine wreath representation modulo 256.
# Pure Python is used so the source also runs under the Sage Python kernel.
# This file is a reproducibility certificate, not a claim of CI execution.

from fractions import Fraction as Fr

MOD = 256

def res(x):
    return x % MOD

def ident_perm(n):
    return tuple(range(n))

def perm_comp(a, b):
    # Matrix action: (a b)(i) = a(b(i)).
    return tuple(a[b[i]] for i in range(len(a)))

def perm_inv(a):
    return tuple(a.index(i) for i in range(len(a)))

def perm_pow(p, k):
    out = ident_perm(len(p))
    while k:
        if k & 1:
            out = perm_comp(out, p)
        p = perm_comp(p, p)
        k //= 2
    return out

def identity(n):
    return [[int(i == j) for j in range(n)] for i in range(n)]

def zeros(h, w):
    return [[0 for _ in range(w)] for __ in range(h)]

def action(p):
    n = len(p)
    A = zeros(n, n)
    for i in range(n):
        A[p[i]][i] = 1
    return A

def msub(A,B):
    return [[res(A[i][j]-B[i][j]) for j in range(len(A[0]))]
            for i in range(len(A))]

def mscale(A,c):
    return [[res(c*v) for v in row] for row in A]

def matmul(A,B):
    C = zeros(len(A),len(B[0]))
    for i in range(len(A)):
        for k in range(len(B)):
            v = A[i][k]
            if v:
                for j in range(len(B[0])):
                    C[i][j] = res(C[i][j]+v*B[k][j])
    return C

def odd_inverse(a):
    for v in range(1,MOD,2):
        if res(a*v)==1:
            return v
    raise AssertionError("expected odd pivot "+str(a))

def rank_mod_two(A):
    B=[[x%2 for x in row] for row in A]
    k=0
    pivots=[]
    for j in range(len(B[0])):
        if k==len(B):
            break
        r=k
        while r<len(B) and B[r][j]==0:
            r+=1
        if r==len(B):
            continue
        B[k],B[r]=B[r],B[k]
        for i in range(len(B)):
            if i!=k and B[i][j]:
                for c in range(j,len(B[i])):
                    B[i][c]^=B[k][c]
        pivots.append(j+1)
        k+=1
    return k,pivots

def smith_mod_2power(A):
    B=[row[:] for row in A]
    rank=0
    pivots=[]
    for j in range(len(B[0])):
        if rank==len(B):
            break
        i=rank
        while i<len(B) and B[i][j]%2==0:
            i+=1
        if i==len(B):
            continue
        B[i],B[rank]=B[rank],B[i]
        u=odd_inverse(B[rank][j])
        B[rank]=[res(u*x) for x in B[rank]]
        for i in range(len(B)):
            if i==rank:
                continue
            fac=B[i][j]
            if fac:
                B[i]=[res(B[i][k]-fac*B[rank][k])
                      for k in range(len(B[i]))]
        pivots.append(j+1)
        rank+=1
    return rank,pivots,B[rank:]

def build_perms(n):
    if n==9:
        s=tuple(5*i%9 for i in range(9))
        t=tuple((i-1)%9 for i in range(9))
        return s,t
    assert n==27
    def pos(i,j):
        return 9*j+i%9
    s=[]
    t=[]
    for q in range(27):
        i,j=q%9,q//9
        s.append(pos(i,j-1) if j>0 else pos(-i,2))
        t.append(pos(i-[1,5,7][j],j))
    return tuple(s),tuple(t)

def fox(n):
    sp,tp=build_perms(n)
    assert perm_pow(sp,6)==ident_perm(n)
    assert perm_pow(tp,9)==ident_perm(n)
    assert perm_comp(perm_comp(perm_inv(sp),tp),sp)==perm_pow(tp,2)
    Sigma=action(sp)
    SigmaInv=action(perm_inv(sp))
    Tau=action(tp)
    Id=identity(n)
    norm=zeros(n,n)
    perm=ident_perm(n)
    for _ in range(9):
        for j in range(n):
            norm[perm[j]][j]+=1
        perm=perm_comp(perm,tp)
    Pt=mscale(norm,odd_inverse(9))
    assert matmul(Pt,Pt)==Pt

    tame_sigma=matmul(SigmaInv,msub(Tau,Id))
    tame_tau=msub(msub(SigmaInv,Id),Tau)
    wild_tau=mscale(Pt,3)
    wild_x0=msub(mscale(Pt,4),mscale(Id,2))
    wild_x1=msub(SigmaInv,Pt)

    d1=zeros(2*n,4*n)
    for piece,ri,ci in [
        (tame_sigma,0,0),
        (tame_tau,0,n),
        (wild_tau,n,n),
        (wild_x0,n,2*n),
        (wild_x1,n,3*n)]:
        for i in range(n):
            for j in range(n):
                d1[ri+i][ci+j]=piece[i][j]

    delta_sigma=msub(Sigma,Id)
    delta_tau=msub(Tau,Id)
    d0=zeros(4*n,n)
    for i in range(n):
        d0[i]=delta_sigma[i]
        d0[n+i]=delta_tau[i]
    assert matmul(d1,d0)==zeros(2*n,n)

    d0rank,_=rank_mod_two(d0)
    d1rank,_=rank_mod_two(d1)
    pivots,cols,rest=smith_mod_2power(d1)
    assert d0rank==n-1
    assert d1rank==2*n-1
    assert pivots==2*n-1
    assert len(rest)==1
    nz=[v for v in rest[0] if v]
    assert nz and all(v%2==0 for v in nz) and any(v%4==2 for v in nz)

    # The source-owned top Tate trace T_n(t,w):
    #   sum wild + 3*sum tame = 2*sum x0.
    for col in range(4*n):
        actual=res(sum(d1[n+i][col]+3*d1[i][col] for i in range(n)))
        expected=2 if 2*n<=col<3*n else 0
        assert actual==expected

    return sp,tp,d0,d1,cols

p9,t9,d0_9,d1_9,piv9=fox(9)
p27,t27,d0_27,d1_27,piv27=fox(27)

# The actual chain Γ ⊃ H3 ⊃ H9 ⊃ H27 is given by
# H27\Γ cosets (i,j), with H9-coset label k=2^j*i mod 9.
fiber=[((2**(q//9))*(q%9))%9 for q in range(27)]
def coset_projector(r):
    if r==27:
        return [[Fr(int(i==j)) for j in range(27)] for i in range(27)]
    den=27//r
    return [[Fr(1,den) if fiber[i]%r==fiber[j]%r else Fr(0)
             for j in range(27)] for i in range(27)]
Q=[coset_projector(r) for r in [1,3,9,27]]
def rmult(A,B):
    h,w,k=len(A),len(B[0]),len(B)
    out=[[Fr(0)]*w for _ in range(h)]
    for i in range(h):
        for v in range(k):
            if A[i][v]:
                for j in range(w):
                    out[i][j]+=A[i][v]*B[v][j]
    return out
def rsub(A,B):
    return [[a-b for a,b in zip(x,y)] for x,y in zip(A,B)]
def radd(A,B):
    return [[a+b for a,b in zip(x,y)] for x,y in zip(A,B)]
def rzero():
    return [[Fr(0)]*27 for _ in range(27)]
layers=[Q[0],rsub(Q[1],Q[0]),rsub(Q[2],Q[1]),rsub(Q[3],Q[2])]
for i in range(4):
    for j in range(4):
        assert rmult(Q[i],Q[j])==Q[min(i,j)]
        assert rmult(layers[i],layers[j])==(
            layers[i] if i==j else rzero())
assert [sum(E[i][i] for i in range(27)) for E in layers]==[1,2,6,18]
assert [sum(E[i][i] for i in range(27)) for E in Q]==[1,3,9,27]
for E in Q:
    for p in [p27,t27]:
        for i in range(27):
            for j in range(27):
                assert E[p[i]][p[j]]==E[i][j]
    for row in E:
        for x in row:
            assert x.denominator%2==1

# Explicit strict chain compatibility for the four stages.
def compat(E,A):
    Er=[[res(x.numerator*odd_inverse(x.denominator)) for x in row]
        for row in E]
    n=27
    E0=Er
    E1=zeros(4*n,4*n)
    E2=zeros(2*n,2*n)
    for b in range(4):
        for i in range(n):
            for j in range(n):
                E1[b*n+i][b*n+j]=Er[i][j]
    for b in range(2):
        for i in range(n):
            for j in range(n):
                E2[b*n+i][b*n+j]=Er[i][j]
    assert matmul(E1,d0_27)==matmul(d0_27,E0)
    assert matmul(E2,d1_27)==matmul(d1_27,E1)
for E in Q:
    compat(E,None)

# Literal Roe--Turturean marked-word finite affine regression
# on a sample of 27-sheet generator directions modulo 256.
def va(a,b):
    return [res(x+y) for x,y in zip(a,b)]
def perm_apply(p,v):
    out=[0]*len(v)
    for i in range(len(v)):
        out[p[i]]=v[i]
    return out
def aff(p=None,v=None):
    return (ident_perm(27) if p is None else p,
            [0]*27 if v is None else v)
def amul(a,b):
    return (perm_comp(a[0],b[0]),va(a[1],perm_apply(a[0],b[1])))
def ainv(a):
    p=perm_inv(a[0])
    return (p,[res(-x) for x in perm_apply(p,a[1])])
def apow(a,n):
    out=aff()
    while n:
        if n&1:
            out=amul(out,a)
        a=amul(a,a)
        n//=2
    return out
def aconj(x,g):
    return amul(amul(ainv(g),x),g)
def acomm(x,y):
    return amul(amul(amul(ainv(x),ainv(y)),x),y)
def rela(groups):
    sg,ta,x0,x1=groups
    # 513 ≡ 1 (mod 512), 0 (mod 9):
    # the correct 2-primary idempotent on this finite affine quotient.
    sig2=apow(sg,513)
    u0=apow(amul(x0,ta),513)
    u1=apow(amul(x1,ta),513)
    d0=amul(u0,ainv(x0))
    z0=aconj(x0,sig2)
    c0=acomm(d0,z0)
    g0=apow(sig2,2)
    dg=aconj(d0,g0)
    hc=acomm(dg,d0)
    h0=aconj(x0,g0)
    for h in [x0,dg,d0,apow(d0,2),hc]:
        h0=amul(h0,h)
    wild=amul(amul(amul(h0,ainv(u1)),aconj(x1,sg)),c0)
    tame=amul(amul(amul(ainv(sg),ta),sg),ainv(apow(ta,2)))
    return tame,wild

base=[aff(p27),aff(t27),aff(),aff()]
assert all(p==ident_perm(27) and all(v==0 for v in w)
           for p,v in rela(base))
sample=[0,1,8,9,13,18,26,27,28,36,45,53,54,
        63,71,80,81,82,90,99,107]
for col in sample:
    groups=[]
    for block in range(4):
        vec=[int(block*27+i==col) for i in range(27)]
        groups.append(aff(base[block][0],vec))
    tame,wild=rela(groups)
    assert tame[0]==wild[0]==ident_perm(27)
    actual=tame[1]+wild[1]
    assert actual==[d1_27[i][col] for i in range(54)]

print("PASS fixed135: 9/27 sheet exact Fox matrices, Smith"
      " (1^(2n-1),2), nested integral projectors 1+2+6+18,"
      " top Fox trace and literal marked-word finite affine checks")
