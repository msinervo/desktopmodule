class ssh {
	package {
		"openssh-client":
			ensure => latest;
		"openssh-server":
			ensure => latest;
	}
	service {
		"ssh":
			ensure    => true,
			enable    => true,
			hasstatus => true,
			provider  => systemd,
			require   => Package["openssh-server"];
	}

	augeas {
		"sshd_config":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set Protocol 2",
				"set ClientAliveInterval 900",
				"set ClientAliveCountMax 0",
				"set IgnoreRshosts yes",
				"set HostbasedAuthentication no",
				"set PermitRootLogin no",
				"set PermitEmptyPasswords no",
				"set Banner /etc/issue",
				"set PermitUserEnvironment no",
			];
	}
}

