#!/usr/bin/perl

use strict;
use warnings;

my $whatIDidWas = <<'THISTHING'; #Heredoc with single quotes means interpolation goes away

=================================
What I did was:
=================================
 
sudo cpan Module::Starter;
mkdir ~/.module-starter/;
echo -e "Author: Pano Papadatos\nemail: pano@heypano.com\nbuilder: Module::Build\nverbose: 1\nplugins: Module::Starter::AddModule" > ~/.module-starter/config;
cd ~/checkouts/LearningPerl/IntermediatePerl/;
mkdir 12_module;
cd 12_module;
module-starter -module=Animal;
cd Animal;
perl Build.PL;
./Build;
./Build test;
./Build disttest;
./Build dist;
perl Makefile.PL;
make;
sudo make install;

THISTHING

print $whatIDidWas; 