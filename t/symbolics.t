#!/usr/bin/env perl

use Test::Most tests => 1;

use Renard::Incunabula::Common::Setup;
use Renard::API::Kiwisolver;

subtest "Test symbolics" => fun() {
	my $x = Renard::API::Kiwisolver::Variable->new('x');
	my $y = Renard::API::Kiwisolver::Variable->new('y');
	my $z = Renard::API::Kiwisolver::Variable->new('z');

	my $exception = qr/std::invalid_argument/;
	my $undef = undef;
	throws_ok { my $r = $x + $undef } $exception, 'exception: Variable + undef';
	throws_ok { my $r = $undef + $x } $exception, 'exception: undef + Variable';
	throws_ok { my $r = $x - $undef } $exception, 'exception: Variable - undef';
	throws_ok { my $r = $undef - $x } $exception, 'exception: undef - Variable';
	throws_ok { my $r = $x * $undef } $exception, 'exception: Variable * undef';
	throws_ok { my $r = $undef * $x } $exception, 'exception: undef * Variable';

	throws_ok { my $r = 2*$x + $undef } $exception, 'exception: Term + undef';
	throws_ok { my $r = $undef + 2*$x } $exception, 'exception: undef + Term';
	throws_ok { my $r = (2*$x) * $undef } $exception, 'exception: Term * undef';
	throws_ok { my $r = $undef * (2*$x) } $exception, 'exception: undef * Term';

	throws_ok { my $r = (2*$x + $y / 2) + $undef } $exception, 'exception: Expression + undef';
	throws_ok { my $r = $undef + (2*$x + $y / 2) + $undef } $exception, 'exception: Expression + undef';

	isa_ok $x + 5,  'Renard::API::Kiwisolver::Expression', 'Variable + double';
	isa_ok $x - 5,  'Renard::API::Kiwisolver::Expression', 'Variable - double';
	isa_ok 5 + $x,  'Renard::API::Kiwisolver::Expression', 'double + Variable';
	isa_ok 5 - $x,  'Renard::API::Kiwisolver::Expression', 'double - Variable';

	isa_ok -$x,  'Renard::API::Kiwisolver::Term', '- Variable (unary)';

	isa_ok 2 * $x,  'Renard::API::Kiwisolver::Term', 'double * Variable';
	isa_ok $x * 2,  'Renard::API::Kiwisolver::Term', 'Variable * double';

	isa_ok $y / 2,  'Renard::API::Kiwisolver::Term', 'Variable / double';

	isa_ok $x + $y, 'Renard::API::Kiwisolver::Expression', 'Variable + Variable';
	isa_ok $x - $y, 'Renard::API::Kiwisolver::Expression', 'Variable - Variable';

	isa_ok -(2 * $x),  'Renard::API::Kiwisolver::Term', '- Term (unary)';

	isa_ok 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Expression', 'Term + Term';
	isa_ok 2 * $x - $y / 2, 'Renard::API::Kiwisolver::Expression', 'Term - Term';

	isa_ok 2 * $x + 3, 'Renard::API::Kiwisolver::Expression', 'Term + double';
	isa_ok 2 * $x - 3, 'Renard::API::Kiwisolver::Expression', 'Term - double';
	isa_ok 3 + 2 * $x, 'Renard::API::Kiwisolver::Expression', 'double + Term';
	isa_ok 3 - 2 * $x, 'Renard::API::Kiwisolver::Expression', 'double - Term';

	isa_ok 2 * $x / 3,  'Renard::API::Kiwisolver::Term', 'Term / double';

	isa_ok -(2 * $x + $y / 2),  'Renard::API::Kiwisolver::Expression', '- Expression (unary)';

	isa_ok( (2 * $x + $y / 2) / 3,  'Renard::API::Kiwisolver::Expression', 'Expression / double');

	isa_ok 0 == 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Constraint', 'double == Expression';
	isa_ok $z == 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Constraint', 'Variable == Expression';
	isa_ok 4 * $z == 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Constraint', 'Term == Expression';
	isa_ok 4 * $z == 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Constraint', 'Term == Expression';
};

done_testing;
