#!/usr/bin/perl

=begin comment
for(1..10){
	for(100..110){
		print("\t$_\n");
	}
	print("$_\n"); # keeps its value
}
=cut


sub binary{
	#binary print
	my $binary7 = 0b0111;
	my $decimal1240501=1240501;
	my $decimal1 =255;
	my $binaryAndStuff = $decimal1240501 & $decimal1;
	my $bitstring1 = "1010000000001";
	my $bitstring2 = "1111111111111";
	my $binaryAndStuff2 = $bitstring1 & $bitstring2;
	print $binaryAndStuff2."\n";
	#printf("%b\n",$binaryAndStuff2);
}

sub testExpression{
	my $a = "blabla\n";
	print "a is $a";
	chomp($a="gaga\n");
	print "a is $a";
	
}

&testExpression();