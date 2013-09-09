#!/usr/bin/perl
## Copyright (C) 2013 by Yours Truly



=begin comment exercise 1
my $what = 'fred|barney';
$_ = 'fredbarneyfred';
print "matches $what\n" if /($what){3}/;
print "does not match $what\n" if !/($what){3}/; 
$what = 'fred|bar...';
print "matches $what\n" if /($what){3}/;
print "does not match $what\n" if !/($what){3}/;
=cut


=begin comment exercise 2
my $in = $ARGV[0];
defined $in or die "Usage: $0 filename";
(my $out = $in) =~ s/(.+?)(\.[^.]+)?$/$1.out/; #this is using nongreedy stuff.
open ($in_fh, '<', $in) or die "Can't open $in for reading";
open ($out_fh, '>', $out) or die "Can't open $out for writing";

while(<$in_fh>){
	s/Fred/Larry/g;
	print $out_fh $_;
} 
=cut

=begin comment exercise 3
my $in = $ARGV[0];
defined $in or die "Usage: $0 filename";
(my $out = $in) =~ s/(.+?)(\.[^.]+)?$/$1.out/; #this is using nongreedy stuff.
open ($in_fh, '<', $in) or die "Can't open $in for reading";
open ($out_fh, '>', $out) or die "Can't open $out for writing";

#Use a placeholder for swapping
while(<$in_fh>){
	chomp;
	s/Fred/\n/g;
	s/Wilma/Fred/g;
	s/\n/Wilma/g;
	print $out_fh $_."\n";
} 
=cut

=begin comment exercise 4 -- adds a line to all files, works with globs
my @date = localtime(time);
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year += 1900;
(my $twoDigitYear = $year) =~ s/.+(..)$/$1/;
$copyrightString = "## Copyright (C) 20".$twoDigitYear." by Yours Truly\n";
$^I = ".bak";
while(<>){
	s/^(#!.+)/$1\n$copyrightString/;
	print;
}
=cut
#=begin comment exercise 5
my @date = localtime(time);
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year += 1900;
(my $twoDigitYear = $year) =~ s/.+(..)$/$1/;
$copyrightString = "## Copyright (C) 20".$twoDigitYear." by Yours Truly\n";

my %do_these;
foreach (@ARGV) {
  $do_these{$_} = 1;
}
while (<>) {
  if(/\A\Q$copyrightString\E/){ #\Q and \E are useful for avoiding interpolation
    delete $do_these{$ARGV};
  }
}
$^I = ".bak";
#ARGV contains the list of files edited by <> by default
if(@ARGV != 0){
	while(<>){
		if(s/^(#!.+)/$1\n$copyrightString/){
			print STDOUT "Adding/Updating appropriate copyright to $ARGV\n";	
		}
		print;
	}
}
else{
	print "All files have appropriate copyright.\n";
}
