#!/usr/bin/perl
use 5.010001;

=begin comment
#exercise 1
my $magicNumber = int(1+rand 100);
print "The number is $magicNumber\n" if $debug;
print "Guess the number\n";
LOOP: {
	chomp(my $_ = <STDIN>);
	when(/^quit|exit$/i){print "kthxbai";last LOOP;}
	when($_ > $magicNumber){print "Too high\n";redo;}
	when($_ < $magicNumber){print "Too low\n";redo;}
	when($magicNumber){print "You got it. Gratz.\n";last LOOP;}
	default{print "You got it\n";}
}
mods(9);
mods(15);
mods(21);
mods(105);

#exercise 3
for(@ARGV){
	print "$_ is: ";
	when(! -e){print "Nonexistent.\n";}
	when(-R){print "Readable ";continue;}
	when(-W){print "Writable ";continue;}
	when(-X){print "Excutable ";continue;}
	default{print "\n";}
}
=cut
#exercise 4
$\="\n";
given($ARGV[0]){
	chomp($_);
	my %allDivisors = allDivisors($_);
	my @allDivisors = sort {$a <=> $b} keys %allDivisors;
	my @empty;
	when(/[^\d]/){print "$_ is not a number. Goodbye";}
	when(@allDivisors~~@empty){print "Prime";}
	default{print "@allDivisors";}
}


sub allDivisors{
	my $num = shift;
	my %divisors;
	for(reverse (2..($num/2))){
		if($divisors{$_}){
			#print("$_ already found");
			next;
		}
		elsif($num%$_==0){
			$divisors{$_}=1;
			%allDivisors = allDivisors($_);
			for(keys %allDivisors){
				$divisors{$_}=1;
			}
		}
	}
	return %divisors;
}


sub mods{
	$_ = shift;
	given($_){
		print "$_: ";
		when($_%3==0){print "Fizz ";continue;}
		when($_%5==0){print "Binn ";continue;}
		when($_%7==0){print "Sausage ";continue;}
		default{print "\n";}
	}
}