#! /usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
use Regexp::Assemble;
ex_2();



sub ex_3{
    open my $fh, '<', 'listopatterns';
    chomp(my @patarr = <$fh>);
    my $ra = Regexp::Assemble->new;
    for(@patarr){
        $ra->add($_);
    }
    print "Gimme matches\n";
    while(chomp(my $inp = <STDIN>) !~ /^EXIT$/){
        if($inp =~ $ra->re){
            print "$inp matched ${$ra->re}\n";
        }
        else{
            print "$inp did not match anything\n";
        }    
    }
}

sub ex_2{
    open my $fh, '<', 'listopatterns';
    chomp(my @patarr = <$fh>);
    @patarr = eval {map {qr/$_/} @patarr} or die("Error with pattern: ".$@);
    print "Gimme matches\n";
    EXTERN: while(chomp(my $inp = <STDIN>) !~ /^EXIT$/){
        for(my $i=0;$i<@patarr;$i++){
            if($inp =~ $patarr[$i]){
                my $lineNo = $i+1; 
                print "$inp matched $patarr[$i] at line $lineNo\n";
                next EXTERN;
            }    
        }
        print "$inp did not match anything\n";
    }
}

sub ex_1{
    my %patterns = (
      Gilligan   => qr/(?:Willie )?Gilligan/,
      'Mary-Ann' => qr/Mary-Ann/,
      Ginger     => qr/Ginger/,
      Professor  => qr/(?:The )?Professor/,
      Skipper    => qr/Skipper/,
      'A Howell' => qr/Mrs?\. Howell/,
    );
    
    my $key = rightmost(
      'There is Mrs. Howell, Ginger, and Gilligan',
      \%patterns
    );
    
    print "Rightmost match for key $key\n";
}


sub rightmost {
    my( $string, $patterns ) = @_;
    my $rightmost = -1;
    my $rightmost_key;
    for my $key (keys %$patterns) {
        my $position = ($string =~ m/$patterns->{$key}/ ? $-[0] : -1);
        if ($position > $rightmost){
            $rightmost = $position;
            $rightmost_key = $key;
        };
    }
    return $rightmost_key;
}