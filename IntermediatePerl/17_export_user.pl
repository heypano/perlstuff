#!/usr/bin/perl

use strict;
use warnings;
#use Oogaboogoo qw/number_to_month_name number_to_day_name/;
use Oogaboogoo qw/:all/;
use My::List::Util qw/sum shuffle/;

my @months = qw/Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dev/;

for(0..11){
    print $months[$_]." is ".number_to_month_name($_)."\n";
}

my $min = 1;
my $max = 16790;
my $sum = sum($min..$max);
print "The sum of ($min..$max) is $sum\n";