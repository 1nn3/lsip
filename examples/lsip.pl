#!/usr/bin/env perl
# Zeigt IPv4-Adressen und verbundene Netzwerke an
use strict;
use feature 'say';
use IO::Interface::Simple;
use Net::Netmask;
for ( IO::Interface::Simple->interfaces ) {
    if ( !$_->address ) {
        warn $_, ': has no address';
        next;
    }
    if ( !$_->is_running ) {
        warn $_, ': is not running';
        next;
    }
    if ( $_->is_loopback ) {
        warn $_, ': is loopback';
        next;
    }
    my $block = Net::Netmask->new( $_->address, $_->netmask );
    say $block;
}

