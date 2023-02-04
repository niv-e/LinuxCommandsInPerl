#!/usr/bin/perl

use warnings;
use strict;

my ($src, $dst) = @ARGV;

if (-d $dst) {
   $dst = "$dst/$src";
}

rename($src, $dst) or die "Cannot move $src to $dst: $!";
