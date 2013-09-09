#!/usr/bin/perl
## Copyright (C) 2013 by Yours Truly


#exercise1,2
=begin comment
while(<>){
	if(/[fF]red/){
		print $_;	
	}
}
=cut
#exercise3
=begin comment
while(<>){
	if(/[.]/){
		print $_;	
	}
}
=cut
#exercise4
=begin comment
while(<>){
	if(/[A-Z][a-z]+/){
		print $_;	
	}
}
=cut
#exercise5
=begin comment
while(<>){
	if(/(\S)\1/){
		print $_;
	}
}
=cut
#exercise6
while(<>){
	if(/(wilma.*fred)|(fred.*wilma)/){
		print $_;
	}
}