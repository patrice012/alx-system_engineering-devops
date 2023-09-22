# install flask -v 2.1.0

# Create a Puppet class for installing Flask
class myapp::flask {
  package { 'flask':
    ensure   => '2.1.0',
    provider => 'pip3',
  }
}

# Include the class to install Flask
include myapp::flask

