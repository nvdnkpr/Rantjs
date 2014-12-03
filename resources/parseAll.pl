#!/usr/bin/perl
# Sven A Robbestad <anders@robbestad.com>
# This script run convert on all RantVocabs

undef $/;
$n = 0;
use strict;
use warnings;
my $directory = "./RantVocab";
opendir( DH, $directory );
my @files = readdir(DH);
closedir(DH);

my $allVars = "";

foreach my $file (@files) {
    next if ( $file =~ /^\.$/ ); # skip . and ..
    next if ( $file =~ /^\.git$/ ); # skip .git
    next if ( $file =~ /README+(.*)$/ ); # skip README
    next if ( $file =~ /^\.\.$/ );
    $file =~ s/\s/\\ /g;
    #print `ls ./RantVocab/$file`;
    print `perl parse.pl < ./RantVocab/$file`;
}
print `cat out/*.js > all.dic.js`;