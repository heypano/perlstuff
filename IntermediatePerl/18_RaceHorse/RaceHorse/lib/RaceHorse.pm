package RaceHorse;

use 5.006;
use strict;
use warnings FATAL => 'all';
use parent qw/Horse/;
use Storable qw/nstore retrieve/;
use Data::Dumper;
=head1 NAME

RaceHorse - The great new RaceHorse!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use RaceHorse;

    my $foo = RaceHorse->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 named

=cut

## extend parent constructor:
sub named {
  my $self = shift->SUPER::named(@_);
  $self->{$_} = 0 for qw(wins places shows losses);
  my $old = $self->get_from_memory;
  print "New Race horse named @_\n";
  print "Old horse is:\n";
  print Dumper($old);
  
  $self;
}
sub won { shift->{wins}++; }
sub placed { shift->{places}++; }
sub showed { shift->{shows}++; }
sub lost { shift->{losses}++; }
sub standings {
  my $self = shift;
  join ', ', map "$self->{$_} $_", qw(wins places shows losses);
}

sub set_won{$_[0]->{wins} = $_[1];$_[0];}
sub set_places{$_[0]->{places} = $_[1];$_[0];}
sub set_shows{$_[0]->{shows} = $_[1];$_[0];}
sub set_losses{$_[0]->{losses} = $_[1];$_[0];}
sub set_all{
    my ($self, $wins, $places, $shows, $losses) = @_;
    $self->set_won($wins);
    $self->set_places($places);
    $self->set_shows($shows);
    $self->set_losses($losses);
    return $self;
}
sub get_from_memory{
    my $self = shift;
    my $path = $self->getFilePath;
    print "Getting ".(ref $self)." from $path\n";
    if(-f $path){
        return retrieve($path);
    }
    else{
        return undef;
    }
}

sub getFilePath{
    my $self = shift;
    my $name = $self->get_name;
    if(! -d 'racehorses'){
        mkdir 'racehorses';
    }
    return "racehorses/$name.txt";
}

sub store_to_memory{
    my $self = shift;
    my $path = $self->getFilePath;
    print "Storing ".(ref $self)." to $path\n";
    nstore \$self, $path;
}

sub DESTROY{
    my $self = shift;
    my $name = $self->get_name;
    $self->store_to_memory;
    print "RIP $name.\n";
}
=head1 AUTHOR

Pano Papadatos, C<< <pano at heypano.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-racehorse at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=RaceHorse>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc RaceHorse


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=RaceHorse>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/RaceHorse>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/RaceHorse>

=item * Search CPAN

L<http://search.cpan.org/dist/RaceHorse/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Pano Papadatos.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of RaceHorse
