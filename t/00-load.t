#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Thread::Channel' );
}

diag( "Testing Thread::Channel $Thread::Channel::VERSION, Perl $], $^X" );
