--		Copyright 1993-1999 by Daniel R. Grayson

Ring == ZZ := (R,i) -> (
     if i === 0 then 1_R == 0
     else error "comparison of ring with nonzero integer encountered"
     )

use Ring := x -> ( if x.?use then x.use x; x)

ZZ == Ring := (i,R) -> R == i

poincare Ring := R -> poincare module R

dim Ring := R -> (
     if R.?dim then R.dim
     else if isField R then 0
     else error("dimension of ring ", toString R, " unknown"))

char Ring := R -> (
     if R.?char then R.char 
     else error("characteristic of ", toString R, " unknown"))

errorGenCoeff = () -> error "unable to provide generators for ring over specified coefficient ring"
generators Ring := opts -> R -> (
     if opts.CoefficientRing === null or opts.CoefficientRing === R then {}
     else if opts.CoefficientRing === ZZ and R === QQ then {} -- where should we really stash this special case? (QQ is not in the class FractionField)
     else errorGenCoeff())

numgens Ring := R -> #generators R

ring = method(TypicalValue => Ring)

-- ring Thing := x -> (
--      if x.?ring then x.ring 
--      else if instance(class x,Ring) then class x
--      else error "no ring")
-- ring Type := T -> if T.?ring then T.ring else error "no ring"

ambient Ring := Ring => R -> error "no ambient ring present"
coefficientRing Ring := Ring => R -> error "no coefficient ring present"

isCommutative = method(TypicalValue => Boolean)
isCommutative Ring := R -> R.isCommutative

isSkewCommutative = method(TypicalValue => Boolean)
isSkewCommutative Ring := R -> false

ZZ.isCommutative = true
QQ.isCommutative = true
RR.isCommutative = true

isRing = method(TypicalValue => Boolean)
isRing Thing := R -> false
isRing Ring := R -> true

isHomogeneous Ring := R -> (
     R.?isHomogeneous and R.isHomogeneous
     or
     degreeLength R == 0 
     )

promote = method(Dispatch=>{Thing,Type,Type})
lift = method(Dispatch=>{Thing,Type,Type}, Options => {Verify => true})
liftable  = method(Dispatch=>{Thing,Type,Type}, TypicalValue => Boolean)

-- Local Variables:
-- compile-command: "make -C $M2BUILDDIR/Macaulay2/m2 "
-- End:
