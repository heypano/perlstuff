#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Math::Combinatorics;
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

# Bareword conversion

{
    my $simple_word = 'simple';
    my $single_underscore_word = '_underscore';
    my $double_underscore_word = 'undercore__mad___ne____ss__';
    my $zero_word = '0';
    my $double_zero_word = '00';
    my $number_word = '123';
    my $zero_number_word = '123';
    my $non_letter_word = '!#$@#%!';
    my $white_space = "\t\n  ";
    my $escape_sequence = '_0_';
    my $doubled_escape_sequence = '__00__';
    my $doubled_escape_sequence2 = '_0__0_';
    
    my @wordsToTest = ($simple_word,
                       $single_underscore_word,
                       $double_underscore_word,
                       $zero_word,$double_zero_word,
                       $number_word,
                       $zero_number_word,
                       $non_letter_word,
                       $white_space,
                       $escape_sequence,
                       $doubled_escape_sequence,
                       $doubled_escape_sequence2,
                       );
                       
    # concatenate 1 to 2*amount of words and test
    foreach my $numOfCombinedWords(1..(2*$#wordsToTest)){
        my $combiner = Math::Combinatorics->new( count=>$numOfCombinedWords , data=>[@wordsToTest] , frequency=>frequencyArrayRef(scalar(@wordsToTest),$numOfCombinedWords));
        while (my @set = $combiner->next_multiset){
            my $wordToTest =  join('',@set);
            test_word($wordToTest);
        }
    }
    
    
    sub test_word{
        my ($word) = @_;
        my $bareword = Pano::Util::toBareword($word);
        my $original = Pano::Util::fromBareword($bareword);
        is($word, $original, "PASS: $word is $original");
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

=comment
ok( defined &Pano::Util::toBareword, 
    'Pano::Util::toBareword is defined' );
ok( defined &Pano::Util::fromBareword, 
    'Pano::Util::fromBareword is defined' );
is(My::List::Util::sum(10,20,30,40),100, 
    "My::List::Util::sum of 10,20,30,40,50 is 100");
is( My::List::Util::sum(), undef,
    'No arguments returns undef' );
is( My::List::Util::sum( qw(a b) ), undef,
    'All bad args gives undef' );
is( My::List::Util::sum( qw(a b 4 5) ), 9,
    'Some good args works' );
  
{
my @shuffled = My::List::Util::shuffle();
is( scalar @shuffled, 0, 
    'No args returns an empty list' );
}
{
    my @array = 1 .. 10;
    my @shuffled = My::List::Util::shuffle( @array );
    is( scalar @array, scalar @shuffled,
      "The output list is the same size" );
    isnt( "@array", "@shuffled", 
    "The list is shuffled" );
};
=cut
done_testing();


