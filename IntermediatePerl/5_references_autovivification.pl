#! /usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

ex3();

sub ex3{
    my %total_bytes;
    while (<>) {
      next if(/^#/); #skip comments
      my ($source, $destination, $bytes) = split;
      $total_bytes{$source}{$destination} += $bytes;
    }
    for my $source (sort keys %total_bytes) {
      print "$source:\n";
      for my $destination (sort keys %{ $total_bytes{$source} }) {
        print "    $destination $total_bytes{$source}{$destination}\n";
          }
    }
}

sub ex2{
    my %total_bytes;
    while (<>) {
      next if(/^#/); #skip comments
      my ($source, $destination, $bytes) = split;
      $total_bytes{$source}{$destination} += $bytes;
    }
    for my $source (reverse sort {$total_bytes{$a} <=> $total_bytes{$b}} keys %total_bytes) {
      for my $destination (reverse sort {$total_bytes{$source}{$a} <=> $total_bytes{$source}{$b}} keys %{ $total_bytes{$source} }) {
        print "$source => $destination:",
         " $total_bytes{$source}{$destination} bytes\n";
          }
        print "\n";
    }
}


=begin ex1
Assigning a hash reference to a hash instead of a list

=cut
sub ex1{
    #wonder what this does - 
    #%passenger now has a key which is the hash reference and the value is undefined.
    my %passenger_1 = {
      name       => 'Ginger',
      age        => 22,
      occupation => 'Movie Star',
      real_age   => 35,
      hat        => undef,
    };
    print Dumper(\%passenger_1);
    #This doesn't work
    for my $key (keys %passenger_1){
        my $internal_hash_ref = $key;
        print Dumper (%$key);
    }


}




sub autovivification_test{
    my $bla;
    print "ref bla is ".((ref $bla)?ref $bla:"nothing")."\n";
    print "ref bla->{1} is ".((ref $bla->{1})?ref $bla->{1}:"nothing")."\n";
    print "ref bla->{1}->{2} is ".((ref $bla->{1}->{2})?ref $bla->{1}{2}:"nothing")."\n";
    print "ref bla->{1} is ".((ref $bla->{1})?ref $bla->{1}:"nothing")."\n";
    print "ref bla is ".((ref $bla)?ref $bla:"nothing")."\n";
}


#THIS PROVES that $ext{bla} NEEDS to be a hash ref for $ext{bla}{inte} to work
sub weird_hash_autovivification{
    my %ext = ('ext'=>'ext');
    my %inte = ('inte'=>'inte');
    $ext{bla} = %inte;
    print "ext{bla} is ".Dumper($ext{bla});
    print "ext{bla}{inte} is ".Dumper($ext{bla}{inte});
    
}