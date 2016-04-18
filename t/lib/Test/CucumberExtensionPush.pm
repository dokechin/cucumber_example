#!perl

package Test::CucumberExtensionPush;

use Moose;
use Test::BDD::Cucumber::Extension;
use Data::Dumper;
extends 'Test::BDD::Cucumber::Extension';

has browser => ( is => 'ro' );
has hash => ( is => 'ro', isa => 'HashRef', default => sub { {} } );

sub step_directories {
    return ['extension_steps/'];
}

sub pre_feature  { push @{ $_[0]->hash->{pre_feature} },  $_[0]->browser; }
sub post_feature { push @{ $_[0]->hash->{post_feature} }, $_[0]->browser; }

sub pre_scenario  { 

  my $senario = shift;
  my $feature_stash = shift;
  my $senario_stash = shift;
  warn(Dumper($senario_stash));
  warn(Dumper($senario));

}
sub post_scenario { push @{ $_[0]->hash->{post_scenario} }, $_[0]->browser; }

sub pre_step  { 
  my $a = shift;
  my $b = shift;
}
sub post_step { push @{ $_[0]->hash->{post_step} }, $_[0]->browser; }

__PACKAGE__->meta->make_immutable;

1;
