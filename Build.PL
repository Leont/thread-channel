use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
  module_name         => 'Thread::Channel',
##{ $plugin->get_prereqs ##}
  c_source            => 'src',
);

$builder->create_build_script();
