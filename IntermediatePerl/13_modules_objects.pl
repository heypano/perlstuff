#!/usr/bin/perl

use strict;
use warnings;

my $whatIDidWas = <<'THISTHING'; #Heredoc with single quotes means interpolation goes away

=================================
What I did was:
=================================

cd ~/checkouts/LearningPerl/IntermediatePerl/12_module;
module-starter --module=Cow,Horse,Sheep --dist=./Animal
#Made the file scripts/pasture with the code that's in it
perl -Ilib scripts/pasture
THISTHING

print $whatIDidWas;