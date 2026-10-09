# SageMath 10.9 finite-group regression for fixed132 implicit wild elimination.
# It is NOT a replacement for the formal implicit-function proof.
# Run locally:
#   sage checks/fixed132_s3_wild_elimination_finite_levels.sage
#
# For moduli 4, 8 and 16 use exactly the Roe--Turturean auxiliary
# words in the marked relation.  Wild lifts are I+2E with E mod 2.
# The centralizer test checks that no solution with tame-central
# x0 can have a non-tame-central x1.
from sage.all import *

for n in [2,3,4]:
    R = Integers(2**n)
    I = identity_matrix(R,2)
    S = matrix(R, [[0,1],[1,0]])
    U = matrix(R, [[-1,-1],[1,0]])
    assert S.inverse()*U*S == U**2
    assert U**3 == I

    def conj(x,g):
        return g.inverse()*x*g
    def comm(x,y):
        return x.inverse()*y.inverse()*x*y

    def full_wild(x0,x1):
        # For these finite matrix lifts, omega_2 power equals
        # exponent 9: divisible by 3 and congruent to 1 mod 8.
        sigma2=S
        u0=(x0*U)**9
        u1=(x1*U)**9
        d0=u0*x0.inverse()
        z0=conj(x0,sigma2)
        c0=comm(d0,z0)
        g0=sigma2**2
        dg=conj(d0,g0)
        hc=comm(dg,d0)
        h0=conj(x0,g0)*x0*dg*d0*d0**2*hc
        return h0*u1.inverse()*conj(x1,S)*c0

    def lift(mask):
        E=matrix(R,2,2,[
             (mask >> j) & 1 for j in range(4)])
        return I+2*E

    solutions=0
    central_x0_solutions=0
    forbidden_x1=0
    for a in range(16):
        x0=lift(a)
        central0=(x0*U == U*x0)
        for b in range(16):
            x1=lift(b)
            if full_wild(x0,x1)==I:
                solutions+=1
                if central0:
                    central_x0_solutions+=1
                    if x1*U != U*x1:
                        forbidden_x1+=1
    assert solutions>0
    assert central_x0_solutions>0
    assert forbidden_x1 == 0
    print("mod 2^%s: %s literal marked solutions,"
          " %s central-x0 solutions, zero forbidden centralizer"
          % (n,solutions,central_x0_solutions))

print("PASS fixed132 finite-level wild elimination regression")
