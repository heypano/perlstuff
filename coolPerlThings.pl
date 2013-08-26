#! /usr/bin/perl

#Returns an array or a scalar based on the context
#my $sc = differentReturnBasedOnContext();
#my @arr = differentReturnBasedOnContext();
#print "sc is $sc and arr is @arr\n";
sub differentReturnBasedOnContext{
    
    if(wantarray)
    {
        return (1,2,3);
    }
    else
    {
        return 1;
    }
}


#Interpolating a function call in a string
#interpolatingAFunctionCall();

sub interpolatingAFunctionCall{
	print "String says:\n";
	print "${\thisString(\"six\")}";
}

sub thisString{
	return "One two three four five $_[0]\n";
}


#Hash assignment
#hashAssignment();
sub hashAssignment{
	my %hash = (bla=>"bla",ble=>"bleeeeeh",one=>"no",two=>"no");
	for my $key (keys %hash){
		print "$key $hash{$key}\n";
	}
	@keys_to_access = ("one","two");
	@new_values = ("YES","NIENIENIE");
	@hash{@keys_to_access} = @new_values;
	print ("\nAltered Hash:\n\n");
	for my $key (keys %hash){
		print "$key $hash{$key}\n";
	}
}

#Read file into array
#readFile("chapter13.pl");
sub readFile{
	my $fileName = shift;
	open my $fh,'<',$fileName or die("Can't open $fileName\n");
	my @content = <$fh>;
	my $count = 1;
	for (@content){
		print($count.": ".$_); 
		$count++;
	}
	print "\n";
}