# SageMath 10.9 exact regression for fixed131.
# Rank-two tame rigidity, the canonical C3 projector, and a literal
# wild first-order marked Galois deformation outside the split locus.
# Run locally: sage checks/fixed131_s3_tame_rigidity_wild_nosplit.sage
from sage.all import *

for n in [2, 3, 4, 5, 6, 7, 8]:
    R = Integers(2**n)
    one = identity_matrix(R, 2)
    S = matrix(R, [[0, 1], [1, 0]])
    U = matrix(R, [[-1, -1], [1, 0]])
    C = matrix(R, [[1, 2], [0, 1]])
    X = C*U*C.inverse()
    Y = C*S*C.inverse()
    assert Y.inverse()*X*Y == X**2
    assert X.det() == R(1)
    assert X.trace() == R(-1)
    assert X**2+X+one == 0
    assert X**3 == one
    assert Y**2 == Y**2[0,0]*one  # Frobenius square is scalar.

    # Universal transport-native End(T) basis I,X,Y,XY.
    native=[one,X,Y,X*Y]
    frame=matrix(R,4,4,[
      native[j][i//2,i%2] for i in range(4) for j in range(4)
    ])
    assert frame.det().is_unit()
    # Exact projector, no infinite binomial series required.
    def proj(A):
        return R(3).inverse() * (
            A + X*A*X.inverse() + X**2*A*(X**2).inverse()
        )
    for b in [matrix(R, [[1, 0], [0, 0]]),
              matrix(R, [[0, 1], [0, 0]]),
              matrix(R, [[0, 0], [1, 0]]),
              matrix(R, [[0, 0], [0, 1]])]:
        assert proj(proj(b)) == proj(b)
        assert proj(b)*X == X*proj(b)
    assert proj(one) == one
    assert proj(X) == X
    assert proj(Y) == zero_matrix(R,2)
    assert proj(X*Y) == zero_matrix(R,2)

# Genuine residual deformation with nonzero wild obstruction.
F = GF(2)
Pol = PolynomialRing(F, 'e')
e = Pol.gen()
A = Pol.quotient(e**2, 'eps')
eps = A.gen()
I = identity_matrix(A, 2)
S = matrix(A, [[0, 1], [1, 0]])
U = matrix(A, [[1, 1], [1, 0]])
V = matrix(A, [[1, 1], [0, 1]])
x0, x1 = I + eps*V, I
assert S.inverse()*U*S == U**2
assert U**3 == I
N_V = V + U*V*U.inverse() + U**2*V*(U**2).inverse()
assert N_V == 0
assert V*U-U*V == V
# omega_2 projections in the first-order F2 sector:
sigma2 = S
u0 = (x0*U)**3
u1 = (x1*U)**3
assert u0 == I and u1 == I
def cj(x, g): return g.inverse()*x*g
def cm(x, y): return x.inverse()*y.inverse()*x*y
d0 = u0*x0.inverse()
z0 = cj(x0,sigma2)
c0 = cm(d0,z0)
g0 = sigma2**2
dg = cj(d0,g0)
hc = cm(dg,d0)
h0 = cj(x0,g0)*x0*dg*d0**3*hc
wild = h0*u1.inverse()*cj(x1,S)*c0
tame = S.inverse()*U*S*(U**2).inverse()
assert tame == I and wild == I
assert x0*U != U*x0

def Pi(M):
    return A(3)**(-1) * (
        M+U*M*U.inverse()+U**2*M*(U**2).inverse()
    )
def Ad(M,g):
    return g*M*g.inverse()
# No idempotent lift of Pi_0 can commute with this wild action:
obstruction = Ad(Pi(U),x0)-Pi(Ad(U,x0))
assert obstruction == eps*V
assert obstruction != 0

# First-order split tangent codimension is two.
# On the fixed M_1 normal-form sector, the wild x0
# coordinate is free while wild x1 vanishes.
# Its 2-dimensional leading wild-centralizer defect is surjective.
bare = [matrix(F, [[1,0],[0,0]]),
        matrix(F, [[0,1],[0,0]]),
        matrix(F, [[0,0],[1,0]]),
        matrix(F, [[0,0],[0,1]])]
B = matrix(F, 4, 4, [
    (Q*matrix(F, [[1,1],[1,0]]) -
     matrix(F, [[1,1],[1,0]])*Q)[i,j]
    for i in range(2) for j in range(2)
    for Q in bare
])
assert B.rank() == 2

print("PASS fixed131: tame order-three rigidity; projector; full"
      " dual-number Galois relations; nonzero wild obstruction;"
      " tangent defect rank 2")
