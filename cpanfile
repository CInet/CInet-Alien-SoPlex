requires 'Modern::Perl', '>= 1.20180000';
requires 'Carp';

requires 'Path::Tiny';

on 'build' => sub {
    requires 'Alien::Build';
    requires 'CInet::Alien::GMPxx';
};

on 'test' => sub {
    requires 'bignum';
    requires 'IPC::Run3';
    requires 'Path::Tiny';
    requires 'Test::More';
    requires 'Test::Alien';
};
