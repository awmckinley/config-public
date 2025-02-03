export def address [account] {
	$account | get Address
}

export def domain [account] {
	(address $account) | split row "@" | last
}

export def host [account] {
	match (provider $account) {
		"gmail" => "imap.gmail.com",
		"spectrum" => "mail.brighthouse.com",
		"yahoo" => "imap.mail.yahoo.com",
		"zohomail" => "imap.zoho.com",
		_ => "no host",
	}
}

export def local [account] {
	(address $account) | split row "@" | first
}

export def maildir [account] {
	$"($env.HOME)/Maildir/(domain $account)/(local $account)"
}

export def name [account] {
	$account | get Name
}

export def profile [account] {
	$account | get Profile
}

export def provider [account] {
	$account | get Provider
}

export def pwfile [account] {
	let name = $account | get Passwd
	$"($env.HOME)/.local/share/mbsync/($name).pw"
}
