#!/usr/bin/perl

use strict;
use warnings;
use User::pwent;
use Crypt::PasswdMD5;

my $username = shift @ARGV;

if (!defined $username) {
  print "Invalid arguments\n";
  exit 1;
}

my $pw = getpwnam($username);

if (defined $pw) {
  print "User $username already exists\n";
  exit 1;
}

my $password = "*";
my $uid = 1000;
my $gid = 1000;
my $home_dir = "/home/$username";
my $shell = "/bin/bash";

my $enc_password = apache_md5_crypt($password);

my $pw_info = "$username:$enc_password:$uid:$gid:$username:/$home_dir:$shell\n";

my $file = "/etc/passwd";
open my $fh, '>>', $file or die "Cannot open $file: $!";
print $fh $pw_info;
close $fh;

print "User $username has been added\n";
exit 0;

