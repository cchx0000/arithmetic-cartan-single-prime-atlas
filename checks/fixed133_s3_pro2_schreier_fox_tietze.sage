# SageMath 10.9, fixed133 independent exact audit.
# Run locally with:
#   sage checks/fixed133_s3_pro2_schreier_fox_tietze.sage
#
# Covers:
#  (1) three-sheet Fox/Shapiro augmentation (6 x 10);
#  (2) five odd unit pivots plus a 2-primary Smith factor;
#  (3) the actual 3 indexed pro-2 Schreier wild relations;
#  (4) the primitive -1/3 Nielsen determinant;
#  (5) degree-two Magnus symbol of their surviving product;
#  (6) direct finite affine group-word checks of the coset rewriting.
# This is a reproducible script; a GitHub upload is not an executed CI run.

from sage.all import *

S = matrix(ZZ, [[1,0,0],[0,0,1],[0,1,0]])
U = matrix(ZZ, [[0,1,0],[0,0,1],[1,0,0]])
I = identity_matrix(ZZ,3)
N = I+U+U**2
assert S**2 == I and U**3 == I and S*U*S == U**2
A = S*(U-I)
B = S-I-U
# The three wild rows may be multiplied by 3 (a 2-adic unit).
J = zero_matrix(ZZ,6,12)
J.set_block(0,0,A)
J.set_block(0,3,B)
J.set_block(3,3,3*N)
J.set_block(3,6,4*N-6*I)
J.set_block(3,9,3*S-N)
tree_cols = [0,1,2,5,6,7,8,9,10,11]  # remove tau edges 0 and 1
D = J.matrix_from_columns(tree_cols)
required = matrix(ZZ,[
  [-1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
  [ 1, 0,-1, 0, 0, 0, 0, 0, 0, 0],
  [ 0,-1, 1,-1, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 3,-2, 4, 4, 2,-1,-1],
  [ 0, 0, 0, 3, 4,-2, 4,-1,-1, 2],
  [ 0, 0, 0, 3, 4, 4,-2,-1, 2,-1]])
assert D == required
assert matrix(GF(2), D).rank() == 5
minor5 = D.matrix_from_rows_and_columns(list(range(5)),[0,1,3,7,8])
minor6 = D.matrix_from_rows_and_columns(list(range(6)),[0,1,3,4,7,8])
assert minor5.det() == -3
assert minor6.det() == -18
assert sorted(abs(x) for x in D.elementary_divisors()) == [1,1,1,1,1,2]

# Integrality of the genuine three-sheet coinduced unscaled differential.
Q = matrix(QQ,3,3,N)/3
d0 = block_matrix([[S-I],[U-I],
                   [zero_matrix(QQ,3,3)],
                   [zero_matrix(QQ,3,3)]])
d1 = block_matrix([
  [A,B,zero_matrix(QQ,3,3),zero_matrix(QQ,3,3)],
  [zero_matrix(QQ,3,3),3*Q,4*Q-2*I,S-Q]])
assert d1*d0 == zero_matrix(QQ,6,3)
J_covered = d1.matrix_from_columns(tree_cols)
for r in range(6):
    for c in range(10):
        assert D[r,c] == (3 if r>=3 else 1)*J_covered[r,c]

# The exact augmented wild Fox rows, in generator order
# (s,a0,a1,a2,v0,v1,v2).
Fw = matrix(QQ,3,7,lambda i,j:
    QQ(0) if j==0 else
    (QQ(4)/3-2*(i==j-1)) if 1<=j<=3 else
    ((2*i)%3==j-4)-QQ(1)/3)
assert Fw.matrix_from_rows_and_columns([1,2],[4,5]).det() == -QQ(1)/3
assert Fw.column(0) == vector(QQ,[0,0,0])
assert Fw[0]+Fw[1]+Fw[2] == vector(QQ,[0,2,2,2,0,0,0])
assert matrix(GF(2),Fw).rank() == 2

# Truncated characteristic-two Magnus noncommutative algebra,
# generators (s,a0,a1,a2,v0,v1,v2).
d = 7
def identity_mag():
    return ([0]*d, [[0]*d for _ in range(d)])
def gen(j):
    L,Q=identity_mag()
    L[j]=1
    return (L,Q)
def magmul(a,b):
    C,D=identity_mag()
    for i in range(d):
        C[i]=a[0][i]^b[0][i]
        for j in range(d):
            D[i][j]=a[1][i][j]^b[1][i][j]^(a[0][i]&b[0][j])
    return (C,D)
def mprod(*a):
    out=identity_mag()
    for v in a: out=magmul(out,v)
    return out
def minv(a):
    C,D=identity_mag()
    C=list(a[0])
    for i in range(d):
        for j in range(d):
            D[i][j]=a[1][i][j]^(a[0][i]&a[0][j])
    return (C,D)
def conj(a,b): return mprod(minv(b),a,b)
def comm(a,b): return mprod(minv(a),minv(b),a,b)
def cuberoot(a):
    # 1/3 = 3 mod 4.  In degree <=2 over F_2,
    # binomial coefficients for degrees one and two are both odd.
    return minv(a)
s=gen(0)
a=[gen(1),gen(2),gen(3)]
v=[gen(4),gen(5),gen(6)]
def u(j,i):
    arr=a if j==0 else v
    return cuberoot(mprod(arr[i],arr[(i+1)%3],arr[(i+2)%3]))
def rel(i):
    d0=mprod(u(0,i),minv(a[i]))
    z0=conj(a[(2*i)%3],s)
    c0=comm(d0,z0)
    g=magmul(s,s)
    dg=conj(d0,g)
    hc=comm(dg,d0)
    h0=mprod(conj(a[i],g),a[i],dg,d0,magmul(d0,d0),hc)
    return mprod(h0,minv(u(1,i)),conj(v[(2*i)%3],s),c0)
rels=[rel(i) for i in range(3)]
assert [x[0] for x in rels] == [
  [0,0,0,0,0,1,1],
  [0,0,0,0,1,1,0],
  [0,0,0,0,1,0,1]]
total=mprod(*rels)
assert total[0] == [0]*7

# The primitive wild relators force v0=v1=v2 in degree one.
# Because the product relator has exactly zero first Fox derivative in
# ALL v-directions, their higher-order elimination cannot change Q.
fold=[0,1,2,3,4,4,4]
Q5=matrix(GF(2),5,5,0)
for i in range(d):
    for j in range(d):
        Q5[fold[i],fold[j]]+=GF(2)(total[1][i][j])
expected=matrix(GF(2),[
  [0,0,0,0,1],
  [0,1,0,0,0],
  [0,0,1,0,0],
  [0,0,0,1,0],
  [1,0,0,0,0]])
assert Q5 == expected
assert Q5.det() == 1
assert Q5.rank() == 5
assert Q5 == Q5.transpose()

# Independent exact finite affine wreath-quotient word test.
# Index group action: permutations on a Z/8-module of rank 6;
# wild images arbitrary pro-2 translations.  The full Roe wild
# word and all three lifted indexed words must agree literally.
p=8
Nvec=6
e=tuple(range(Nvec))
sperm=(0,2,1,3,5,4)
tperm=(1,2,0,4,5,3)
def aadd(x,y): return tuple((x[i]+y[i])%p for i in range(Nvec))
def aneg(x): return tuple((-v)%p for v in x)
def act(q,x): return tuple(x[q[i]] for i in range(Nvec))
def pcompose(x,y): return tuple(y[x[i]] for i in range(Nvec))
def pinv(x): return tuple(x.index(i) for i in range(Nvec))
class Aff:
    def __init__(self,perm=e,vec=None):
        self.perm=tuple(perm)
        self.vec=tuple([0]*Nvec if vec is None else vec)
    def __mul__(self,other):
        return Aff(pcompose(self.perm,other.perm),
                   aadd(self.vec,act(self.perm,other.vec)))
    def __pow__(self,k):
        assert k>=0
        out=Aff()
        for _ in range(k): out=out*self
        return out
    def inv(self):
        q=pinv(self.perm)
        return Aff(q,aneg(act(q,self.vec)))
    def __eq__(self,x):
        return self.perm==x.perm and self.vec==x.vec
def acj(x,g): return g.inv()*x*g
def acm(x,y): return x.inv()*y.inv()*x*y
sig=Aff(sperm)
tau=Aff(tperm)
def full_rel(x0,x1):
    sig2=sig
    u0=(x0*tau)**9
    u1=(x1*tau)**9
    d0=u0*x0.inv()
    z0=acj(x0,sig2)
    c0=acm(d0,z0)
    g0=sig2**2
    dg=acj(d0,g0)
    hc=acm(dg,d0)
    h0=acj(x0,g0)*x0*dg*d0*(d0**2)*hc
    return h0*u1.inv()*acj(x1,sig)*c0
def lifted_rel(i,x0,x1):
    w0=[acj(x0,tau**j) for j in range(3)]
    w1=[acj(x1,tau**j) for j in range(3)]
    def up(j):
        ww=w0 if j==0 else w1
        return (ww[i]*ww[(i+1)%3]*ww[(i+2)%3])**3
    d0=up(0)*w0[i].inv()
    z0=acj(w0[(2*i)%3],sig)
    c0=acm(d0,z0)
    g0=sig**2
    dg=acj(d0,g0)
    hc=acm(dg,d0)
    h0=acj(w0[i],g0)*w0[i]*dg*d0*(d0**2)*hc
    return h0*up(1).inv()*acj(w1[(2*i)%3],sig)*c0
for k in range(32):
    x0=Aff(vec=[(19*k+7*j+3)%p for j in range(Nvec)])
    x1=Aff(vec=[(23*k+5*j+11)%p for j in range(Nvec)])
    word=full_rel(x0,x1)
    for i in range(3):
        assert lifted_rel(i,x0,x1)==acj(word,tau**i)

print("PASS fixed133: actual marked Schreier words; 6x10 Fox"
      " Smith (1^5,2); -1/3 Nielsen pivot; rank-five Demushkin"
      " Magnus cup form; literal finite wreath group relation tests")
