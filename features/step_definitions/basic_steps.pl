#!perl

use strict;
use warnings;
use utf8;

use Test::Mojo;
use Test::BDD::Cucumber::StepFile;

Given qr/体重(.+)kgの牛/, sub {
  my $t = Test::Mojo->new('Cucumber::Example');
  $t->get_ok('/');
  S->{'t'} = $t;
  my $cow = sprintf("cow_%s" , C->matches->[0]);
  S->{'feed_type'} = $cow;

};

When qr/飼料の必要量を計算する/, sub {
  S->{'t'}->post_ok('/calculate' => form => {feed_type => S->{'feed_type'}});

};

Then qr/カロリー(.+)MJ/, sub {
  my $mj = sprintf("%sMJ" , C->matches->[0]);
  S->{'t'}->content_like(qr/$mj/);
};

Then qr/タンパク(.+)kg/, sub {
  my $kg = sprintf("%skg" , C->matches->[0]);
  S->{'t'}->content_like(qr/$kg/);
};