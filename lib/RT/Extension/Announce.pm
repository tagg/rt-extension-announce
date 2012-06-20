use strict;
use warnings;
package RT::Extension::Announce;

our $VERSION = '0.01';

=head1 NAME

RT-Extension-Announce - Display announcements as a banner on RT pages.

=head1 INSTALLATION

=over

=item perl Makefile.PL

=item make

=item make install

May need root permissions

=item Edit your /opt/rt4/etc/RT_SiteConfig.pm

Add these lines:

    Set(@Plugins, qw(RT::Extension::Announce));
    Set(@CustomFieldValuesSources, (qw(RT::CustomFieldValues::AnnounceGroups)));

or add C<RT::Extension::Announce> to your existing C<@Plugins> line.

=item make initdb

Run this in the install directory where you ran the previous make commands.

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 DESCRIPTION

The Announce extension gives you an easy way to insert announcements on the RT homepage
so all users can see the message. You may want to display a banner during maintenance or
an unscheduled outage to make sure the people fielding customer tickets know that
something is going on.

When you install the extension, a new queue is created called RTAnnounce.
To post an announcement, create a ticket in that queue.
The extension displays the subject and most recent update on active tickets in the
RTAnnounce queue. As the incident or maintenance progresses, just post
the updates to the ticket and the announcement will be updated with the latest
information. When the incident is over, resolve the ticket and the
announcement will be removed.

The RTAnnounce queue has a group custom field which you can use to limit
who will see an announcement. If you set no RT group, all users will see
the announcement. If you set one or more groups, memebers of those groups
will see it.

By default, the announements are static text. If you give
users the ShowTicket right on the RTAnnounce queue, the announcements
will have links to the source tickets. This will allow users to see the
history of an announcement or see longer messages that might be
truncated on the homepage.

The RTAnnounce queue is a regular queue, so you can control access to creating
announcements the same way you manage permissions on other queues.
In addition to setting permissions, you may not
want to send the typical 'ticket create' email messages, so you could change
or customize the scrips that run or create new templates. If you send
announcement messages to an email list,
you could create a list user in RT and add it as a CC to the announcement
queue. Then messages posted for announcement in RT will also be sent to the
notification list.

=head1 AUTHOR

Jim Brandt <jbrandt@bestpractical.com>

=head1 BUGS

All bugs should be reported via
L<http://rt.cpan.org/Public/Dist/Display.html?Name=RT-Extension-Announce>
or L<bug-RT-Extension-Announce@rt.cpan.org>.


=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2012 by Best Practical Solutions, LLC

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;
