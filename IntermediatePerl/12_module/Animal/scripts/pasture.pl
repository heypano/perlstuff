#! /usr/bin/perl

use Cow;
use Horse;
use Sheep;
use Mouse;
use Data::Dumper;

=comment old way
my @pasture = qw(Cow Cow Horse Sheep Sheep);
foreach my $beast (@pasture) {
  no strict 'refs';
  &{$beast."::speak"};                # Symbolic coderef
}
=cut
print "Gimme comma separated animals\n";
chomp(my $animals = <STDIN>);
my @animals = split(',',$animals);
@animals = map {trim(\$_)} @animals;

for my $beast(@animals){
    $beast->speak;
}


sub trim{
    my ($string_ref) = @_;
    $$string_ref =~ s/^\s+//;
    $$string_ref =~ s/\s+$//;
    return $$string_ref;
}