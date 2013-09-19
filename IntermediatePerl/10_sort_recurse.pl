#! /usr/bin/perl 

use strict;
use warnings;
use Benchmark qw(:all);
use Data::Dumper;

&ex_4();

sub ex_4{
    data_for_path("/home/ppapadatos/Downloads/eclipse",0);
}

sub ex_3{
    open FH, '<', 'words';
    chomp(my @words = <FH>);
    my @dictSort =
        map {$_->{word}}
        sort {$a->{helper} cmp $b->{helper}}
        map {
            my $string = $_; 
            $string =~ tr/A-Z/a-z/; 
            $string =~ tr/a-z//cd;
            {word => $_, helper => $string};
        } @words;
    print Dumper(@dictSort);
}

sub ex_2{
    my $count = 100000;
    open(my $oldout, ">&STDOUT");
    #local *STDOUT;
    #open *STDOUT, '>>', '/dev/null';
    #my $time_ex_1 = timeit($count, \&ex_1);
    #my $time_ex_2 = timeit($count, \&ex_1_old_way);
    #my $diff = timediff($time_ex_1, $time_ex_2);
    #open *STDOUT, '>&', $oldout;
    #print Dumper($diff);
    timethese($count,{'ex1'=>\&ex_1,'ex1_old'=>\&ex_1_old_way});
    
}


sub ex_1{
    chdir;  # the default is our home directory
    my @sorted = 
    map $_->{name},    
    sort { $a->{size} <=> $b->{size} } 
    map {
        name => $_,
        size => (-s $_)
    }, glob '*';
   #print Dumper(@sorted);
}

sub ex_1_old_way{
    chdir;  # the default is our home directory
    my @sorted = sort { -s $a <=> -s $b } glob '*';
    #print Dumper(@sorted);
}

sub data_for_path {
  my ($path, $level) = @_;
  if (-f $path or -l $path) {        # files or symbolic links
    return undef;
  }
  if (-d $path) {
    $level++;
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      print " "x$level.$path."/$name\n";
      $directory{$name} = data_for_path("$path/$name", $level);
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}
