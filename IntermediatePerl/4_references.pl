#! /usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

#isEquiv();
#test();
ex_3();

sub ex_3{
    my %gilligan_info = (
      name     => 'Gilligan',
      hat      => 'White',
      shirt    => 'Red',
      position => 'First Mate',
    );
    my %skipper_info = (
      name     => 'Skipper',
      hat      => 'Black',
      shirt    => 'Blue',
      position => 'Captain',
    );
    my @crew = (\%gilligan_info, \%skipper_info);
    $_->{location} = "The Island" for (@crew);
    
    
    my $print_roster = sub {
        my $crew = shift;
        my $format = "%-15s %-7s %-7s %-15s %-20s\n";
        printf $format, qw(Name Shirt Hat Position Location);
        foreach my $crewmember (@$crew) {
          printf $format,
            $crewmember->{'name'},
            $crewmember->{'shirt'},
            $crewmember->{'hat'},
            $crewmember->{'position'},
            $crewmember->{'location'};
        }
    };
    &$print_roster(\@crew);
}

sub ex_2{
    my @gilligan  = qw(blue_shirt hat jacket water_bottle sunscreen);
    my @skipper   = qw(blue_shirt hat preserver sunscreen water_bottle);
    my @professor = qw(blue_shirt hat jacket preserver sunscreen);
    
    my %all = (
      Gilligan  => \@gilligan,
      Skipper   => \@skipper,
      Professor => \@professor,
    );
    
    check_items_for_all(\%all); 
    print Dumper(%all);
}


sub check_items_for_all{
    my $hash_ref = shift;
    for my $key (keys %$hash_ref){
        check_required_items($key,$hash_ref->{$key});
    }
}


sub check_required_items {
  my $who   = shift;
  my $items = shift;

  my %whose_items = map { $_, 1 } @$items;

  my @required = qw(preserver sunscreen water_bottle jacket);
  my @missing = (  );

  for my $item (@required) {
    unless ( $whose_items{$item} ) { # not found in list?
      print "$who is missing $item.\n";
      push @missing, $item;
    }
  }

  if (@missing) {
    print "Adding @missing to @$items for $who.\n";
    push @$items, @missing;
  }
}


#ex1
=begin comment

$ext_arr−>[2][1]
$ext_arr is an array reference. 
The array inside it contains an array reference at [2]. 
This expression refers to the first element of the array in that reference

${$ext_arr[2]}[1]
@ext_arr is an array with an array reference at [2].
This expression refers to the first element of the array in that reference


$ext_arr−>[2]−>[1]
Same as the first one (you can drop the -> s)

${$ext_arr−>[2]}[1]
Same as the first one ${$ext_arr−>[2]}[1] becomes $ext_arr->[2]->[1] which becomes $ext_arr->[2][1]


=cut


sub isEquiv{
    my @int_arr = (1,2,3);
    my @int_arr_2 = (4,5,6);
    my $int_arr_ref = \@int_arr;
    my $int_arr_2_ref = \@int_arr_2;
    my @ext_arr = (@int_arr, @int_arr_2); #THIS JUST MAKES A BIG ARRAY
    my $ext_arr_ref = \@ext_arr;
    print "internal arrays are not references: \n";
    print @ext_arr;
    print "\n";
    @ext_arr = ($int_arr_ref, $int_arr_2_ref);
    #Is this line necessary?
    #my $ext_arr_ref = \@ext_arr;
    print "internal arrays are references: \n".$ext_arr_ref->[1][1]."\n";
}


sub test{
    my @arr = qw/one two three/;
    print "Before dereference_edit @arr\n";
    dereference_edit(\@arr);
    print "After dereference_edit @arr\n";
    reference_edit(\@arr);
    print "After reference edit @arr\n";
    
}



# Editing after dereferencing (this doesn't work)
sub dereference_edit{
    my @arr = @{$_[0]};
    push(@arr,'four');
    print "deference_edit local coppy @arr\n";
}

#Editing without dereferencing
sub reference_edit{
    my $arrref = $_[0];
    $$arrref[0] = 'one_edited';
    push(@$arrref,'five');
}