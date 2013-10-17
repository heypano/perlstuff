#!/usr/bin/perl

use strict;
use warnings;
use Cow;
use RaceHorse;

ex_1();

sub feed_a_cow_named {
  my $name = shift;
  my $cow = Cow->named($name);
  $cow->eat('grass');
  print "Returning from the subroutine.\n";    # $cow is destroyed here
}

sub stuff{
    
    print "Start of program.\n";
    my $outer_cow = Cow->named('Bessie');
    print "Now have a cow named ", $outer_cow->get_name, ".\n";
    feed_a_cow_named('Gwen');
    print "Returned from subroutine.\n";
}

sub ex_1{
    my $runner = RaceHorse->named('Billy Boy');
    $runner->won;
    print $runner->get_name, ' has standings ', $runner->standings, ".\n";
}

