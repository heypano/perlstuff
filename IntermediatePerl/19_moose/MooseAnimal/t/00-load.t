#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 7;

BEGIN {
    use_ok( 'MooseAnimal' ) || print "Bail out!\n";
    use_ok( 'MooseCow' ) || print "Bail out!\n";
    use_ok( 'MooseHorse' ) || print "Bail out!\n";
    use_ok( 'MooseMouse' ) || print "Bail out!\n";
    use_ok( 'MooseRaceHorse' ) || print "Bail out!\n";
    use_ok( 'MooseRacer' ) || print "Bail out!\n";
    use_ok( 'MooseSheep' ) || print "Bail out!\n";
}

diag( "Testing MooseAnimal $MooseAnimal::VERSION, Perl $], $^X" );
