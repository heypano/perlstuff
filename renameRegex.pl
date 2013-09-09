#!/usr/bin/perl

#die ("Call as renameRegex.pl fromRegex toRegex [path] e.g. renameRegex.pl \"^(.+)(520)(.+)\" \"(\$1)530(\$3)\" \n") if (!grep {$_ == @ARGV} (2,3));

#&rename($ARGV[0],$ARGV[1]);
&rename();

sub rename{
    print "From Regex: ";
    chomp(my $from=<STDIN>); 
    print "To Regex: ";
    chomp(my $to=<STDIN>);
    my $testString =  "aaaaa520bbbbb";
    eval{
        #TODO ARGHHHHH why can't I figure this out
        #$from = qr($from);
        #$to = qr($to);
        (my $newString = $testString) =~ s/$from/$to/;
        print "$newString\n";
    };
    if($@){
        die("problem $@\n");
    }
}