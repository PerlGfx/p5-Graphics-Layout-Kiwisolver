#!/usr/bin/env perl

use Test::Most tests => 3;

use Renard::Incunabula::Common::Setup;
use Renard::API::Kiwisolver;
use aliased 'Renard::API::Kiwisolver::Variable';

subtest "Create variable" => fun() {
	my $x = Variable->new('x');
	my $no_name = Variable->new;

	is $x->name, 'x', 'check name';
	is $no_name->name, '', 'has no name';

	$x->setValue(42);
	is $x->value, 42, 'check value';
};

subtest "Reference equality variables" => fun() {
	my $x = Variable->new('x');
	my $y = Variable->new('y');

	ok  $x->equals($x), 'Are equal';
	ok !$x->equals($y), 'Are not equal';
};

subtest "Add operators" => fun() {
	my $x = Variable->new;
	my $y = Variable->new;
	$x->setValue(5);
	$y->setValue(6);
	my $t = $x + $y;
	is $t->value, 11, 'add up values';
};

done_testing;
