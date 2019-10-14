use Renard::Incunabula::Common::Setup;
package Renard::API::Kiwisolver::Constraint;
# ABSTRACT: Kiwisolver constraint

use overload "fallback" => 0, '""' => \&stringify;

sub stringify {
	my ($self) = @_;
	# TODO
	"";
}

1;

