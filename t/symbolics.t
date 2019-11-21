#!/usr/bin/env perl

use Test::Most tests => 1;

use Renard::Incunabula::Common::Setup;
use Renard::API::Kiwisolver;

subtest "Test symbolics" => fun() {
	my $x = Renard::API::Kiwisolver::Variable->new('x');
	my $y = Renard::API::Kiwisolver::Variable->new('y');
	my $z = Renard::API::Kiwisolver::Variable->new('z');
	isa_ok 2 * $x,  'Renard::API::Kiwisolver::Term';
	isa_ok $y / 2,  'Renard::API::Kiwisolver::Term';
	isa_ok 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Expression';
	isa_ok 2 * $x - $y / 2, 'Renard::API::Kiwisolver::Expression';
	isa_ok 0 == 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Constraint';
	isa_ok $z == 2 * $x + $y / 2, 'Renard::API::Kiwisolver::Constraint';
};

done_testing;
