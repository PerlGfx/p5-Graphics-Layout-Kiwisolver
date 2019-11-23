#!/usr/bin/env perl

use Test::Most tests => 1;

use Renard::Incunabula::Common::Setup;
use Renard::API::Kiwisolver;

subtest "Expression stringify" => fun() {
	my $x = Renard::API::Kiwisolver::Variable->new('x');
	$x->setValue(1);
	my $y = Renard::API::Kiwisolver::Variable->new('y');
	$y->setValue(2);
	my $z = Renard::API::Kiwisolver::Variable->new('z');
	$z->setValue(3);
	my $expression = $x + (2*$y + (3*$z + 4));
	is "$expression", "(4 + (3 * (z : 3) : 9) + (2 * (y : 2) : 4) + (1 * (x : 1) : 1) : 18)";
};

done_testing;
