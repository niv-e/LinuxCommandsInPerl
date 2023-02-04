#!/usr/bin/perl

use warnings;
use strict;

my $file = $ARGV[0];
my ($word_count, $byte_count, $line_count) = (0, 0, 0);

open(my $fh, "<", $file) or die "Cannot open file: $file: $!";

while (my $line = <$fh>) {
   $line_count++;
   $byte_count += length($line);
   $word_count += scalar(split(/\s+/, $line));
}

print "Lines: $line_count\n";
print "Words: $word_count\n";
print "Bytes: $byte_count\n";

close($fh);