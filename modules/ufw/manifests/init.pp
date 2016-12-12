class ufw {
        package { 'ufw':
                ensure => latest,
        }

        Exec {
        path => '/bin/:/usr/sbin/',
        }

        exec {'ufw enable':
        unless => 'ufw status verbose|grep "Status: active"',
        }

        exec {'ufw allow 22/tcp':
        unless => 'ufw status verbose|grep 22/tcp',
        }
}

