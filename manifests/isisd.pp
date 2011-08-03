define quagga::isisd {

	include quagga

	file { 'quagga_isisd_conf':
		name    => $quagga::params::quagga_isisd_conf,
		content => template('quagga/quagga_isisd.conf.erb'),
		owner   => $quagga::params::owner,
		group   => $quagga::params::group,
		mode    => 640,
		notify  => Service['quagga'],
	}

}
