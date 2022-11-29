use strict;
use warnings;
package Graphics::Layout::Kiwisolver;
# ABSTRACT: API for Kiwisolver constraint solver

use XS::Framework;
use XS::Loader;
XS::Loader::load();

use Graphics::Layout::Kiwisolver::Variable;
use Graphics::Layout::Kiwisolver::Term;
use Graphics::Layout::Kiwisolver::Expression;
use Graphics::Layout::Kiwisolver::Constraint;
use Graphics::Layout::Kiwisolver::Strength;

1;
=head1 SEE ALSO



=cut
