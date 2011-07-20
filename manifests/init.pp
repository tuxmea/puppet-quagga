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

	if $quagga::params::quagga_daemons_conf != undef {
		file { 'quagga_daemons_conf':
			name	=> $quagga::params::quagga_daemons_conf,
			content	=> template('quagga/quagga_daemons.conf.erb'),
			owner 	=> root,
			group 	=> root,
			mode	=> 644,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::quagga_zebra_conf != undef {
		file { 'quagga_zebra_conf':
			name	=> $quagga::params::quagga_zebra_conf,
			content	=> template('quagga/quagga_zebra.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 640,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::quagga_debian_conf != undef {
		file { 'quagga_debian_conf':
			name	=> $quagga::params::quagga_debian_conf,
			content	=> template('quagga/quagga_debian.conf.erb'),
			owner 	=> root,
			group	=> root,
			mode	=> 644,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::vtysh == 'yes' {
		file { 'quagga_vtysh_conf':
			name	=> $quagga::params::quagga_vtysh_conf,
			content	=> template('quagga/quagga_vtysh.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 660,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::bgpd == 'yes' {
		file { 'quagga_bgpd_conf':
			name	=> $quagga::params::quagga_bgpd_conf,
			content	=> template('quagga/quagga_bgpd.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 640,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::ospfd == 'yes' {
		file { 'quagga_ospfd_conf':
			name	=> $quagga::params::quagga_ospfd_conf,
			content	=> template('quagga/quagga_ospfd.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 640,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::ospf6d == 'yes' {
		file { 'quagga_ospf6d_conf':
			name	=> $quagga::params::quagga_ospf6d_conf,
			content	=> template('quagga/quagga_ospf6d.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 640,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::ripd == 'yes' {
		file { 'quagga_ripd_conf':
			name	=> $quagga::params::quagga_ripd_conf,
			content	=> template('quagga/quagga_ripd.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 640,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::ripngd == 'yes' {
		file { 'quagga_ripngd_conf':
			name	=> $quagga::params::quagga_ripngd_conf,
			content	=> template('quagga/quagga_ripngd.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 640,
			notify	=> Service['quagga'],
		}
	}
	if $quagga::params::isisd == 'yes' {
		file { 'quagga_isisd_conf':
			name	=> $quagga::params::quagga_isisd_conf,
			content	=> template('quagga/quagga_isisd.conf.erb'),
			owner	=> $quagga::params::owner,
			group	=> $quagga::params::group,
			mode	=> 640,
			notify	=> Service['quagga'],
		}
	}
}
