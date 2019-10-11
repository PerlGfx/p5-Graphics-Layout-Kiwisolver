use Renard::Incunabula::Common::Setup;
package Renard::API::Kiwisolver;
# ABSTRACT: API for Kiwisolver constraint solver

use XS::Loader;
XS::Loader::load();

use Renard::API::Kiwisolver::Variable;
use Renard::API::Kiwisolver::Term;
use Renard::API::Kiwisolver::Expression;
use Renard::API::Kiwisolver::Constraint;
use Renard::API::Kiwisolver::Strength;

1;
=head1 SEE ALSO

L<Repository information|http://project-renard.github.io/doc/development/repo/p5-Renard-API-Kiwisolver/>

=cut
