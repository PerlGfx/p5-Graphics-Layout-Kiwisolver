use Renard::Incunabula::Common::Setup;
package Intertangle::API::Kiwisolver;
# ABSTRACT: API for Kiwisolver constraint solver

use XS::Framework;
use XS::Loader;
XS::Loader::load();

use Intertangle::API::Kiwisolver::Variable;
use Intertangle::API::Kiwisolver::Term;
use Intertangle::API::Kiwisolver::Expression;
use Intertangle::API::Kiwisolver::Constraint;
use Intertangle::API::Kiwisolver::Strength;

1;
=head1 SEE ALSO



=cut
