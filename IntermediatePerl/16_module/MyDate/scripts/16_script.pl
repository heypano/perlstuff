#!/usr/bin/perl

# perl -Ilib scripts/16_script.pl

use MyDate;

print "date is ".MyDate->date()."\n";
print "month is ".MyDate->month()."\n";
print "year is ".MyDate->year()."\n";

MyDate->debug("yo");
