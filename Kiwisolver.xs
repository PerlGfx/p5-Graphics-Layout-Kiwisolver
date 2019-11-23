#include <xs.h>
using namespace xs;

#include <kiwi/kiwi.h>

#include "Refcnt.xsi"

MODULE = Renard::API::Kiwisolver                PACKAGE = Renard::API::Kiwisolver
PROTOTYPES: DISABLE

BOOT {
	Stash(__PACKAGE__, GV_ADD).mark_as_loaded("Renard::API::Kiwisolver");
}

INCLUDE: Variable.xsi

INCLUDE: Term.xsi

INCLUDE: Expression.xsi

INCLUDE: Strength.xsi

INCLUDE: Constraint.xsi

INCLUDE: Solver.xsi

INCLUDE: Symbolics.xsi
