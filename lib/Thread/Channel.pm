package Thread::Channel;

use strict;
use warnings;

use Sereal ();

use XSLoader;
XSLoader::load('Thread::Channel', __PACKAGE__->VERSION);

1; # End of Thread::Channel

# ABSTRACT: Fast thread queues

=head1 SYNOPSIS

 use threads;
 use Thread::Channel;
 my $channel = Thread::Channel->new;

 my $reader = threads->create(sub {
     while (my $line = <>) {
         $channel->enqueue($line)
     };
     $channel->enqueue(undef);
 });

 while (defined(my $line = $channel->dequeue)) {
     print $line;
 }
 $reader->join;

=head1 DESCRIPTION

Thread::Channel is an alternative to L<Thread::Queue>. By using a smart serialization ladder, it can achieve high performance without compromizing on flexibility.

=method new()

This constructs a new channel.

=method enqueue(@items)

This enqueues the message C<@items> to the channel. Note that this list is a single message.

=method dequeue()

Dequeues a message from queue. Note that this returns a list, not (necessarily) a scalar. If the channel is empty, it will wait until a message arrives.

=method dequeue_nb()

Dequeues a message from queue. Note that this returns a list, not (necessarily) a scalar. If the channel is empty, it will return an empty list.

=head1 SEE ALSO

=over 4

=item * Thread::Queue

=item * Sereal

=back

