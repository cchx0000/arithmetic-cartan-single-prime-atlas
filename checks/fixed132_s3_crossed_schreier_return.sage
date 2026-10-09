# SageMath 10.9, fixed132 exact finite-ring regression.
# Run locally:
#   sage checks/fixed132_s3_crossed_schreier_return.sage
# Checks the crossed quadratic-etale norm/inverse, all four adjoint
# blocks, dyadic factor-two return parity, and 3-coset Schreier
# quadratic exchange (including complete-graph Laplacian).
# Independent modular checks were completed while authoring the paper.
from sage.all import *

R = Integers(2**8)
I = identity_matrix(R, 2)
Z = zero_matrix(R, 2)
X = matrix(R, [[-1,-1],[1,0]])
Y = matrix(R, [[0,1],[1,0]])
q = R(1)
assert X**2+X+I == Z
assert X**3 == I
assert Y*X == X**2*Y
assert Y**2 == I

def cp(a,b): return (a[0]+b[0],a[1]+b[1])
def cn(a): return (-a[0],-a[1])
def cs(a,b): return cp(a,cn(b))
def cm(a,b):
    return (a[0]*b[0]-a[1]*b[1],
            a[0]*b[1]+a[1]*b[0]-a[1]*b[1])
def ci(a): return (a[0]-a[1],-a[1])
def sc(a,v): return (v*a[0],v*a[1])
def norm(a): return cm(a,ci(a))[0]
def emb(a): return a[0]*I+a[1]*X
def wmat(a,b): return emb(a)+emb(b)*Y
def ediv(a,v): return sc(a,v**(-1))
def pair0(): return (R(0),R(0))
def pair1(): return (R(1),R(0))
def xpow(i):
    p = i%3
    return [pair1(),(R(0),R(1)),(R(-1),R(-1))][p]

def proj(A):
    out=Z
    for j in range(3):
        T=X**j
        out += T*A*T.inverse()
    return R(3)**(-1)*out
def compl(A): return A-proj(A)

def dlt(a,b): return norm(a)-q*norm(b)
def ag(a,b,z):
    return ediv(cs(sc(z,norm(a)),sc(ci(z),q*norm(b))),dlt(a,b))
def cg(a,b,z):
    return ediv(cm(cm(a,b),cs(ci(z),z)),dlt(a,b))
def bg(a,b,d):
    t1=cm(cm(b,ci(a)),ci(d))
    t2=cm(cm(a,ci(b)),d)
    return ediv(sc(cs(t1,t2),q),dlt(a,b))
def dg(a,b,d):
    t1=cm(cm(a,a),d)
    t2=cm(cm(b,b),ci(d))
    return ediv(cs(t1,sc(t2,q)),dlt(a,b))

for k in range(32):
    a=(R(1+2*(7*k)),R(2*(11*k)))
    b=(R(2*(13*k+3)),R(2*(17*k+1)))
    c=(R(1+2*(19*k+1)),R(2*(23*k+1)))
    e=(R(2*(29*k+5)),R(2*(31*k+7)))
    zz=(R(37*k+3),R(41*k+9))
    dd=(R(43*k+5),R(47*k+11))
    W=wmat(a,b)
    W2=wmat(c,e)
    delta=dlt(a,b)
    assert delta.is_unit()
    assert W.det()==delta
    assert W.inverse() == delta**(-1)*wmat(ci(a),cn(b))
    assert W*X-X*W == emb(cm(b,cs(xpow(2),xpow(1))))*Y

    Adj=lambda MM,Q: MM*Q*MM.inverse()
    assert proj(Adj(W,emb(zz))) == emb(ag(a,b,zz))
    assert compl(Adj(W,emb(zz))) == emb(cg(a,b,zz))*Y
    assert proj(Adj(W,emb(dd)*Y)) == emb(bg(a,b,dd))
    assert compl(Adj(W,emb(dd)*Y)) == emb(dg(a,b,dd))*Y

    # The exact second-diagonal return carries an extra 2.
    H=Adj(W*W2,emb(dd)*Y)
    H2=Adj(W,compl(Adj(W2,emb(dd)*Y)))
    return11=compl(H)-compl(H2)
    numerator=cm(cm(a,b), cs(
        cm(cm(c,ci(e)),dd),
        cm(cm(e,ci(c)),ci(dd))
    ))
    predicted=emb(ediv(sc(numerator,2*q),delta*dlt(c,e)))*Y
    assert return11 == predicted

    # Three true Schreier conjugates and exact row/column sums.
    wild=[W]
    for j in [1,2]:
        wild.append(X**j*W*X**(-j))
    for j in range(3):
        bj=cm(b,xpow(2*j))
        assert wild[j] == wmat(a,bj)
    assert sum([emb(cm(b,xpow(2*j))) for j in range(3)],Z)==Z

    K=[[Z for j in range(3)] for i in range(3)]
    for i in range(3):
        for j in range(3):
            wgh=wild[i]*wild[j]
            K[i][j]=proj(Adj(wgh,emb(zz)))-proj(
                Adj(wild[i],proj(Adj(wild[j],emb(zz)))))
    for i in range(3):
        assert sum(K[i],Z)==Z
        assert sum([K[j][i] for j in range(3)],Z)==Z

    # Normalize a=1 and check complete-graph Laplacian.
    wild_lap=[wmat(pair1(),cm(b,xpow(2*i))) for i in range(3)]
    den=(R(1)-q*norm(b))**2
    coeff=q*norm(b)*den**(-1)
    for i in range(3):
        for j in range(3):
            gh=wild_lap[i]*wild_lap[j]
            zc=emb(zz)
            actual=proj(Adj(gh,zc))-proj(
                Adj(wild_lap[i],proj(Adj(wild_lap[j],zc))))
            expect=emb(sc(cs(zz,ci(zz)),
                          coeff*R(3*(i==j)-1)))
            assert actual==expect

print("PASS fixed132: crossed-etale matrix identities, exact"
      " factor-two return, Schreier zero-sums and K3 Laplacian")
