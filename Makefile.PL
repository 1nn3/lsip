use diagnostics;
use strict;
use utf8;
use warnings;

use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share dist => 'dist';

WriteMakefile(
    NAME          => 'App::lsip',
    ABSTRACT_FROM => 'pod/lsip.pod',
    VERSION_FROM  => 'bin/lsip',
    AUTHOR        => q{user <user@host>},
    MAN1PODS  => { 'pod/lsip.pod'    => '$(INST_MAN1DIR)/lsip.1p',
            'pod/iplookup.pod'   => '$(INST_MAN1DIR)/iplookup.1p',
        'pod/ip2domain.pod'  => '$(INST_MAN1DIR)/ip2domain.1p',
        'pod/domain2ip.pod'  => '$(INST_MAN1DIR)/domain2ip.1p',
        'pod/is-offline.pod' => '$(INST_MAN1DIR)/is-offline.1p',
        'pod/go-offline.pod' => '$(INST_MAN1DIR)/go-offline.1p',
        'pod/is-online.pod'  => '$(INST_MAN1DIR)/is-online.1p',
        'pod/go-online.pod'  => '$(INST_MAN1DIR)/go-online.1p',
   
     },
    MAN3PODS  => { 'lib/App/lsip.pm' => '$(INST_MAN3DIR)/App::lsip.3pm', },
    EXE_FILES => [ 'bin/lsip',
            'bin/iplookup',               'bin/iproute',
        'bin/list-remote-addresses',  'bin/watch-iproute',
        'bin/watch-remote-addresses', 'bin/ip2domain',
        'bin/go-offline',             'bin/domain2ip',
        'bin/is-offline',             'bin/is-online',
        'bin/go-online', ],
    PREREQ_PM => {
        'IO::Interface::Simple' => undef,
        'Net::Netmask'          => undef,
        'Net::DNS'              => undef,
        'Geo::IP'               => undef,
        'Parse::Netstat'        => undef,
        'IO::Interface::Simple' => undef,
        'Net::Netmask'          => undef,
        'Parse::Netstat'        => undef,
        'use Socket'            => undef,
    }
);

package MY;
use File::ShareDir::Install qw(postamble);

