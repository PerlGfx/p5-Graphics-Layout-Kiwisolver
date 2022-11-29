use strict;
use warnings;
package Graphics::Layout::Kiwisolver::Term;
# ABSTRACT: Kiwisolver term

use overload "fallback" => 0, '""' => \&stringify;

sub stringify {
	my ($self) = @_;
	"(@{[ $self->coefficient ]} * @{[ $self->variable ]} : @{[ $self->value ]})"
}

1;
