#!/usr/bin/perl

@sortedNums = sort {$a <=> $b} @ARGV;
#printRightJustified(@sortedNums);
#sortByLastName();

#exercise 2
my %last_name = qw{
  fred flintstone Wilma Flintstone Barney Rubble
  betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};

my @sortedLastName = sort {
	"\L$last_name{$a}" cmp "\L$last_name{$b}"
	or
	"\L$a" cmp "\L$b";
} keys %last_name;

for(@sortedLastName){
	print "$_ $last_name{$_}\n";
}

#exercise3
findOccurences("t","This is a test la la la la ");

sub findOccurences{
	my $of = shift;
	my $in = shift;
	my @positions = ();
	my $start =0;
	while (1){
		$start = index($in,$of,$start);
		last unless ($start>-1 and $start <length($in));
		push(@positions,$start);
		$start++;
	}
	$" = ", ";
	print "@positions.\n";
}



sub byLastName{
	lowercaseLastName($a) cmp lowercaseLastName($b);
}
sub lowercaseLastName{
	(my $lastName = shift) =~ s/^.+[\s]+([^\s]+)$/$1/;
	return "\L$lastName";
}
sub printRightJustified{
	for(@_){
		printf "%20g\n", $_;
	}
}