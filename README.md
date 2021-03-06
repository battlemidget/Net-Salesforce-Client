# NAME

Net::Salesforce::Client - Salesforce.com client utilities

# SYNOPSIS

    use Net::Salesforce::Client;

# DESCRIPTION

Net::Salesforce::Client is a perl interface to Salesforce.com JSON api.

# ATTRIBUTES

## access\_token

Access token received from authenticating with [Net::Salesforce](https://metacpan.org/pod/Net::Salesforce).

## api\_version

Current supported API version from Salesforce

## api\_host

Salesforce domain where your application lives, e.g. Developer force usually uses

    https://na17.salesforce.com/

## ua

A [Mojo::UserAgent](https://metacpan.org/pod/Mojo::UserAgent) object.

## json

A [Mojo::JSON](https://metacpan.org/pod/Mojo::JSON) object.

# METHODS

## api\_url

Salesforce API url for accessing sobjects

## model

Select model namespace you wish to query, e.g. 'Account'

## sobjects

Retrieve list of available sobjects

## get

Perform authenticated requests against Salesforce API

# INSTALL

    $ cpanm git://github.com/battlemidget/Net-Salesforce-Client.git

If you'd wish to try out the latest code base you can do so with above
command.

# AUTHOR

Adam Stokes <adamjs@cpan.org>

# COPYRIGHT

Copyright 2014- Adam Stokes

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
