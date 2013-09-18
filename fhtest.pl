#!/usr/bin/perl

use strict;
use warnings;
use Switch;
use Data::Dumper;

die "Call with a list of files\n" if (@ARGV<1);
my @whats = ('<>','<* .*>','<FH>');
my $thing_s;
my @thing_l;
for my $what(@whats){
	switch($what){
					case('<>'){
						$thing_s = <>;
						@thing_l = <>;
					}
					case('<* .*>'){
							$thing_s = <* .*>;
							@thing_l = <* .*>;
					}
					case('<FH>'){
							open FH, '<', $ARGV[0];
							$thing_s = <FH>;
							@thing_l = <FH>;
					}

	}
	print "$what in scalar context is: \n".Dumper($thing_s)."\n";
	print "$what in list context is: \n".Dumper(@thing_l)."\n";
}




