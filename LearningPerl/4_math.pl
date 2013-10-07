#!/usr/bin/perl
## Copyright (C) 2013 by Yours Truly

use feature 'state';
sub total{
	my $sum=0;
	for(@_){
		$sum+=$_;
	}
	return $sum;
}

sub average{
	return total(@_)/@_;
}

sub above_average{
	@numbers = 
	my $av = &average(@_);
	for my $i ( 0 .. (@_-1) ) {
		# undefine bad element
		if ($_[$i] <= $av){
			undef $_[$i];
		}
	}
	# now remove undefined elements
	@_ = grep{ defined }@_;
	return @_;
}

sub greet{
	state @people;
	if(!@people){
		@people = @_;
		print "Hi $_[0], you are the first person here!\n";	
	}
	else{
		print "Hi $_[0], I've seen @people\n";
		push(@people,$_[0]);
	}
	
}

my @fred = qw{ 1 3 5 7 9 };
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";
#print "Enter some numbers on separate lines: ";
#my $user_total = total(<STDIN>);
#print "The total of those numbers is $user_total.\n";
print "Sum of 1-1000 is ".total(1..1000)."\n";
print "average(1..10) ".&average(1..10)."\n";
@aba = &above_average(1..10);
print "above_average(1..10)  @aba \n";
greet( "Fred" );
greet( "Barney" );
greet( "Wilma" );
greet( "Betty" );