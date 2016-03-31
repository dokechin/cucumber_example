package Cucumber::Example::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

sub caluculate {
  my $self = shift;

  if ($self->param("feed_type") eq "cow_450"){
    $self->stash({colorie => "26500", protein => "215"});
  }
  else{
    $self->stash({colorie => "29500", protein => "245"});    
  }
  $self->render();
}

1;
