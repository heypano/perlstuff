#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Math::BaseCalc;
use feature "state";
# perl -T -Mblib t/util.t

BEGIN {
  use_ok( 'Pano::Util' ) || BAIL_OUT();
}

# Defined tests

{
    my @functions = qw/toBareword fromBareword/;
    my $prefix = 'Pano::Util::';
    
    @functions = map {$prefix.$_} @functions; 
    
    foreach (@functions){
        ok( defined $_, "PASS: $_ is defined" );
    }
}

# Test bareword conversion

{
    # Contains all potentially harmful sigils
    my @importantStuff = (
                            '0',      
                            '1',      
                            '_',      
                            'a',
                            ' ',
                            '"',
                            '^',
                            "'",
                            '$',
                            );
    
    # Gets all possible multisets of a specific length (with multiplication) and tests them ($numValues ^ $length iterations)
    while (defined(my $next = next_element(9,@importantStuff))){
        test_word($next);
    }
    
    # Provides the (next) concatenated multiset combination of length $stringLength for an @array
    sub next_element{
        my ($stringLength,@array) = @_;
        
        # This number will be incremented each time to determine which elements will be in the array 
        state $decimalIndex = 0;
        
        # The numeric base needs to be the size of the array (n) so that the indices go up to n-1  
        state $newBase = scalar(@array);
        
        # Convert the decimal number to a number whose base is whatever the length of the array is 
        state $converter = new Math::BaseCalc(digits => [0..$newBase-1]);
        
        # This needs to be recalculated every time
        my $rebasedIndex = $converter->to_base($decimalIndex);
        my $rebasedIndexLength = length($rebasedIndex);
        
        # This means we're done
        if($rebasedIndexLength > $stringLength){
            return undef ;        
        }
        else{ # Make sure the string will be the right size (for low decimals, the number of digits in the other base will be lower than $stringLength)
            my $remainingDigits = $stringLength - $rebasedIndexLength;
            # Add zeros to the front of the number (will prefix the string with the first element from the array)
            $rebasedIndex = ("0"x$remainingDigits).$rebasedIndex;
        }
        
        my $i = 0; # Holds the substring position
        my $createdString = '';
        
        # Interpret each position in the $rebasedIndex as an array index and make the equivalent string using @array -- (This is guaranteed to cover all combinations)
        while((my $arrayIndex = substr($rebasedIndex,$i,1)) =~ /[0-9]/){
            $createdString .= $array[$arrayIndex];
            $i++;
        }
        
        # Increase the decimal index
        $decimalIndex++;
        
        return $createdString;
    }
    
    # Tests one word conversion back and forth
    sub test_word{
        my ($word) = @_;
        my $bareword = Pano::Util::toBareword($word);
        my $original = Pano::Util::fromBareword($bareword);
        
        # Tests if the conversion is 1-1
        is($word, $original, "Converted Successfully: $word");
        
        # Check if the conversion made a proper bareword (does not start with a number, only has letters digits and underscores)
        ok($bareword =~ /^[a-zA-Z_][a-zA-Z0-9_]*$/, 'Is a proper bareword: '.$bareword);
    }
    
}

done_testing();


