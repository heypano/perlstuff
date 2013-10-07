#! /usr/bin/perl 

use strict;
use warnings;
package Pano;

sub number_to_day_name{
    my ($num) = @_;
    my @day = qw(ark dip wap sen pop sep kir);
    die "\$num cannot be more than ".@day if ($num > $#day);
    return $day[$num];
}

sub number_to_month_name{
    my ($num) = @_;
    my @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);
    die "\$num cannot be more than ".@month if ($num > $#month);
    return $month[$num];
} 


1;