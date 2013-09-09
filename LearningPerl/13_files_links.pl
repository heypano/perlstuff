#!/usr/bin/perl
=begin comment
$\ = "\n";
#$" = "\n";
chdir '/home/ppapadatos';
my @arr = <.*>; #all files including .
my $arrlen = @arr;
print $arrlen;
for my $i (0..$#arr) {
    undef $arr[$i] if (($arr[$i] eq '.' ) or ($arr[$i] eq '..'));
}
# now remove undefined elements
@arr = grep{ defined }@arr;
my $arrlen = @arr;
print $arrlen;
=cut

$\ = "\n";
$" = "\n";
=begin comment
#Exercise 1,2,3
print "What's the directory name?";
my $name = <STDIN>;
chomp $name;
if($name =~ /^[\s]*$/){
	chdir or warn "Couldn't change to your home directory";
}
else{
	chdir $name or warn "Couldn't change to directory $name";
}
@contents = glob '.* *';
print "@contents";
#Exercise 4 -- rm
for (@ARGV){
	unlink $_ or die "Can't unlink $_";
}
#exercise 5 --mv
my $from = $ARGV[0];
my $to = $ARGV[1];
my $path = $to;
die ("use like 'mv from to'") if(!defined $from or !defined $to or $from =~ /^[\s]*$/ or $to =~ /^[\s]*$/);
$path = "$to/$from" if(-d $to);
rename $from => $path or warn "Couldn't rename $from to $path"; #since => is equivalent to ,

#exercise 6
my $isSoft = 0;
my $firstArg = 0;
if($ARGV[0] eq '-s'){
	$isSoft = 1;
	$firstArg++; 
}
my $from = $ARGV[$firstArg];
my $to = $ARGV[$firstArg + 1];
die ("$from does not exist") unless -e $from;
if($isSoft){
	symlink ($from, $to) or die("Error creating symbolic linkz: $!");
}
else{
	link ($from, $to) or die("Error creating hard linkz: $!");	
}
=cut
while(<.* *>){
	print $_ if -l;
}