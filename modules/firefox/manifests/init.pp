class firefox {
	package {'firefox':
		ensure => latest,
	}

	file {'/etc/firefox/syspref.js':
		content => template('firefox/syspref.js'),
	}

}
