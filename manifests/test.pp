quagga::bgp{ 'quagga_bgp': asnumber => "ASNummer", bgpip => "BGP listen IP", bgpaddress => "Address/Net", routerip => "Router for announcement" }
quagga::ospfd { 'quagga_ospfd': }
quagga::ospf6d { 'quagga_ospf6d': }
quagga::isisd { 'quagga_isisd': }
quagga::ripd { 'quagga_ripd': }
quagga::ripngd { 'quagga::ripngd': }

