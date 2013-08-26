#!/usr/bin/perl

my %sigcount;
&ex4();

sub ex1{
	print `cd /;ls -l;`;
}

sub ex2{
	open(my $oldout, ">&STDOUT");
	open(my $olderr, ">&STDERR");
	open(STDOUT, '>', "ls.out");
	open(STDERR, '>', "ls.err");
	my $oldSTDERR = STDERR;
	system('cd /');
	system('ls -l');
	open(STDOUT, '>&', $oldout);
	open(STDERR, '>&', $oldout);
}

sub ex3{
	$_ = `date`;
	if(/^Sat/ || /^Sun/){
		print "Go Play\n";
	}
	else{
		print "Go to Work\n";
	}
}

sub ex4{
	$" = "\n";
	for my $key (sort keys %SIG){
		$SIG{$key}= 'sighandler';
	}
	while(1){
		1;
	}
}

sub sighandler{
	$" = "\n";
	$sigcount{$_[0]}++;
	print "This is $_[0] and I've seen it ".$sigcount{$_[0]}." times\n";
}