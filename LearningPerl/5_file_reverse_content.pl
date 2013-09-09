#!/usr/bin/perl
## Copyright (C) 2013 by Yours Truly


@the_files = reverse(@ARGV);
for $filePath (@the_files){
	if(!open FILEH, '<', $filePath){
		die "what $!";
	}
	while(<FILEH>){
		print $_;
	}
	close FILEH;
}
print "@the_files\n";