define quagga::ripd {

	include quagga

	file { 'quagga_ripd_conf':
		name    => $quagga::params::quagga_ripd_conf,
		content => template('quagga/quagga_ripd.conf.erb'),
		owner   => $quagga::params::owner,
		group   => $quagga::params::group,
		mode    => 640,
		notify  => Service['quagga'],
	}

}
