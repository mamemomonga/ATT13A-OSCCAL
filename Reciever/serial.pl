#!/usr/bin/env perl
use feature qw( say );
use utf8;
use strict;
use warnings;
binmode(STDIN, ':utf8');
binmode(STDOUT,':utf8');
binmode(STDERR,':utf8');
$|=1;
 
use FindBin;
use lib "$FindBin::Bin/local/lib/perl5";
 
use Device::SerialPort;

unless($ARGV[0]) {
	say "USAGE: $0 DEVICE";
	exit;
}


my $portobj=Device::SerialPort->new($ARGV[0]) || die "Can't open serial $ARGV[0]";
$portobj->baudrate(38400);
$portobj->write_settings;

my $buffer='';

while(1) {
	my($count,$buf)=$portobj->read(1);
	$buffer.=$buf;
	if($buf eq "\n") {
		if($buffer=~/\Q*****\E OSCCAL=\d+ \Q*****\E/) {
			print $buffer;
		}
		$buffer="";
	}
}

