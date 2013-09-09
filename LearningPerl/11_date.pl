#!/usr/bin/perl
use Time::Piece;
use Data::Printer;
use Data::Dumper;
use Module::CoreList;
use DateTime;

my $dt1 = DateTime->from_epoch( epoch => time );
#p($dt1) ;
#print Dumper($dt);
#use CGI qw(:all);
#my $t = localtime;


#Exercise 1
#my %modules = %{ $Module::CoreList::version{5.014}};

#print join "\n", keys %modules;

#Exercise 2
die "Call with year month date\n" if(@ARGV != 3);

my ($year,$month,$day)=@ARGV;
my $dt2 = DateTime->new( 
     year       => $year,
     month      => $month,
     day        => $day,
     );
my $timePast = $dt1-$dt2;
my @units = $timePast->in_units( qw(years months days) );
    
printf "%d years, %d months, and %d days have passed\n", @units;

