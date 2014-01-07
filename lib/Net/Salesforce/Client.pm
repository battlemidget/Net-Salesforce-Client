package Net::Salesforce::Client;

use Mojo::Base -base;
use Mojo::UserAgent;
use Mojo::JSON;
use Mojo::URL;
use Class::Load ':all';
use DDP;

our $VERSION = '0.01';

has 'access_token';

has 'api_url' => sub {
    my $self = shift;
    return Mojo::URL->new(
        'https://na15.salesforce.com/services/data/v27.0/sobjects');
};

has 'json' => sub {
    my $self = shift;
    return Mojo::JSON->new;
};

has 'ua' => sub {
    my $self = shift;
    my $ua   = Mojo::UserAgent->new;
    $ua->transactor->name("Net::Salesforce/$VERSION");
    return $ua;
};

sub get {
    my ($self, $url) = @_;
    my $tx =
      $self->ua->get(
        $url->to_string => {Authorization => "Bearer " . $self->access_token}
      );
    p $tx->req->headers;
    die($tx->error) unless $tx->success;
    return $tx->res->body;
}

sub model {
    my ($self, $class) = @_;
    my $model = "Net::Salesforce::Model::$class";
    return load_class($model)->new($self);
}

1;

__END__

=encoding utf-8

=head1 NAME

Net::Salesforce::Client - Salesforce.com client utilities

=head1 SYNOPSIS

  use Net::Salesforce::Client;

=head1 DESCRIPTION

Net::Salesforce::Client is a perl interface to Salesforce.com JSON api.

=head1 ATTRIBUTES

=head2 access_token

Access token received from authenticating with L<Net::Salesforce>.

=head2 api_url

Salesforce API url for accessing sobjects

=head2 ua

A L<Mojo::UserAgent> object.

=head2 json

A L<Mojo::JSON> object.

=head1 METHODS

=head2 model

Select model namespace you wish to query, e.g. 'Account'

=head1 AUTHOR

Adam Stokes E<lt>adamjs@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2014- Adam Stokes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
