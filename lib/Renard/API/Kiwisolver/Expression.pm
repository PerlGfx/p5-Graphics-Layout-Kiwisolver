use Renard::Incunabula::Common::Setup;
package Renard::API::Kiwisolver::Expression;
# ABSTRACT: Kiwisolver expression

use overload "fallback" => 0, '""' => \&stringify;

sub stringify {
	my ($self) = @_;
	"(@{[ $self->constant ]} + "
	.  " TERMS "
	#.  join(" + ", map { "$_" } @{ $self->terms })
	. " : @{[ $self->value ]})"
}

1;
