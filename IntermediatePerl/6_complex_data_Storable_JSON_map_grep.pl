#!/usr/bin/perl

use warnings;
use strict;
use Storable;
use JSON;
use Data::Dumper;


ex2();

sub ex1{
    my $data_file = "total_bytes.data";
    my %total_bytes; 
    # Make the file if it doesn't exist
    if(-f $data_file){
        %total_bytes = %{Storable::retrieve($data_file)};
    }        
    
    while (<>) {
      next if(/^#/); #skip comments
      my ($source, $destination, $bytes) = split;
      $total_bytes{$source}{$destination} += $bytes;
    }
    Storable::nstore(\%total_bytes,$data_file);
    print "With Storable:\n============\n";
    for my $source (sort keys %total_bytes) {
      print "$source:\n";
      for my $destination (sort keys %{ $total_bytes{$source} }) {
        print "    $destination $total_bytes{$source}{$destination}\n";
          }
    }
}

sub ex2{
    my $data_file = "total_bytes.json";
    my %total_bytes; 
    # Make the file if it doesn't exist
    if(-f $data_file){
        open FH, '<:raw', $data_file;
        my $data = <FH>;
        %total_bytes = %{from_json($data)};
        close FH;
    }        
    
    while (<>) {
      next if(/^#/); #skip comments
      my ($source, $destination, $bytes) = split;
      $total_bytes{$source}{$destination} += $bytes;
    }
    open FH, '>:utf8', $data_file;
    print FH to_json(\%total_bytes, { pretty => 1 });
    close FH;
    print "With JSON:\n============\n"; 
    for my $source (sort keys %total_bytes) {
      print "$source:\n";
      for my $destination (sort keys %{ $total_bytes{$source} }) {
        print "    $destination $total_bytes{$source}{$destination}\n";
          }
    }
}