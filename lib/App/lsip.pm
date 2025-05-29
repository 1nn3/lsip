package App::lsip {
    use strict;
    use warnings;

    use Geo::IP;
    use Net::DNS;
    use List::Util;

    our $NAME    = 'App-lsip';
    our $VERSION = '1.00';

    sub dns_reverse_look_up {
        my ($ip) = @_;
        my $res = Net::DNS::Resolver->new;
        my @dns_names;
        my $reply = $res->query( $ip, "PTR" );
        if ($reply) {
            foreach my $rr ( $reply->answer ) {
                push @dns_names, $rr->rdatastr;
            }
        }
        else {
            @dns_names = ( $res->errorstring );
        }
        return join( " ", List::Util::uniq( sort(@dns_names) ) );
    }

    sub geoip_look_up {
        my ($ip) = @_;

        my $gi = Geo::IP->open( '/usr/share/GeoIP/GeoIPCity.dat',
            Geo::IP::GEOIP_STANDARD | Geo::IP::GEOIP_MEMORY_CACHE );

        my $record = $gi->record_by_addr($ip);
        if ($record) {

            my $post_address = sprintf( "%s %s %s",
                $record->postal_code || "",
                $record->city        || "",
                $record->region_name || "",
            );

            #$post_address = trim($post_address);

            return sprintf(
                "%s, %s\t%s\t%s %s",
                $record->country_code || "",
                $record->country_name || "",
                $post_address,
                $record->latitude  || "",
                $record->longitude || "",
            );
        }
        else {
            return "N/A";
        }
    }

    1;
}

