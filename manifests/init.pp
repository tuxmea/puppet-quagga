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
}
