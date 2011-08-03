define quagga::ospfd {

	include quagga

	file { 'quagga_ospfd_conf':
		name    => $quagga::params::quagga_ospfd_conf,
		content => template('quagga/quagga_ospfd.conf.erb'),
		owner   => $quagga::params::owner,
		group   => $quagga::params::group,
		mode    => 640,
		notify  => Service['quagga'],
	}

}
