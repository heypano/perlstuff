#!/usr/bin/perl

#Exercise 1
=begin comment
my $debug = $ENV{DEBUG} // 1;
my $magicNumber = int(1+rand 100);
print "The number is $magicNumber\n" if $debug;
print "Guess the number\n";
$_ > $magicNumber ? print "Too high\n" : print "Too Low\n" until ((($_ = <STDIN>) == $magicNumber)||(/^quit$/i)||(/^exit$/i));
print "Gratz. It's $magicNumber\n" if /[0-9]+\.?[0-9]*/;
=cut
