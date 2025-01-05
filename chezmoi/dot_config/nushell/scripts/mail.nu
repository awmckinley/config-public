export def address [account] {
	$account | get Address
}

export def domain [account] {
	(address $account) | split row "@" | last
}

export def group [account] {
	$account | get Group
}

export def host [account] {
	match ($account | get Provider) {
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

export def pwfile [account] {
	let uuid = $account | get OpUuid
	$"($env.HOME)/.local/share/mail/($uuid).pw"
}
