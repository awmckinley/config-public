#!/usr/bin/env nu
#
# Write mbsync config.

use mail.nu *

def both-label [account] {
	$"both.(local $account).(domain $account)"
}

def channel-label [account] {
	$"channel.(local $account).(domain $account)"
}

def group-label [account] {
	$"group.(local $account).(domain $account)"
}

def imap-label [account] {
	$"imap.(local $account).(domain $account)"
}

def maildir-label [account] {
	$"maildir.(local $account).(domain $account)"
}

def near-label [account] {
	$"near.(local $account).(domain $account)"
}

def gmail-item [account] {
	$"
Group (group-label $account) (both-label $account) (near-label $account)

IMAPStore (imap-label $account)
Host (host $account)
Port 993
Timeout 20
User (address $account)
PassCmd \"bat (pwfile $account)\"
AuthMechs PLAIN
TLSType IMAPS
TLSVersions -1.2
PipelineDepth 1
UseNamespace yes
SubscribedOnly no

MaildirStore (maildir-label $account)
Path (maildir $account)/
Flatten .
AltMap no
Inbox (maildir $account)/INBOX/
SubFolders Verbatim

Channel (both-label $account)
Far :(imap-label $account):
Near :(maildir-label $account):
Pattern * !.notmuch !Archive !"[Gmail]/Chats"
Sync All
Create Near
Remove Near
Expunge Both
CopyArrivalDate yes
SyncState *

Channel (near-label $account)
Far :(imap-label $account):
Near :(maildir-label $account):
Pattern !INBOX "[Gmail]/Chats"
Sync Pull
Create Near
Expunge Near
CopyArrivalDate yes
SyncState *"
}

def spectrum-item [account] {
	$"
Group (group-label $account) (channel-label $account)

IMAPStore (imap-label $account)
Host (host $account)
Port 993
Timeout 20
User (address $account)
PassCmd \"bat (pwfile $account)\"
AuthMechs PLAIN
TLSType IMAPS
TLSVersions -1.2
PipelineDepth 1
UseNamespace yes
SubscribedOnly no

MaildirStore (maildir-label $account)
Path (maildir $account)/
Flatten .
AltMap no
Inbox (maildir $account)/INBOX/

Channel (channel-label $account)
Far :(imap-label $account):
Near :(maildir-label $account):
Pattern *
Sync All
Create Near
Remove Near
Expunge Both
CopyArrivalDate yes
SyncState *"
}

def yahoo-item [account] {
	$"
Group (group-label $account) (channel-label $account)

IMAPStore (imap-label $account)
Host (host $account)
Port 993
Timeout 20
User (address $account)
PassCmd \"bat (pwfile $account)\"
AuthMechs PLAIN
TLSType IMAPS
TLSVersions -1.2
PipelineDepth 1
UseNamespace yes
SubscribedOnly no

MaildirStore (maildir-label $account)
Path (maildir $account)/
Flatten .
AltMap no
Inbox (maildir $account)/INBOX/

Channel (channel-label $account)
Far :(imap-label $account):
Near :(maildir-label $account):
Pattern * INBOX !Inbox
Sync All
Create Near
Remove Near
Expunge Both
CopyArrivalDate yes
SyncState *"
}

def zohomail-item [account] {
	$"
Group (group-label $account) (channel-label $account)

IMAPStore (imap-label $account)
Host (host $account)
Port 993
Timeout 20
User (address $account)
PassCmd \"bat (pwfile $account)\"
AuthMechs PLAIN
TLSType IMAPS
TLSVersions -1.2
PipelineDepth 1
UseNamespace yes
SubscribedOnly no

MaildirStore (maildir-label $account)
Path (maildir $account)/
Flatten .
AltMap no
Inbox (maildir $account)/INBOX/

Channel (channel-label $account)
Far :(imap-label $account):
Near :(maildir-label $account):
Pattern *
Sync All
Create Near
Remove Near
Expunge Both
CopyArrivalDate yes
SyncState *"
}

def item [account] {
	match (provider $account) {
		"gmail" => (gmail-item $account),
		"spectrum" => (spectrum-item $account),
		"yahoo" => (yahoo-item $account),
		"zohomail" => (zohomail-item $account),
		_ => ""
	}
}

export def mbsync-rc [accounts] {
	$"
# force flush
FSync yes

# changing this from the standard breaks aerc
# NOTE: unsure whether this or InfoDelimiter is the culprit
FieldDelimiter :

($accounts | each { |account| item $account } | str join "\n")"
}
