define quagga::ospf6d {

	require quagga

	file { 'quagga_ospf6d_conf':
		name    => $quagga::params::quagga_ospf6d_conf,
		content => template('quagga/quagga_ospf6d.conf.erb'),
		owner   => $quagga::params::owner,
		group   => $quagga::params::group,
		mode    => 640,
	}

}
