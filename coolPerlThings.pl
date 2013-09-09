#! /usr/bin/perl
use Data::Dumper;
$Data::Dumper::Sortkeys = 1;
settingElementsToOneInHashRef();


#Set multiple keys to 1 in one line without for
sub settingElementsToOneInHashRef{
    my %hash = (a => 1, b => 1, c => 1);
    my $hashref = \%hash;
    modifyHashRef2($hashref);
    print Dumper($hashref);
    
    #Inline helper function
    sub modifyHashRef2{
        my $hashref = shift;
        my @keys = ('d','e','f','g','h','i');
        
        #this is the line
        @$hashref{@keys}=(1)x(@keys);
    };
}

#Adding elements to a hash reference using hash slices
sub addingElementsToAHashRefWithHashSlices_alsoInlineFunction{
    my %hash = (a => '1', b => '2', c => '3');
    my $hashref = \%hash;
    modifyHashRef($hashref);
    print Dumper($hashref);
    
    #Inline helper function
    sub modifyHashRef{
        my $hashref = shift;
        my @keys = ('d','e','f','g','h','i');
        my @values = ('4','5','6','7','8','9');
        @$hashref{@keys}=@values;
    };
}



#Adds elements to a hash using hash slices
sub addingElementsToAHashWithHashSlices{
    my %hash = (a => '1', b => '2', c => '3');
    my @keys = ('d','e','f');
    my @values = ('4','5','6');
    @hash{@keys} = @values;
    print Dumper($hashref)
}

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