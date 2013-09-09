#! /usr/bin/perl
use strict;
use warnings;
use File::Spec;
use Business::ISBN;
use Cwd;

sub ex1{
    my $curdir = getcwd; #same as below
    foreach my $file (glob (".* *")){
        # Concatenate one or more directory names and a filename to form a complete path ending with a filename
        print "    ", File::Spec->catfile($curdir, $file),"\n"; 
    }
    
}

sub ex2{
    use local::lib;
    use v5.14;
    use Module::CoreList;
    
    my @modules    = sort keys $Module::CoreList::version{5.014002};
    
    my $max_length = 0;
    foreach my $module ( @modules ) {
      $max_length = length $module if
        length $module > $max_length;
    }
    
    foreach my $module ( @modules ) {
      printf "%*s %s\n",
        - $max_length,
        $module,
        $Module::CoreList::released{ 
        	Module::CoreList->first_release( $module ) 
        	};
      }
}


sub ex3{
    my $isbnstr = "9781449393090";
    my $isbnobj = Business::ISBN->new($isbnstr);
    print "ISBN group code is ".$isbnobj->group_code()." and group name is ".$isbnobj->group()." and publisher code is ".$isbnobj->publisher_code().".\n";
}

&ex2();