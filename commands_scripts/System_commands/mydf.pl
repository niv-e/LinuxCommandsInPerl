#!/usr/bin/perl

use strict;
use warnings;

my $human_readable = 0;

# Check if the -h option was passed
if (@ARGV && $ARGV[0] eq "-h") {
    $human_readable = 1;
}

my @df_output = `df -h` if $human_readable;
@df_output = `df` if !$human_readable;

# Remove the first line, which contains the headers
shift @df_output;

# Add a header line with the topics of each column
if ($human_readable) {
    print "Filesystem\tSize\tUsed\tAvailable\tused%\tMounted on\n";
} else {
    print "Filesystem\t1K-blocks\tUsed\tAvailable\tused%\tMounted on\n";
}

foreach my $line (@df_output) {
    # Split the line into columns
    my @columns = split /\s+/, $line;

    # Get the values for each column
    my $filesystem = $columns[0];
    my $size = $columns[1];
    my $used = $columns[2];
    my $available = $columns[3];
    my $percent_used = $columns[4];
    my $mount_point = $columns[5];

    # Print the values
    print "$filesystem\t$size\t$used\t$available\t$percent_used\t$mount_point\n";
}

