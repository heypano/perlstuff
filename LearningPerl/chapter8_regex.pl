#!/usr/bin/perl
## Copyright (C) 2013 by Yours Truly


=begin comment
my $stringg = "bla aga boo zee";
if($stringg =~ / aga /){
	print $`.$&.$'." matched\n";
}
=cut

$pattern1 = "match";

while (<>) {                   # take one input line at a time
    chomp;
    if (/(?<THETHING>a\b)/) {
    	print $+{THETHING}." matched \n";
        #print "Matched: |$`<$&>$'|\n";  # the special match vars
    } else {
        print "No match: |$_|\n";
    }
}