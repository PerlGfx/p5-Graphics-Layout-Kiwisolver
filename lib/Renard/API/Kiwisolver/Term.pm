use Renard::Incunabula::Common::Setup;
package Renard::API::Kiwisolver::Term;
# ABSTRACT: Kiwisolver term

use overload "fallback" => 0, '""' => \&stringify;

sub stringify {
	my ($self) = @_;
	"(@{[ $self->coefficient ]} * @{[ $self->variable ]} : @{[ $self->value ]})"
}

1;
