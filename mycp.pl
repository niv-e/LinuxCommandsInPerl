#!/usr/bin/perl

use warnings;
use strict;

my ($src, $dst) = @ARGV;

open(my $src_fh, "<", $src) or die "Cannot open source file: $src: $!";
open(my $dst_fh, ">", $dst) or die "Cannot open destination file: $dst: $!";

while (my $line = <$src_fh>) {
   print $dst_fh $line;
}

close($src_fh);
close($dst_fh);
