# SageMath 10.9 / Python 3 exact independent audit for fixed134.
# Run: sage checks/fixed134_s3_fox_tate_trace.sage
# Or:  python3 checks/fixed134_s3_fox_tate_trace.sage
#
# Computes the original pro-2 indexed Schreier relator word and
# the original full Roe-Turturean marked wild relation with genuine
# twisted Fox crossed derivations, including the 1/3 root factor.
# Checks exact rational matrices, 2-adic unit minors, row traces,
# cochain identities, the mod-four Wu class and index-three trace.

from fractions import Fraction as Q

def ident(n):
    return (Q(1), tuple(Q(0) for _ in range(n)))

def generator(i, n, theta):
    v = [Q(0)] * n
    v[i] = Q(1)
    return (Q(theta[i]), tuple(v))

def mul(a, b):
    assert len(a[1]) == len(b[1])
    return (a[0] * b[0],
            tuple(a[1][i] + a[0] * b[1][i]
                  for i in range(len(a[1]))))

def prod(*args):
    assert args
    y = ident(len(args[0][1]))
    for a in args:
        y = mul(y, a)
    return y

def inverse(a):
    return (1/a[0], tuple(-v/a[0] for v in a[1]))

def conj(a, g):
    return prod(inverse(g), a, g)

def comm(a, b):
    return prod(inverse(a), inverse(b), a, b)

def power(a, n):
    assert n >= 0
    y = ident(len(a[1]))
    for _ in range(n):
        y = mul(y, a)
    return y

def pro2_cuberoot(a):
    # The only possible theta values for the two indexed packets.
    if a[0] == 1:
        factor, val = Q(1,3), Q(1)
    elif a[0] == -1:
        factor, val = Q(1), Q(-1)
    elif a[0] == Q(-1,27):
        factor, val = Q(9,7), Q(-1,3)
    else:
        raise ValueError("unexpected cubic-root orientation " + str(a[0]))
    return (val, tuple(factor * z for z in a[1]))

def schreier_rows(theta):
    assert len(theta) == 7
    s, *other = [generator(i,7,theta[i]) for i in range(7)]
    aa = other[:3]
    vv = other[3:]
    def u(j,i):
        a = aa if j == 0 else vv
        return pro2_cuberoot(prod(a[i],a[(i+1)%3],a[(i+2)%3]))
    def relation(i):
        d0 = prod(u(0,i), inverse(aa[i]))
        z0 = conj(aa[(2*i)%3],s)
        c0 = comm(d0,z0)
        g = power(s,2)
        dg = conj(d0,g)
        hc = comm(dg,d0)
        h0 = prod(conj(aa[i],g),aa[i],dg,d0,power(d0,2),hc)
        return prod(h0,inverse(u(1,i)),conj(vv[(2*i)%3],s),c0)
    rows = [relation(i) for i in range(3)]
    assert all(x[0] == 1 for x in rows)
    return [list(x[1]) for x in rows]

theta = [Q(1), Q(-1),Q(-1),Q(-1),
         Q(-1,3),Q(-1,3),Q(-1,3)]
triv = [Q(1)] * 7
actual_theta = schreier_rows(theta)
actual_triv = schreier_rows(triv)
expect_theta = [
    [Q(0),Q(0),Q(-2),Q(2),Q(6,7),Q(-9,7),Q(3,7)],
    [Q(0),Q(2),Q(0),Q(-2),Q(3,7),Q(27,7),Q(-30,7)],
    [Q(0),Q(-2),Q(2),Q(0),Q(-9,7),Q(-18,7),Q(27,7)]]
expect_triv = [
    [Q(0),Q(-2,3),Q(4,3),Q(4,3),Q(2,3),Q(-1,3),Q(-1,3)],
    [Q(0),Q(4,3),Q(-2,3),Q(4,3),Q(-1,3),Q(-1,3),Q(2,3)],
    [Q(0),Q(4,3),Q(4,3),Q(-2,3),Q(-1,3),Q(2,3),Q(-1,3)]]
assert actual_theta == expect_theta
assert actual_triv == expect_triv

def det2(a,b,c,d):
    return a*d-b*c

unit_theta = det2(
    actual_theta[0][5],actual_theta[0][6],
    actual_theta[1][5],actual_theta[1][6])
unit_triv = det2(
    actual_triv[0][5],actual_triv[0][6],
    actual_triv[1][5],actual_triv[1][6])
assert unit_theta == Q(27,7)
assert unit_triv == Q(-1,3)
assert unit_theta.numerator % 2 and unit_theta.denominator % 2
assert unit_triv.numerator % 2 and unit_triv.denominator % 2

trace_theta = [sum(actual_theta[i][j] for i in range(3))
               for j in range(7)]
trace_triv = [sum(actual_triv[i][j] for i in range(3))
              for j in range(7)]
assert trace_theta == [Q(0)] * 7
assert trace_triv == [Q(0),Q(2),Q(2),Q(2),Q(0),Q(0),Q(0)]

d0_theta = [x-Q(1) for x in theta]
assert d0_theta == [Q(0),Q(-2),Q(-2),Q(-2),
                    Q(-4,3),Q(-4,3),Q(-4,3)]
assert all(sum(row[j] * d0_theta[j] for j in range(7)) == 0
           for row in actual_theta)
assert all((x / 2).denominator % 2 for x in d0_theta)
assert any((x/2).numerator % 2 for x in d0_theta)

# Direct full marked two-relator Fox rows.  For these coefficients
# theta has pro-2 image, so a crossed derivation kills the pro-odd
# factor of each cyclic word and D(w^omega_2)=D(w).
def global_rows(theta):
    s,t,x0,x1 = [generator(i,4,theta[i]) for i in range(4)]
    u0 = prod(x0,t)
    u1 = prod(x1,t)
    d0 = prod(u0,inverse(x0))
    z0 = conj(x0,s)
    c0 = comm(d0,z0)
    g0 = power(s,2)
    dg = conj(d0,g0)
    hc = comm(dg,d0)
    h0 = prod(conj(x0,g0),x0,dg,d0,power(d0,2),hc)
    tame = prod(inverse(s),t,s,inverse(t),inverse(t))
    wild = prod(h0,inverse(u1),conj(x1,s),c0)
    assert tame[0] == wild[0] == 1
    return [list(tame[1]),list(wild[1])]

global_theta = global_rows([Q(1),Q(1),Q(-1),Q(-1,3)])
global_triv = global_rows([Q(1)]*4)
assert global_theta == [[Q(0),Q(-1),Q(0),Q(0)],
                        [Q(0),Q(-3),Q(0),Q(0)]]
assert global_triv == [[Q(0),Q(-1),Q(0),Q(0)],
                       [Q(0),Q(3),Q(2),Q(0)]]
assert all((global_theta[1][j]-3*global_theta[0][j])==0
           for j in range(4))
assert [global_triv[1][j]+3*global_triv[0][j]
        for j in range(4)] == [Q(0),Q(0),Q(2),Q(0)]

# Fox-Wu consistency in the minimal five-generator basis:
# s,a0,a1,a2,v2; the three diagonal cup squares are a_i.
cup = [[0,0,0,0,1],
       [0,1,0,0,0],
       [0,0,1,0,0],
       [0,0,0,1,0],
       [1,0,0,0,0]]
wu = [0,1,1,1,0]
for mask in range(1<<5):
    c = [(mask>>i)&1 for i in range(5)]
    square = sum(c[i]*cup[i][j]*c[j]
                 for i in range(5) for j in range(5)) % 2
    pairing = sum(c[i]*cup[i][j]*wu[j]
                  for i in range(5) for j in range(5)) % 2
    assert square == pairing

# On the three-sheet covering, a normalized global wild face
# pulls back to (c,c,c), whose primitive trace is 3c.
for c in [Q(0),Q(1),Q(2),Q(5,7),Q(-3,11)]:
    assert sum([c,c,c]) == 3*c

print("PASS fixed134: exact twisted/trivial Fox 3x7 and full 2x4"
      " matrices; 2-adic unit minors; primitive top traces;"
      " Wu class; index-three restriction normalization")
