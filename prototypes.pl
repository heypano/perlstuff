#!/usr/bin/perl

use strict;
use warnings;

sub editString (\$){
    my ($string) = @_;
    $$string = $$string."a"; 
}


sub trim (\$){
    my ($string) = @_;
    $$string =~ s/^([\s]+)//;
    $$string =~ s/([\s]+)$//;
}

my $string = "     bab    \n \n \n \n \n ";
print "String before trim is: START".$string."END\n";
trim($string);
print "String after trim is: START".$string."END\n";

1;