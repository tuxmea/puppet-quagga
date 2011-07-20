# Class: quagga::params
#
# This class manages Quagga parameters
#
# Parameters:
# - The $user that Quagga runs as
# - The $group that Quagga runs as
# - The $quagga_name is the name of the package and service on the relevant distribution
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class quagga::params {

	$user		= quagga
	$group		= quagga
	$quagga_name	= quagga
	$zebra		= 'yes'
	$vtysh		= 'yes'
	$bgpd		= 'yes'
	$ospfd		= 'no'
	$ospfd64	= 'no'
	$ripd		= 'no'
	$ripngd		= 'no'
	$isisd		= 'no'

	case $operatingsystem {
		'ubuntu','debian': {
			$quagga_conf		= '/etc/quagga'
			$quagga_daemons_conf	= '/etc/quagga/daemons'
			$quagga_debian_conf	= '/etc/quagga/debian.conf'
			$quagga_zebra_conf	= '/etc/quagga/zebra.conf'
			$quagga_vtysh_conf	= '/etc/quagga/vtysh.conf'
			$quagga_bgp_conf	= '/etc/quagga/bgpd.conf'
			$quagga_ospfd_conf	= '/etc/quagga/ospfd.conf'
			$quagga_ospf6d_conf	= '/etc/quagga/opsf6d.conf'
			$quagga_ripd_conf	= '/etc/quagga/ripd.conf'
			$quagga_ripngd_conf	= '/etc/quagga/ripngd.conf'
			$quagga_isisd_conf	= '/etc/quagga/isisd.conf'
		}
	}
}
