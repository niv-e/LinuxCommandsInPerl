#!/usr/bin/perl

#ls Command structure: ls [ Options ] [File]

#This use statment import module, 
#which provides an object-oriented interface to file status information
use File::stat;
#use List::Util qw(grep);


#Get file path as command line argument of use the execution path

my ($dirPath, $options) = parse_options(@ARGV);

if(!(defined($dirPath))){
    $dirPath = '.';
}

opendir(my $dirhandler, $dirPath) or die "Cannot open directory: $!";

my @files = readdir($dirhandler);

my $showHidden; #-a
my $longFormat; #-l
my $reverseOrder; #-r

if(!(defined($options))){
    standard_print(@files);
    exit 0;
}

if($options =~ '-a'){
    print_with_hidden(@files);
    exit 0;
}

if($options =~ '-l'){
    print_with_longFormat($dirPath, @files);
    exit 0;
}

closedir($dirhandler);


sub standard_print{
    my @files = @_;
    $pattern = "^\\.";
 
     foreach my $file (@files) {
        if ($file !~ /$pattern/) {
            $file =~ tr/%20/ /;
            print "$file ";
        }
    }
    print "\n";
}

sub print_with_hidden{
    my @files = @_;
 
     foreach my $file (@files) {
        $file =~ tr/%20/ /;
        print "$file ";
    }
    print "\n";
}

sub print_with_longFormat{
    my ($dirPath,@files) = @_;
    my $numOfFile = scalar @files;
    print("$numOfFile\n");
    
    foreach (@files) {
        my $filename = "$dirPath/$_";
        my $file_info = stat($filename);

        if (!defined $file_info) {
            print "Could not get information for file $filename\n";
            next;
        }

        my $mode = $file_info->mode;
        my $permissions = sprintf("%04o", $mode & 07777);
        my $is_directory = (-d $filename);

        if ($is_directory) {
            print "d";
        } else {
            print "-";
        }

        print (($mode & 0400) ? 'r' : '-');
        print (($mode & 0200) ? 'w' : '-');
        print (($mode & 0100) ? 'x' : '-');
        print (($mode & 0040) ? 'r' : '-');
        print (($mode & 0020) ? 'w' : '-');
        print (($mode & 0010) ? 'x' : '-');
        print (($mode & 0004) ? 'r' : '-');
        print (($mode & 0002) ? 'w' : '-');
        print (($mode & 0001) ? 'x' : '-');
        print " " . $file_info->nlink . " ";
        print $file_info->uid . " ";
        print $file_info->gid . " ";
        print $file_info->size . " ";
        print scalar localtime($file_info->mtime) . " ";
        print "$_\n";
    }
}






sub parse_options{
    my (@params) = @_;
    my $dirPath;
    my $options;

    #shift @params;  # remove the first argument
    foreach my $arg (@params) {
		print("$arg\n");

        if(-d $arg && !(defined $dirPath)){
            $dirPath = $arg;
        }

        if($arg =~ /^-/ && !(defined $options)){
            $options = $arg;
        }
    }

    return ($dirPath, $options);
}
