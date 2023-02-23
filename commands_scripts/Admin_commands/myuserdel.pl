#!/usr/bin/perl

use strict;
use warnings;
use User::pwent;

my $username = shift @ARGV;
if (!defined $username) {
  print "Usage: $0 username\n";
  exit 1;
}

my $user = getpwnam($username);
if (!defined $user) {
  print "User $username does not exist\n";
  exit 1;
}

# Delete the user's home directory if it exists
if (-d $user->dir) {
  system("rm", "-rf", $user->dir);
}

# Remove the user's entry from the password file
system("userdel", $username);

print "User $username has been deleted\n";
exit 0;

