#!/usr/bin/perl

# specify the filename to tail
my $filename = shift @ARGV;

# specify the number of lines to display (default to 10)
my $num_lines = shift @ARGV || 10;

# open the file for reading
open (FILE, "<", $filename) or die "Unable to open file: $!\n";

# read the file into an array
my @lines = <FILE>;

# determine the starting index for the tail
my $start_index = $#lines - $num_lines + 1;
$start_index = 0 if $start_index < 0;

# display the tail of the file
print @lines[$start_index .. $#lines];

# close the file
close FILE;

