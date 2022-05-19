#!/usr/bin/env perl

use Test::Most;

plan tests => 1;

use Renard::Incunabula::Common::Setup;
use Graphics::Layout::Kiwisolver;
use constant {
	Variable => 'Graphics::Layout::Kiwisolver::Variable',
	Solver => 'Graphics::Layout::Kiwisolver::Solver'
};

use lib 't/lib';

fun var_list_to_hash(@vars) {
	return +{ map {
		die unless $_->name;
		$_->name => $_->value;
	} @vars };
}

subtest "Test solver" => fun() {
	# Example adapted from Kiwisolver documentation
	# <https://kiwisolver.readthedocs.io/en/latest/basis/basic_systems.html>
	# <https://github.com/nucleic/kiwi/blob/1.1.0/docs/source/basis/basic_systems.rst>
	my $x1 = Variable->new('x1');
	my $x2 = Variable->new('x2');
	my $xm = Variable->new('xm');
	my @vars = ($x1, $x2, $xm);

	my @constraints = ( $x1 >= 0, $x2 <= 100, $x2 >= $x1 + 10, $xm == ($x1 + $x2) / 2 );

	my $solver = Solver->new;

	for my $cn (@constraints) {
		$solver->addConstraint($cn);
	}

	$solver->addConstraint( ($x1 == 40) | Graphics::Layout::Kiwisolver::Strength::WEAK );

	$solver->addEditVariable($xm, Graphics::Layout::Kiwisolver::Strength::STRONG );

	$solver->suggestValue($xm, 60);
	$solver->updateVariables;
	is_deeply var_list_to_hash(@vars),
		{ xm => 60, x1 => 40, x2 => 80 },
		'suggest xm = 60';

	$solver->suggestValue($xm, 90);
	$solver->updateVariables;
	is_deeply var_list_to_hash(@vars),
		{ xm => 90, x1 => 80, x2 => 100 },
		'suggest xm = 90';

};

done_testing;
