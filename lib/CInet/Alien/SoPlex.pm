=encoding utf8

=head1 NAME

CInet::Alien::SoPlex - The LP solver SoPlex

=cut

# ABSTRACT: The LP solver SoPlex
package CInet::Alien::SoPlex;
use base qw(Alien::Base);

=head1 SYNOPSIS

    use IPC::Run3;
    use CInet::Alien::SoPlex qw(soplex);

    # Compute exact rational solution to linear program
    run3 [soplex, '-f0', '-o0', '-l0', '-X', $lp_file], \undef, \my $out;


=head2 VERSION

This document describes CInet::Alien::SoPlex v1.0.2.

=cut

our $VERSION = "v1.0.2";

=head1 DESCRIPTION

This module builds a statically linked C<soplex> executable. SoPlex is a
solver for linear programming (LP) problems which is able to return exact
rational solutions to rational LPs. Therefore it can in particular be used
to B<certify> whether or not a polyhedron defined by rational inequalities
is empty, either by giving a rational point inside or a rational Farkas
certificate.

The package C<CInet::Alien::SoPlex> is an L<Alien::Base> with one
additional method:

=head2 exe

    my $program = CInet::Alien::SoPlex->exe;

Returns the absolute path of the C<soplex> executable bundled with
this module.

=head1 EXPORTS

There is one optional export:

=head2 soplex

    use CInet::Alien::SoPlex qw(soplex);
    my $program = soplex;

Returns the same path as C<exe> but is shorter to type.

=cut

use Path::Tiny;

our @EXPORT_OK = qw(soplex);
use Exporter qw(import);

sub exe {
    my $self = shift;
    path($self->dist_dir, 'bin', $self->runtime_prop->{exename});
}

sub soplex {
    __PACKAGE__->exe
}

=head1 SEE ALSO

=over

=item *

The SoPlex website is L<https://soplex.zib.de/index.php>.
SoPlex is part of the L<SCIP optimization suite|https://scipopt.org/>
developed at Zuse Institute Berlin. See the article L<The SCIP Optimization suite|https://nbn-resolving.de/urn:nbn:de:0297-zib-69361>
and cite it if your work relies on it.

=item *

If you use SoPlex as an exact rational LP solver, you should cite
in addition L<Improving the Accuracy of Linear Programming Solvers with Iterative Refinement|https://nbn-resolving.de/urn:nbn:de:0297-zib-15451>
and L<Iterative Refinement for Linear Programming|https://nbn-resolving.de/urn:nbn:de:0297-zib-55118>.

=back

=head1 AUTHOR

Tobias Boege <tobs@taboege.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (C) 2023 by Tobias Boege.

This is free software; you can redistribute it and/or
modify it under the terms of the Artistic License 2.0.

=head2 Bundled software

This software distribution contains a source code archive of SoPlex v7.1.1,
which is Copyright (C) 2002-2024 Zuse Institute Berlin. It is released under
the Apache 2.0 license.

=cut

":wq"
