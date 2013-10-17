#! /usr/bin/perl
use Data::Dumper;
use Math::Combinatorics;
$Data::Dumper::Sortkeys = 1;

multiset_test();

sub multiset_test{
    my $count = 3;
    my $combiner = Math::Combinatorics->new( count=>$count , data=>[qw(1 2 3 4)] , frequency=>frequencyArrayRef(4,1) );
    my @sets = ();
    
    while (my @set = $combiner->next_multiset){
        push(@sets,\@set);
    }
    
    printSet(@$_) for (@sets);
    
    # Sort through each index of the array
    @sets = sort {
        my @internal_set_a = @$a;
        my @internal_set_b = @$b;
        for(0..$#internal_set_a){
            my $compFunc = numCompareAtIndex($_);
            my $result = &$compFunc($a,$b);
            return $result if($result != 0);
        }
        return 0;
    } @sets;
    
    print "After ----\n";
    printSet(@$_) for (@sets);
    
        
    sub numCompareAtIndex{
        my $index = shift;
        my $comparison_sub = sub {$a->[$index] <=> $b->[$index]};
        return $comparison_sub;
    }
    
    sub frequencyArrayRef{
        my ($amount,$value) = @_;
        my $arrayRef = [];
        
        push(@$arrayRef,$value) for (0..($amount-1));
        
        return $arrayRef;
    }
    
    
    sub printSet{
        my @set = @_;        
        print '(';
        for(0..$#set){
            print $set[$_];
            print ', ' if($_ != $#set);
        }
        print ")\n";
    }
}
# trim with prototypes
sub trim (\$){
    my ($string) = @_;
    $$string =~ s/^([\s]+)//;
    $$string =~ s/([\s]+)$//;
}

# Capitalizes the first letter
sub capitalizeFirst{
    my ($string) = @_;
    $string = ucfirst lc $string;
    print "Capitalized the first letter and lowercased the rest: ".$string."\n";
    return ucfirst lc $_;
}

# Set multiple keys to 1 in one line without for
sub settingElementsToOneInHashRef{
    my %hash = (a => 1, b => 1, c => 1);
    my $hashref = \%hash;
    modifyHashRef2($hashref);
    print Dumper($hashref);
    
    # Inline helper function
    sub modifyHashRef2{
        my $hashref = shift;
        my @keys = ('d','e','f','g','h','i');
        
        # this is the line
        @$hashref{@keys}=(1)x(@keys);
    };
}

# Adding elements to a hash reference using hash slices
sub addingElementsToAHashRefWithHashSlices_alsoInlineFunction{
    my %hash = (a => '1', b => '2', c => '3');
    my $hashref = \%hash;
    modifyHashRef($hashref);
    print Dumper($hashref);
    
    # Inline helper function
    sub modifyHashRef{
        my $hashref = shift;
        my @keys = ('d','e','f','g','h','i');
        my @values = ('4','5','6','7','8','9');
        @$hashref{@keys}=@values;
    };
}



# Adds elements to a hash using hash slices
sub addingElementsToAHashWithHashSlices{
    my %hash = (a => '1', b => '2', c => '3');
    my @keys = ('d','e','f');
    my @values = ('4','5','6');
    @hash{@keys} = @values;
    print Dumper($hashref)
}

# Returns an array or a scalar based on the context
# my $sc = differentReturnBasedOnContext();
# my @arr = differentReturnBasedOnContext();
# print "sc is $sc and arr is @arr\n";
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


# Interpolating a function call in a string
# interpolatingAFunctionCall();

sub interpolatingAFunctionCall{
	print "String says:\n";
	print "${\thisString(\"six\")}";
}

sub thisString{
	return "One two three four five $_[0]\n";
}


# Hash assignment
# hashAssignment();
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

# Read file into array
# readFile("chapter13.pl");
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