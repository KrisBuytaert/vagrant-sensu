
Exec { path => ["/usr/bin", "/usr/sbin", "/bin"] }

import 'hosts/*.pp'
import 'classes/*.pp'
service { 'iptables':
  ensure   => 'stopped',
  enable => 'false',
}

