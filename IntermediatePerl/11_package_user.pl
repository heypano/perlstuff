#! /usr/bin/perl 

use strict;
use warnings;
require '11_packages.pl';

&ex_1();

sub ex_1{
    my($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;
    $year += 1900;
    
    print "Today is ".Pano::number_to_day_name($wday)." the ".$mday." of ".Pano::number_to_month_name($mon).", ".$year.".\n";
    
}