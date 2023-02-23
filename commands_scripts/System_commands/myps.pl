#!/usr/bin/perl

use strict;
use warnings;

my $cmd = shift @ARGV || "";

if ($cmd eq "-e" ) {
  open my $ps, "ps $cmd |";
  while (<$ps>) {
    print;
  }
  close $ps;
} elsif ($cmd eq "-ef") {
  print "UID\tPID\tPPID\tC\tSTIME\tTTY\tTIME\t\tCMD\n";
  open my $ps, "ps $cmd |";
  while (<$ps>) {
    if ($. == 1) {
      next;
    }
    my @fields = split;
    print "$fields[0]\t$fields[1]\t$fields[2]\t$fields[3]\t$fields[4]\t$fields[5]\t$fields[6]\t$fields[7]\n";
  }
  close $ps;
} else {
  print "PID\tTTY\tTIME\tCMD\n";
  open my $ps, "ps |";
  while (<$ps>) {
    if ($. == 1) {
      next;
    }
    my @fields = split;
    print "$fields[0]\t$fields[1]\t$fields[2]\t$fields[3]\n";
  }
  close $ps;
}

