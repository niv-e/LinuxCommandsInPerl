use POSIX;
use Getopt::Long;

my $file;
my $permission;

my $permission = shift @ARGV;
my $file = shift @ARGV;


# Get the current file permissions
my $current_permissions = (stat $file)[2] & 0777;

# Convert the permission argument to octal representation
my $mode = $current_permissions;
if ($permission =~ /^\+/) {
  $mode |= 0b100 if $permission =~ /x/;
  $mode |= 0b010 if $permission =~ /w/;
  if($permission =~ /r/){
    $mode |= 0b001;
  }
  #$mode |= 0b001 if $permission =~ /\.*r/;
} elsif ($permission =~ /^-/) {
  $mode &= ~0b100 if $permission =~ /x/;
  $mode &= ~0b010 if $permission =~ /w/;
  $mode &= ~0b001 if $permission =~ /r/;
}

# Change the file permissions
chmod $mode, $file or die "Could not change file permissions: $!";
