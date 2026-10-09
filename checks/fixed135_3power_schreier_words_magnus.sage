# SageMath 10.9 (pure Python subset) regression for fixed135.
# Checks the distinct sigma_2 and sigma^{-1} nine-sheet actions,
# exact indexed Roe-Turturean wild word over nonabelian D8 wreath
# quotients, and the odd-degree rank-(n+2) Magnus symbol.
# Run: sage checks/fixed135_3power_schreier_words_magnus.sage
# This source is provided for local reproducibility, not asserted CI-run.
from sage.all import *
import random

E=(0,0)
def dm(a,b):
    return ((a[0]+(-1 if a[1] else 1)*b[0])%4,a[1]^b[1])
def di(a):
    return ((-a[0] if a[1]==0 else a[0])%4,a[1])
def dp(a,n):
    if n<0:return dp(di(a),-n)
    x=E
    for _ in range(n):x=dm(x,a)
    return x
def qprod(args):
    x=E
    for a in args:x=dm(x,a)
    return x
def qc(a,b):return qprod((di(a),di(b),a,b))

def wreath_check(n,num_tests):
    ident_perm=tuple(range(n))
    def g(p=ident_perm,v=None):
        return (tuple([E]*n if v is None else v),tuple(p))
    zero=g()
    def gm(a,b):
        return (tuple(dm(a[0][i],b[0][a[1][i]]) for i in range(n)),
                tuple(b[1][a[1][i]] for i in range(n)))
    def gi(a):
        pp=tuple(a[1].index(i) for i in range(n))
        return (tuple(di(a[0][pp[i]]) for i in range(n)),pp)
    def gp(a,k):
        out=zero
        for _ in range(k):out=gm(out,a)
        return out
    def gx(a,b):return gm(gm(gi(b),a),b)
    def gc(a,b):return gm(gm(gm(gi(a),gi(b)),a),b)
    def gprod(args):
        out=zero
        for a in args:out=gm(out,a)
        return out
    sigma=g(tuple((2*i)%n for i in range(n)))
    tau=g(tuple((i+1)%n for i in range(n)))
    assert gprod((gi(sigma),tau,sigma,gi(gp(tau,2))))==zero
    def order(a):
        v=zero
        for k in range(1,1000):
            v=gm(v,a)
            if v==zero:return k
        raise ValueError("excessive finite wreath order")
    def omega(a):
        N=order(a)
        odd=N
        while odd%2==0:odd//=2
        tw=N//odd
        e=next(k for k in range(N)
               if k%odd==0 and (tw==1 or k%tw==1))
        return gp(a,e)
    sigma2=omega(sigma)
    assert order(sigma)==2*(n//3)
    assert sigma2[1]==tuple((-i)%n for i in range(n))
    inverse2=pow(2,-1,n)
    if n==9:
        assert inverse2==5
        assert sigma2[1]!=gi(sigma)[1]

    def full_wild(x0,x1):
        sg2=omega(sigma)
        u0=omega(gm(x0,tau))
        u1=omega(gm(x1,tau))
        d0=gm(u0,gi(x0))
        z0=gx(x0,sg2)
        c0=gc(d0,z0)
        g0=gp(sg2,2)
        dg=gx(d0,g0)
        hc=gc(dg,d0)
        h0=gprod((gx(x0,g0),x0,dg,d0,gp(d0,2),hc))
        return gprod((h0,gi(u1),gx(x1,sigma),c0))
    def lift(x,i):
        ti=gp(tau,i)
        return gprod((ti,x,gi(ti)))
    def root(x):
        assert x[1][0]==0
        return x[0][0]
    def indexed(i,aa,vv):
        root_exponent=pow(n,-1,4) # 1/n for D8, exponent four
        u0=dp(qprod(aa[(i+k)%n] for k in range(n)),root_exponent)
        u1=dp(qprod(vv[(i+k)%n] for k in range(n)),root_exponent)
        d0=dm(u0,di(aa[i]))
        zi=aa[-i%n]                # sigma_2 action -i
        ci=qc(d0,zi)
        hi=qprod((aa[i],aa[i],d0,d0,dp(d0,2)))
        return qprod((hi,di(u1),vv[inverse2*i%n],ci))

    rng=random.Random(271828+n)
    for trial in range(num_tests):
        x0=g(v=[(rng.randrange(4),rng.randrange(2)) for _ in range(n)])
        x1=g(v=[(rng.randrange(4),rng.randrange(2)) for _ in range(n)])
        word=full_wild(x0,x1)
        aa=[root(lift(x0,i)) for i in range(n)]
        vv=[root(lift(x1,i)) for i in range(n)]
        for i in range(n):
            assert root(lift(word,i))==indexed(i,aa,vv)
    return n*num_tests

def magnus_check(n):
    d=1+2*n
    def ident():return ([0]*d,[[0]*d for _ in range(d)])
    def var(i):
        L,Q=ident();L[i]=1;return (L,Q)
    def mul(a,b):
        L,Q=ident()
        for i in range(d):
            L[i]=a[0][i]^b[0][i]
            for j in range(d):
                Q[i][j]=a[1][i][j]^b[1][i][j]^(a[0][i]&b[0][j])
        return (L,Q)
    def prod(*args):
        o=ident()
        for a in args:o=mul(o,a)
        return o
    def inverse(a):
        L,Q=ident()
        L=list(a[0])
        for i in range(d):
            for j in range(d):
                Q[i][j]=a[1][i][j]^(a[0][i]&a[0][j])
        return (L,Q)
    def power2(a):return mul(a,a)
    def conj(a,b):return prod(inverse(b),a,b)
    def comm(a,b):return prod(inverse(a),inverse(b),a,b)
    # Binomial (1/n choose 2) mod2 depends on n mod4.
    root2=int(((pow(n,-1,4)-1)//2)%2)
    def root(a):
        L,Q=ident();L=list(a[0])
        for i in range(d):
            for j in range(d):
                Q[i][j]=a[1][i][j]^(root2&(a[0][i]&a[0][j]))
        return (L,Q)
    s=var(0)
    a=[var(i+1) for i in range(n)]
    v=[var(n+1+i) for i in range(n)]
    invtwo=pow(2,-1,n)
    def rel(i):
        def u(j):
            ww=a if j==0 else v
            return root(prod(*(ww[(i+k)%n] for k in range(n))))
        d0=prod(u(0),inverse(a[i]))
        zi=conj(a[-i%n],s)
        c0=comm(d0,zi)
        g=power2(s)
        dg=conj(d0,g)
        hc=comm(dg,d0)
        h0=prod(conj(a[i],g),a[i],dg,d0,power2(d0),hc)
        return prod(h0,inverse(u(1)),conj(v[invtwo*i%n],s),c0)
    rr=[rel(i) for i in range(n)]
    total=prod(*rr)
    assert total[0]==[0]*d
    fold=[0]+list(range(1,n+1))+[n+1]*n
    Q=[[0]*(n+2) for _ in range(n+2)]
    for i in range(d):
        for j in range(d):
            Q[fold[i]][fold[j]]^=total[1][i][j]
    expected=[[0]*(n+2) for _ in range(n+2)]
    for i in range(1,n+1):expected[i][i]=1
    expected[0][n+1]=expected[n+1][0]=1
    assert Q==expected

cnt=0
for n,nt in [(3,12),(9,12),(27,4)]:
    cnt+=wreath_check(n,nt)
    magnus_check(n)
print("PASS fixed135:",cnt,"nonabelian finite D8-wreath indexed"
      " Schreier relations; rank-(n+2) quadratic Magnus Fox"
      " symbol for n=3,9,27; distinct sigma_2 vs inverse Frobenius")
