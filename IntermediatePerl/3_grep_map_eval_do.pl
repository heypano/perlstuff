#! /usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

#my @fib = fib(1500);
#print "@fib\n";

#ex1();
ex2();
#ex1_alt(10_000_000);


sub ex1_alt{
    my ($max_bytes) = @_; 
    print map {"    ".$_."\n"} grep {-s > $max_bytes} </home/ppapadatos/Downloads/*>;
}

sub ex2{
    print "Please enter pattern\n";
    chomp(my $regex = <STDIN>);
    my @grepped = eval{
           print map {"    ".$_."\n"} grep {/$regex/} </home/ppapadatos/Downloads/*>;    
    };
    if($@){
        print "Something went wrong: $@\n";
    }
}


sub ex1{
    my @files = files_larger_than($ARGV[0] , </home/ppapadatos/Downloads/*>);
    my @formatted_files = map {"    ".$_."\n"} @files;
    
    print "Files larger than $ARGV[0] bytes:\n==========================================================\n";
    print @formatted_files;
    #for (@files){
    #    printf("%-100s: %s \n",$_,(-s $_));
    #}
}



sub files_larger_than{
    my ($max_bytes, @files) = @_; 
    return ;
}




sub fib{
    my $n = @_?shift:10;
    my @a = (1,1);
    my $last_index = 1;
    for(0..($n-1)){
        my $last = $a[$last_index];
        my $second_to_last = $a[$last_index-1];
        push(@a,$last+$second_to_last);
        $last_index++;
    }
    return @a;
}