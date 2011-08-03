define quagga::ripngd {

	include quagga

	file { 'quagga_ripngd_conf':
		name    => $quagga::params::quagga_ripngd_conf,
		content => template('quagga/quagga_ripngd.conf.erb'),
		owner   => $quagga::params::owner,
		group   => $quagga::params::group,
		mode    => 640,
		notify  => Service['quagga'],
	}

}
