#!/usr/bin/perl

use MooseCow;
use MooseHorse;
use MooseMouse;
use MooseRacer;
use MooseRaceHorse;

my $cow = MooseCow->new({name => "Elsie"});
my $horse = MooseHorse->new({name => "Mario"});
my $mouse = MooseMouse->new({name => "Fernando", anxiety => 0});
my $racehorse = MooseRaceHorse->new({name => "Abdhul"});
my $racer = MooseRacer->new({name => "Pete", sound => "what?"});

my @farm = ($cow,$horse,$mouse,$racehorse,$racer);

for my $animal (@farm){
    $animal->summarize;
}
