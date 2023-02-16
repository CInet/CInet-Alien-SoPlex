use strict;
use warnings;
use Test::More;
use Test::Alien;

use CInet::Alien::SoPlex;

alien_ok 'CInet::Alien::SoPlex';
run_ok([CInet::Alien::SoPlex->exe, '--version'])
    ->success
    ->out_like(qr/SoPlex version ([0-9.a-z]+)/);

done_testing;
