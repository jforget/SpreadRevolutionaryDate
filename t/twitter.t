#!/usr/bin/perl
use utf8;

BEGIN {
    $ENV{OUTPUT_CHARSET} = 'UTF-8';
}
use open qw(:std :encoding(UTF-8));
binmode(DATA, ":encoding(UTF-8)");

use Test::More tests => 2;
use Test::NoWarnings;
use Test::Output;
use File::HomeDir;

use App::SpreadRevolutionaryDate;

@ARGV = ('--test', '--twitter');
my $spread_revolutionary_date = App::SpreadRevolutionaryDate->new(\*DATA);

stdout_like { $spread_revolutionary_date->spread } qr/Diffusé sur Twitter : Nous sommes le/, 'Spread on Twitter';

__DATA__

[twitter]
# Get these values from https://apps.twitter.com/
consumer_key        = 'ConsumerKey'
consumer_secret     = 'ConsumerSecret'
access_token        = 'AccessToken'
access_token_secret = 'AccessTokenSecret'
