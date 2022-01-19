#!/bin/perl -w 

## Command line 
perl -ne 'print if /\d+/' <filename>
	-e: command line execution
	-n: loops through the file like "while(<>)..."

## -pe option prints all lines 
perl -pe 's/ADC_pdnb.*b/ADC_pdnb\t\t=1\047b0/' <file>

# Execites command for each *.dat
perl -e 'while(<*.dat>){system(command) }'

use Getopt::Long; 	# Library for getting command line options
use Cwd;
use strict;

# Usage 
my @help = <<HELP;
NAME 
USAGE 
OPTIONS

HELP

### Variable declaration
my %hashop = ();
my $i =0;
my $oper='';
my @mosop = ();
my @mos_op_pat = ( 'subckt', 'model', 'element', 'id');
my @num = (23, 40, 30);
my @mixed = ('camel', 40, 1.234);
my %mos_cnt=('subckt' => 0, 'model'=>0);
my @sorted = sort @mos_op_pat;
my @reverse = reverse @mos_op_pat;
my $flag;

## Command line options
GetOptions("flag"=> \$flag, "floating=f" => \$floatvar,
		"string=s" => \@string_array);

## Print usage if no arg
my $help=1 unless @ARGV;
if($help){print @help; exit;}

##Filehandles:
open(SESAME, "filename");	# read from file
open(SESAME, "<filename");	# read from file
open(SESAME, ">filename");	# write to file
open(SESAME, ">>filename");	# append to file
open(SESAME, "filename") || die "can't open file $filename";
open(SESAME, "| output-pipe-command");
open(SESAME, "input-pipe-command |");
chop($number = <STDIN>);	# input number and remove newline
my $currDir = cwd();
my $homeDir = (getpwuid($UID))[7];
$login = getlogin();
$info = `finger $user`;

## Rading ONE line of inpur from STDIN
$oneLine = <STDIN>;

##Rading present data and time 
use POSIX
my $dateTimeNow = POSIX::strftime("%m%d%y_%Hh%Mm", localtime()); 

print grep { !/db$/ } `lst`;	# I think this should list all files not ending in "db"

@array = split(/\|/, $list);

##File test operators:
-e $a	# if exists
-r $a	# if readable
-w $a	# if writable
-d $a	# if directory
-f $a	# if a regular file (ie, not directory or device)
-T $a	# if text file
unless is the opposite of if.

#Conditinal Statements
$bitVal = $bitVal eq "V2V" ? 1 : 0;

while (<SESAME>) {
  print if /http:/;
}
	OR
while (<>){
}
	OR
while ($line = <FILE>) {
  if ($line =~ /http:/) {
    print $line;
  }
}
while (<*.c>) {
  chmod 0644, $_;	# chmods all files ending in .c in current directory.
}

while (<data/*.dat>){
	open(FILE, $_);
	while(<FILE>){}
}
unlink <*.bak>		# removes all files ending in .bak in current directory

## Subroutine defination
sub upcase{
	for (@_) {tr/a-z/A-Z/}
}

sub scient {
	my $val = shift;
	if ($val =~ /[^a-z]g/i)	{ $val =~ s/g/E+9/i; $val+=0.0;return $val;}
	return $val;
}

sub tospi{
	my $num = $_[0]+0.0;
	if ($num >= 1e+9) { $_[0] = sprintf("%5.1fG",($num/1e9)); return;}
	return;
}

## Regular expressions

# a? = match 'a' 1 or 0 times 
# a* = match 'a' 0 or more times, i.e., any number of times 
# a+ = match 'a' 1 or more times, i.e., at least once 
# a{n,m} = match at least n times, but not more than m times. 
# a{n,} = match at least n or more times 
# a{n} = match exactly n times 
##
## Here are some examples: 
/[a-z]+\s+\d*/;  # match a lowercase word, at least some space, and 
		 # any number of digits (\d -> digits, \s -> space
		 #			 \S -> any non-space char.)
/(\w+)\s+\1/;    # match doubled words of arbitrary length
/y(es)?/i;       # matches 'y', 'Y', or a case-insensitive 'yes'
$year =~ /\d{2,4}/;  # make sure year is at least 2 but not more
                     # than 4 digits
$year =~ /\d{4}|\d{2}/;    # better match; throw out 3 digit dates
$year =~ /\d{2}(\d{2})?/;  # same thing written differently. However,
                           # this produces $1 and the other does not.

#    % simple_grep '^(\w+)\1$' /usr/dict/words   # isn't this easier?
#    beriberi
#    booboo
#    coco
#    mama
#    murmur
#    papa  

## Some more examples

if ($line =~ /\b$pattern\b/)	## Matches stand alone pattern
if ($line =~ /$pattern\b/)	## Matches stand alone or end of string
if ($line =~ /\b$pattern/)	## Matches stand alone or begin of string
if ($line !~ /\b$pattern\b/)	## DOES NOT match stand alone pattern
if ($line !~ /^\s*$/))		## is NOT a blank line 
if ($line =~ /^[^\+]/) 	# If line does NOT begin with +
/<(.*?).*?<\/\1>/ 	#will match an HTML tag like <B>Bold<\B>
			#The ? forces nongreedy matching.
			#The \1 matches the stuff within the first ().
s/(\S+)\s+(\S+)/$2 $1/ 	#will swap the first two words of a string.
s/.(.)/\1\1/		# reads the second character and creates 
			# two character by repeating the second one 
			# eg. sf -> ff

# Captures everything between VDD= and | and assigns to $id
/VDD=(.*)\|/
$id = $1;
OR
($id) = $_ =~ /VDD=(.*)\|/; #it's important to have $id in the brackets

# Parsing example
($1,$2) = $string =~ /(.*)(\/)/
#lower ot upper case
$var1 =~ tr/a-z/A-Z/;

#To scale all ad and as (case insensitive) by $scale^2:
s/(\b(ad|as)[ ]*=[ ]*)([0-9]+\.?[0-9]*)/$1 . $3*$scale*$scale/eig;

## number of elements n an array 
for ($i=0; $i < (scalar @array);$i++){}
for ($i=0; $i < $#array;$i++){} 	# Another way

# No lines starting with comments (//), with spaces, or empty.
if((/^\/\//) || (/^ /) || (/^$/)) { next; }
## Initializing an array to zero
foreach $patt (@mos_op_pat){ $mos_op_cnt{$patt}=0; }
# Tesing the presence of a key in a hash
if (exists($hash{$key})){}
elsif (){}
else {}

## Jumping and spliting properly
LINE: foreach $line (@inlines){
	chomp($line);
	$_ = $line;
	($first,@rest)= split; 	# See scratch book Page-1
	next LINE;		# Jump to LINE
	next if $resource[$line] =~ m/^#/;	  # Comment line
	last if ($resource[$line] =~ m/\s+\=/);
}

foreach my $key (keys %modelist) {
   $mode =~ m/^$key$/i;
   if ( $var1 || $var2
	   || $var3) { 	# Continuation of a line 
      $matchFound = 1;
      $mode = $key;
      @ext_list = @{$modelist{$key}};
      last;
   }
}

if ($var ne " "){}
if ($var eq ""){}

## String operation
####################
print $a . ' is equal to ' . $b . "\n";
print $a, ' is equal to ', $b, "\n";
print "$a is equal to $b\n";

.	string concatenation
x	repeat operator

$a = 123;
$b = 3;
print $a x $b;	# prints 123123123
$line .= "\n";		# append newline to $line
$a++;			# autoincrement
$match_string = join(" ", ($match_string, $resource[$line]));

## MAth operations
$val**2 # Square
$val**0.5 # square root.

