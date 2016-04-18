#!perl

use strict;
use warnings;
use utf8;

use Test::Mojo;
use Test::BDD::Cucumber::StepFile;

When qr/飼料の必要量を計算する/, sub {
  S->{'sel'}->find_element("input[type=\"submit\"]", "css")->click_ok;
};

Then qr/カロリー"(.+)"MJ/, sub {
  my $mj = sprintf("%sMJ" , C->matches->[0]);
  S->{'sel'}->body_text_like(qr/$mj/);
};

Then qr/タンパク"(.+)"kg/, sub {
  my $kg = sprintf("%skg" , C->matches->[0]);
  S->{'sel'}->body_text_like(qr/$kg/);

};