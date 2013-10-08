#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 7;

BEGIN {
    my @classes = qw(Animal Cow Horse Sheep Mouse Person LivingCreature);
    for my $class(@classes){
        use_ok( $class ) || print "Bail out!\n";
    }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
