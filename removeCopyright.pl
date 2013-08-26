#!/usr/bin/perl
$^I=".bak";
while(<>){
   s/^## Copyright.+\n//;
   print;
}


