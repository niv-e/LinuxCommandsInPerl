#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my $interval = 5;
my $max_processes = 40;

sub get_process_info {
    my @process_info;
    my $process;

    open my $ps, "ps -eo pid,user,pcpu,pmem,etime,vsz,rss,comm,args --sort=-pcpu |" or die "Couldn't run ps command: $!";

    while (<$ps>) {
        my ($pid, $user, $cpu, $mem, $etime, $vsz, $rss, $comm, $args) = split /\s+/;
        $user =~ s/%//;

        push @process_info, {
            pid => $pid,
            user => $user,
            cpu => $cpu,
            mem => $mem,
            etime => $etime,
            vsz => $vsz,
            rss => $rss,
            comm => $comm,
            args => $args,
        };
    }

    close $ps;
    return @process_info;
}

while (1) {
    my @process_info = get_process_info();

    print "\033[2J"; # clear the screen
    print "\033[0;0H"; # move the cursor to 0,0

    for (my $i = 0; $i < $max_processes; $i++) {
        my $process = $process_info[$i];

        printf "%5s\t %-8s %5s%% %5s%% %10s %10s %10s %-15s %s\n",
            $process->{pid},
            $process->{user},
            ($process->{cpu} =~ /^\d+(\.\d+)?$/) ? sprintf("%.1f", $process->{cpu}) : $process->{cpu},
            ($process->{mem} =~ /^\d+(\.\d+)?$/) ? sprintf("%.1f", $process->{mem}) : $process->{mem},
            $process->{etime},
            $process->{vsz},
            $process->{rss},
            $process->{comm},
            $process->{args};
    }

    sleep $interval;
}

