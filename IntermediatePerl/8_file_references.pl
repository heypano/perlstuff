#! /usr/bin/perl

use strict;
use warnings;
use IO::Tee;

&ex_2();
sub ex_1{
    print "file, scalar or both?\n";
    chomp(my $bla = <STDIN>);
    my $fh;
    my $thisvar;
    if($bla eq 'file'){
        open $fh, '>>', './tempout.txt';
    } 
    elsif($bla eq 'scalar'){
        open $fh, '>>', \$thisvar;
    }
    elsif($bla eq 'both'){
        open my $fh1, '>>', './tempout.txt';
        open my $fh2, '>>', \$thisvar;
        $fh = IO::Tee->new( $fh1, $fh2 );
    }
    
    print $fh localtime."\n";
    print "Scalar is ".$thisvar."\n";
}

sub ex_2{
    my $filename = "8_2_data_file";
    open my $readfh, '<', $filename or die("I could not open");
    doTheWork($readfh);
}


sub doTheWork{
    my ($readfh) = @_;
    my $fh_hash = {};
    while(<$readfh>){
        if(/^(?<matchedName>[^:]+):/){
            my $path = "./8stuff/".$+{matchedName};
            if(!defined($fh_hash->{$+{matchedName}})){
                open $fh_hash->{$+{matchedName}}, '>', $path or die("Could not open $path: $!");   
            }         
            print {$fh_hash->{$+{matchedName}}} $_;
        }
    }
}


sub ex_3{
    for my $dir(@_){
        opendir(my $dh, $dir) or die "Can't opendir $dir: $!";
        print "Dir $dir\n++++++++++++++++++\n";
        print_directory_contents($dh);
    }
}

sub print_directory_contents{
    my ($dh) = @_;
    print "$_\n" while readdir($dh);
    print "\n";
}

