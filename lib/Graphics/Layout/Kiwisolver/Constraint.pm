use Renard::Incunabula::Common::Setup;
package Graphics::Layout::Kiwisolver::Constraint;
# ABSTRACT: Kiwisolver constraint

use overload "fallback" => 0, '""' => \&stringify;

sub stringify {
	my ($self) = @_;
	# TODO
	"";
}

1;

