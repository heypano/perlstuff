#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

BEGIN {
  use_ok( 'My::List::Util' ) || BAIL_OUT();
}
ok( defined &My::List::Util::sum, 
    'My::List::Util::sum is defined' );
ok( defined &My::List::Util::shuffle, 
    'My::List::Util::shuffle is defined' );

is(My::List::Util::sum(10,20,30,40),100, 
    "My::List::Util::sum of 10,20,30,40,50 is 100");
is( My::List::Util::sum(), undef,
    'No arguments returns undef' );
is( My::List::Util::sum( qw(a b) ), undef,
    'All bad args gives undef' );
is( My::List::Util::sum( qw(a b 4 5) ), 9,
    'Some good args works' );
  
{
my @shuffled = My::List::Util::shuffle();
is( scalar @shuffled, 0, 
    'No args returns an empty list' );
}
{
    my @array = 1 .. 10;
    my @shuffled = My::List::Util::shuffle( @array );
    is( scalar @array, scalar @shuffled,
      "The output list is the same size" );
    isnt( "@array", "@shuffled", 
    "The list is shuffled" );
};

done_testing();


