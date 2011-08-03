define quagga::bgp ( $asnumber, $bgpip, $bgpaddress, $routerip) {

	include quagga

	file { 'quagga_bgpd_conf':
		name    => $quagga::params::quagga_bgpd_conf,
		content => template('quagga/quagga_bgpd.conf.erb'),
		owner   => $quagga::params::owner,
		group   => $quagga::params::group,
		mode    => 640,
		notify  => Service['quagga'],
	}

}
