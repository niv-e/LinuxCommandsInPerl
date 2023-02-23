#!/usr/bin/perl

use strict;
use warnings;


my $mode = shift;
my $file = shift;


if (!defined $file || !defined $mode) {
    print "Usage: $0 file mode\n";
    exit 1;
}

if ($mode !~ /^([ugoa]*)([+-])([rwx]+)/) {
    print "Invalid mode\n";
    exit 1;
}

my ($users, $operation, $permissions) = ($1, $2, $3);
my $mode_bits = 0;

if ($permissions =~ /r/) {
    $mode_bits |= 0b100;
}

if ($permissions =~ /w/) {
    $mode_bits |= 0b010;
}

if ($permissions =~ /x/) {
    $mode_bits |= 0b001;
}

$users = 'ugo' if !$users;

my @files = ();
if (-d $file) {
    opendir(my $dh, $file) || die "Can't open $file: $!";
    @files = readdir $dh;
    closedir $dh;
} else {
    push @files, $file;
}

foreach my $file (@files) {
    my @stat = stat $file;
    my $cur_mode = $stat[2] & 07777;

    if ($users =~ /u/) {
        if ($operation eq '+') {
            $cur_mode |= ($mode_bits << 6);
        } else {
            $cur_mode &= ~($mode_bits << 6);
        }
    }
    if ($users =~ /g/) {
        if ($operation eq '+') {
            $cur_mode |= ($mode_bits << 3);
        } else {
            $cur_mode &= ~($mode_bits << 3);
        }
    }
    if ($users =~ /o/) {
        if ($operation eq '+') {
            $cur_mode |= $mode_bits;
        } else {
            $cur_mode &= ~$mode_bits;
        }
    }

    chmod $cur_mode, $file;
}