#!/usr/bin/perl

use warnings;
use strict;

########################## one way  #########################
#my ($src, $dst) = @ARGV;

#if (-d $dst) {
 #  $dst = "$dst/$src";
#}

#rename($src, $dst) or die "Cannot move $src to $dst: $!";


########################## another way #########################
#use File::Copy;

#my ($source, $destination) = @ARGV;

#if (!copy($source, $destination)) {
 # die "Could not copy '$source' to '$destination': $!";
#}

#if (!unlink $source) {
#  die "Could not remove '$source': $!";
#}



########################## another way #########################


my $old_file = shift @ARGV;
my $new_file = shift @ARGV;

if (!defined $old_file || !defined $new_file) {
  print "Usage: mv.pl old_file new_file\n";
  exit;
}

if (! -e $old_file) {
  print "Error: $old_file does not exist\n";
  exit;
}

if (-e $new_file) {
  print "Error: $new_file already exists\n";
  exit;
}

open(my $old_fh, '<', $old_file) or die "Could not open $old_file: $!";
open(my $new_fh, '>', $new_file) or die "Could not open $new_file: $!";

while (my $line = <$old_fh>) {
  print $new_fh $line;
}

close $old_fh or die "Could not close $old_file: $!";
close $new_fh or die "Could not close $new_file: $!";

unlink $old_file or die "Could not remove $old_file: $!";

print "Moved $old_file to $new_file\n";