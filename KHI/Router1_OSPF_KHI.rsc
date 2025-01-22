# jan/02/1970 00:16:31 by RouterOS 6.48.7
# software id = 44UU-TR2K
#
# model = RouterBOARD 941-2nD
# serial number = 8B0E08B7BB28
/interface bridge
add comment="OSPF loopback" name=loopback
/interface wireless
set [ find default-name=wlan1 ] ssid=KHI
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=KHI
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.14
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/routing ospf instance
set [ find default=yes ] router-id=172.16.16.1
/ip address
add address=192.168.0.1/30 comment=koneksi_ke_router2 interface=ether1 \
    network=192.168.0.0
add address=192.168.1.1/28 comment=LAN interface=ether2 network=192.168.1.0
add address=172.16.16.1 interface=loopback network=172.16.16.1
/ip dhcp-server network
add address=192.168.1.0/28 gateway=192.168.1.1
/routing ospf network
add area=backbone comment=Loopback network=172.16.16.1/32
add area=backbone comment=koneksi_ke_router2 network=192.168.0.0/30
add area=backbone comment=LAN network=192.168.1.0/28
