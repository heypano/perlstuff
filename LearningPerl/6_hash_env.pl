#!/usr/bin/perl
## Copyright (C) 2013 by Yours Truly

use Data::Dumper;
%some_hash = ('a','b','c','d','e','f');

#print Dumper(\%some_hash);
#print Dumper(sort keys \%ENV);


#exercise 1
#print "Gimme your name\n";
#$name = <STDIN>;
#chomp($name);
#%last_names=(
#	pano => "papadatos",
#	george => "tsiolis",
#	jaison => "cooper",
#);

#print "Hey ".$last_names{$name}."\n";

#exercise 2
#%counthash = ();
#while(<>){
#	chomp;
#	$counthash{$_}++;
#}
#print Dumper(\%counthash)

#exercise3
my $maxLength = 0;
my @sortedENVkeys = sort keys %ENV;
while(my($key,$value)=each %ENV){
	if(length($key)>$maxLength){
		$maxLength=length($key);	
	}
}

foreach $key(@sortedENVkeys){
	$numSpaces = $maxLength-length($key)+10;
	$spaces = " "x$numSpaces;
	print "$key$spaces".$ENV{$key}."\n";
}
