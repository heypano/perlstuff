#!/usr/bin/perl

use strict;
use warnings;
use Horse;
use Data::Dumper;

# perl -Ilib scripts/15_objects.pl

my $special_horse = Horse->named("Blorg");
my $name = $special_horse->get_name;
my $color = $special_horse->get_color;

print "$name is $color.\n";

$special_horse->set_name("George")
              ->set_color("Golden");
$name = $special_horse->get_name;
$color = $special_horse->get_color;        
print "$name is $color.\n";
#my $shouldntwork = $special_horse->name;
#print "shouldntwork $shouldntwork\n";
my $class = ref $special_horse;
print "Class is $class\n";