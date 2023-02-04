#!/usr/bin/perl

use warnings;
use strict;
use File::Path qw(make_path);
use File::Basename qw(dirname);
use Cwd 'abs_path';


my ($src, $dst) = @ARGV;
my $dir = dirname(abs_path($0));

if (-d $dst) {
   $dst = "$dst/" . basename($src);
}

#my $pattern = "^\\.";
 
#if ($src =~ /$pattern/) {
#    $src =~ tr/.//;
#    $src = "$dir\\$src"
#}
#
#if ($dst =~ /$pattern/) {
#    $dst =~ tr/.//;
#    $dst = "$dir\\$dst"
#}

if (!make_path(dirname($dst))) {
   die "Cannot create directory " . dirname($dst) . ": $!";
}

make_path(dirname($dst)) or die "Cannot create directory " . dirname($dst) . ": $!";
open(my $fh, ">", $dst) or die "Cannot open $dst: $!";
close $fh;

open(my $src_fh, "<", $src) or die "Cannot open $src: $!";
open(my $dst_fh, ">", $dst) or die "Cannot open $dst: $!";

while (my $line = <$src_fh>) {
   print $dst_fh $line;
}

close $src_fh;
close $dst_fh;