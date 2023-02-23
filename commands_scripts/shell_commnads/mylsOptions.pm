use strict;
use warnings;
#This module provides a simple and flexible way to handle command line options and arguments.
use Getopt::Long;


sub parse_options{
    my ($params) = @_;
    my $dirPath;
    my $options;
    print($params);
    shift @params;  # remove the first argument
    foreach my $arg (@params) {
        if(-d $arg && !(defined $dirPath)){
            $dirPath = $arg;
            continue;
        }

        if($arg =~ /^-/ && !(defined $options)){
            $options = $arg;
        }
    }

    return ($dirPath, $options);
}