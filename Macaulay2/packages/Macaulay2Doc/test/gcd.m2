R = ZZ/32003[x,y]
f = (x+y)^3*(x-y^2)
g = (x+y)^2*(x^3-x*y+y^3)^4
assert ( gcd(f,g) == (x+y)^2 )

GF 729[x, y, z]
assert( gcd((x^5+y^3+a+1)*(y-1),(x^5+y^3+a+1)*(z+1)) == x^5+y^3+a+1 )

GF 25[x, y, z]
assert( gcd(z-a,z^2-a^2) == z-a )
assert( gcd((x^5+y^3+a+1)*(y-1),(x^5+y^3+a+1)*(z+1)) == x^5+y^3+a+1 )
assert( 1 == gcd(x^5+x-3,x^6-a*x-1) )
assert( gcd((x^3+x-a)*(x^5+x-3),(x^3+x-a)*(x^6-a*x-1)) == x^3+x-a )

R = GF 25[x]
-- one of the book chapters depends on this feature
assert(gcd((x^3+x-a)*(x^5+x-1),(x^3+x-a)*(x^6-a*x-1)) == x^3+x-a)

R = GF 25[x,y]
-- one of the book chapters depends on this feature
assert(gcd((x^3+x-a)*(x^5+x-1),(x^3+x-a)*(x^6-a*x-1)) == x^3+x-a)

R = (GF 25)[x,y]
assert(gcd((x^3+y-a)*(y^5+x-1),(x^3+y-a)*(x^6-a*x-1)) == x^3+y-a)

R = ZZ[x]
assert( gcd(6*x, 4*x) == 2*x )

R = QQ[x]
assert( gcd(6*x, 4*x) == x )

R = ZZ[x,y]
d = 5*x^2*y+7*x^3-y^4
f = (3*x^3-x*y+y^2) * d
g = (3*x^3+x*y+y^2) * d
h = gcd(f,g)
assert(h == -d)

R = QQ[x,y]
d = 5*x^2*y+7*x^3-1/11*y^4
f = (3*x^3-x*y+y^2) * d
g = (3*x^3+x*y+y^2) * d
h = gcd(f,g)
assert(h == -11* d)

R = ZZ/101[x]
d = x^3+x-2;
f = d*(x^5+x-1);
g = d*(x^6-x-1);
assert(gcd(f,g) == d)
w = gcdCoefficients(f,g)
assert( w#0 == 24*d)					    -- actually, we'd like w#0 == d.  I wonder why factory doesn't ensure that?
assert( w#0 == f * w#1 + g * w#2 )

R = (GF 25)[x]
d = x^3+x-a;
f = d*(x^5+x-1);
g = d*(x^6-a*x-1);
assert(gcd(f,g) == d)
w = gcdCoefficients(f,g)
assert( w#0 == -d)					    -- actually, we'd like w#0 == d.  I wonder why factory doesn't ensure that?
assert( w#0 == f * w#1 + g * w#2 )

debug Core
R = QQ[x,y]
f = 1+x^2
g = 1+x^3
rawGCD( raw ( f ), raw ( g ))
rawGCD( raw ( 1/2*f ), raw ( 1/3*g ))
rawExtendedGCD( raw ( f ), raw ( g ))
rawExtendedGCD( raw ( 1/2*f ), raw ( 1/3*g ))

end
-- Local Variables:
-- compile-command: "make -C $M2BUILDDIR/Macaulay2/test gcd.out"
-- End:
