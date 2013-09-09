#!/usr/bin/perl

my @rwownedbyme = rwowned(@ARGV);

print "@rwownedbyme\n";
#print "Oldest file is ".oldestFile(@ARGV)."\n";
#for(@ARGV){
#	print daysOld($_)."\n";
#}


sub whatIs{
	$_ = shift;
	my $output = "$_ is ";
	return $output. "nonexistent\n" unless -e $_;
	$output .= "not " unless -R $_;
	$output .= " readable, ";
	$output .= "not " unless -W $_;
	$output .= " writable, ";
	$output .= "not " unless -X $_;
	$output .= " executable.\n";
	return $output;
}

sub daysOld{
	$_ = shift;
	return -M $_;
}

sub oldestFile{
	my $oldest;
	my $oldestDate;
	for(@_){
		if(!defined($oldest) || !defined($oldestDate)){
			if(-e $_){
				$oldest = $_;
				$oldestDate = -M $_;
				next;
			}
			else{
				next;
			}
		}
		$thisFileDate = -M $_;
		#print "$_: $thisFileDate vs $oldestDate\n";
		if($thisFileDate > $oldestDate){
			$oldest = $_;
			$oldestDate = $thisFileDate;
		}
	}
	return $oldest;
}

sub rwowned{
	@files = ();
	for(@_){
		if(-R -W -O $_){
			push(@files, $_);
		}
	}
	return @files;
}