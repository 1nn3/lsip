use diagnostics;
use strict;
use utf8;
use warnings;

use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share dist => 'dist';

WriteMakefile(
    NAME         => 'App::nmap-wrapper',
    VERSION_FROM => 'lib/App/nmap-wrapper.pm',
    ABSTRACT     => 'A wrapper around the Nmap/Zenmap scanner',
    AUTHOR       => q{user <user@host>},
    MAN1PODS     => {
        'pod/lsip.pod'                   => '$(INST_MAN1DIR)/lsip.1p',
        'pod/lnmap.pod'                  => '$(INST_MAN1DIR)/lnmap.1p',
        'pod/ncrack-restore-session.pod' =>
          '$(INST_MAN1DIR)/ncrack-restore-session.1p',
        'pod/ncrack-wrapper.pod' => '$(INST_MAN1DIR)/ncrack-wrapper.1p',
        'pod/nmap-wrapper.pod'   => '$(INST_MAN1DIR)/nmap-wrapper.1p',
        'pod/lsip.pod'           => '$(INST_MAN1DIR)/lsip.1p',
        'pod/iplookup.pod'       => '$(INST_MAN1DIR)/iplookup.1p',
        'pod/ip2domain.pod'      => '$(INST_MAN1DIR)/ip2domain.1p',
        'pod/domain2ip.pod'      => '$(INST_MAN1DIR)/domain2ip.1p',
        'pod/is-offline.pod'     => '$(INST_MAN1DIR)/is-offline.1p',
        'pod/go-offline.pod'     => '$(INST_MAN1DIR)/go-offline.1p',
        'pod/is-online.pod'      => '$(INST_MAN1DIR)/is-online.1p',
        'pod/go-online.pod'      => '$(INST_MAN1DIR)/go-online.1p',
    },
    MAN3PODS  => { 'lib/App/lsip.pm' => '$(INST_MAN3DIR)/App::lsip.3pm', },
    #PM        => { 'lib/App/lsip.pm'  => '$(INST_LIBDIR)/lsip.pm', },
    EXE_FILES => [
        'bin/lsip',                   'bin/lnmap',
        'bin/ncrack-restore-session', 'bin/ncrack-wrapper',
        'bin/nmap-wrapper',
        'bin/lsip',
        'bin/iplookup',               'bin/iproute',
        'bin/list-remote-addresses',  'bin/watch-iproute',
        'bin/watch-remote-addresses', 'bin/ip2domain',
        'bin/go-offline',             'bin/domain2ip',
        'bin/is-offline',             'bin/is-online',
        'bin/go-online', 'bin/nmap-restore-session',
        'bin/read-addresses', 'bin/write-addresses',

    ],
    PREREQ_PM => {
        'Net::Netmask'          => undef,
        'IO::Interface::Simple' => undef,
        'Net::DNS'              => undef,
        'Geo::IP'               => undef,
        'Parse::Netstat'        => undef,
        'use Socket'            => undef,
    },
);

package MY;
use File::ShareDir::Install qw(postamble);

