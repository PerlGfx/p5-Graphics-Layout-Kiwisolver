#!/usr/bin/env perl

use Test::Most tests => 1;

use Renard::Incunabula::Common::Setup;
use Renard::API::Kiwisolver;

subtest "Expression stringify" => fun() {
	my $x = Renard::API::Kiwisolver::Variable->new('x');
	my $y = Renard::API::Kiwisolver::Variable->new('y');
	my $z = Renard::API::Kiwisolver::Variable->new('z');
	my $expression = $x + 2*$y + 3*$z + 4;
	note $expression;
	pass;
};

done_testing;
