# Class: quagga 
#
# This class installs quagga daemon
#
# Parameters:
#
# Actions:
# - Install quagga
# - Manage quagga services
#
# Requires:
#
# Sample usage:
# - include quagga
#
class quagga {
	include quagga::params
	package { 'quagga':
		name		=> $quagga::params::quagga_name,
		ensure		=> installed,
	}
	service { 'quagga':
		name		=> $quagga::params::quagga_name,
		ensure		=> running,
		enable		=> true,
		subscribe	=> Package['quagga'],
	}

	if defined(${quagga_daemons_conf}) {
		file { 'quagga_daemons_conf':
			name	=> ${quagga::params::quagga_daemons_conf},
			content	=> template(quagga_daemons.conf),
			owner 	=> root,
			group 	=> root,
			mode	=> 644,
		}
	}
	if defined(${quagga_zebra_conf}) {
		file { 'quagga_zebra_conf':
			name	=> ${quagga::params::quagga_zebra_conf},
			content	=> template(quagga_zebra.conf),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if defined(${quagga_debian_conf}) {
		file {'quagga_debian_conf':
			name	=> ${quagga:params::quagga_debian_conf},
			content	=> template(quagga_debian.conf),
			owner 	=> root,
			group	=> root,
			mode	=> 644,
		}
	}
	if defined(${quagga_bgpd_conf}) {
		file { 'quagga_bgpd_conf':
			name	=> ${quagga::params::quagga_bgpd_conf},
			content	=> template(quagga_bgpd.conf),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if defined(${quagga_ospfd_conf}) {
		file { 'quagga_ospfd_conf':
			name	=> ${quagga::params::quagga_ospfd_conf},
			content	=> template(quagga_ospfd.conf),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if defined(${quagga_ospf6d_conf}) {
		file { 'quagga_ospf6d_conf':
			name	=> ${quagga::params::quagga_ospf6d_conf},
			content	=> template(quagga_ospf6d.conf),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if defined(${quagga_ripd_conf}) {
		file { 'quagga_ripd_conf':
			name	=> ${quagga::params::quagga_ripd_conf},
			content	=> template(quagga_ripd.conf),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if defined(${quagga_ripngd_conf}) {
		file { 'quagga_ripngd_conf':
			name	=> ${quagga::params::quagga_ripngd_conf},
			content	=> template(quagga_ripngd.conf),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if defined(${quagga_isisd_conf}) {
		file { 'quagga_isisd_conf':
			name	=> ${quagga::params::quagga_isisd_conf},
			content	=> template(quagga_isisd.conf),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
}
