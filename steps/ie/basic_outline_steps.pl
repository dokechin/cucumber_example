#!perl

use strict;
use warnings;
use utf8;

use Test::BDD::Cucumber::StepFile;
use Test::Selenium::Remote::Driver;

Given qr/体重"(.+)"kgの牛/, sub {
  my $sel = Test::Selenium::Remote::Driver->new(browser_name => 'internet explorer', remote_server_addr => 'localhost', port => 4444);
  my $text = sprintf("//*[text()='体重%skgの牛']" , C->matches->[0]);
  $sel->get("http://localhost:3000");
  $sel->find_child_element( $sel->find_element("feed_type", "name"), $text, "xpath")->click;
  S->{'sel'} = $sel;

};



