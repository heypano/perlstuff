#! /usr/bin/perl


#ex2();
hashSlices();

sub hashSlices{
 my %hash = (bla => 'one', bli => 'two', blo => 'three', ble => 'four');
 my @the_ones_we_want = ('bla','ble');
 my @value_slice = @hash{@the_ones_we_want};
 print "@value_slice\n";
}

sub ex1{
	die "Give me the name of the file and just that.\n" if(@ARGV!=1);
	
	open my $fh, '<', $ARGV[0] or die "Can't open $ARGV[0]. $!";
	my @fileContents = <$fh>;
	
	while(1){
		print "Gimme a pattern:";
		$expr = <STDIN>;
		chomp($expr);
		die "kthxbai\n" if($expr =~ /^[\s]*$/);
		my @grep_result = eval{
			 grep {/$expr/} @fileContents;
		};
		if($@){
			print "There was a problem: $@\n";
			next;
		}
		my $count=0;
		for(@grep_result){
			$count++;
			print $count.": ".$_."\n";	
		}
	}
}

sub ex2{
	my @files = <* .*>;
	for(@files){
		#my ($accesstime, $modtime) = map {join('-',((localtime($_))[3,4],(localtime($_))[5]+1900));} (stat)[8,9];
		my ($accesstime, $modtime) = map {my ($day,$month,$year)=(localtime($_))[3,4,5];sprintf("%s-%s-%s",$day,$month,$year+1900)} (stat)[8,9];
		printf "%-30s %15s %15s\n",$_, $accesstime, $modtime;
	}
}


