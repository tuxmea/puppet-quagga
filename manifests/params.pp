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

	case $operatingsystem {
		'ubuntu','debian': {
			$quagga_conf		= '/etc/quagga'
			$quagga_daemons_conf	= '/etc/quagga/daemons'
			$quagga_debian_conf	= '/etc/quagga/debian.conf'
			$quagga_zebra_conf	= '/etc/quagga/zebra.conf'
			$quagga_bgp_conf	= '/etc/quagga/bgpd.conf'
		}
	}
}
