#!/usr/bin/env nu
#
# Write goimapnotify config.

use mail.nu *

def hook [event, account] {
	$"\"($env.HOME)/.config/goimapnotify/hooks/on-($event) (profile $account) (local $account) (domain $account)\""
}

def item [account] {
	$"
- host: (host $account)
  port: 993
  tls: true
  tlsOptions:
    rejectUnauthorized: true
  username: (address $account)
  passwordCMD: \"bat (pwfile $account)\"
  xoAuth2: false
  boxes:
  - mailbox: INBOX
    onNewMail: (hook new $account)
    onNewMailPost: (hook new-post $account)
    onDeletedMail: (hook deleted $account)
    onDeletedMailPost: (hook deleted-post $account)
	"
}

export def goimapnotify-config [accounts] {
	$"
configurations:
($accounts | each { |account| item $account } | str join "\n")
	"
}
