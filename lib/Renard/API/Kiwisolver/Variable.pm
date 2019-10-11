use Renard::Incunabula::Common::Setup;
package Renard::API::Kiwisolver::Variable;
# ABSTRACT: Kiwisolver variable

use overload "fallback" => 0, '""' => \&stringify;

sub stringify {
	my ($self) = @_;
	"(@{[ $self->name ]} : @{[ $self->value ]})"
}

1;

=classmethod new

TODO

=method name

TODO

=method setName

TODO

=method value

TODO

=method setValue

TODO

=method equals

TODO

=cut
