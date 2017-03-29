# PacketFu6

[![BuildStatus](https://secure.travis-ci.org/decrypto-org/packetfu6.png)](http://travis-ci.org/decrypto-org/packetfu6)
[![Code Climate](https://codeclimate.com/github/packetfu/packetfu.png)](https://codeclimate.com/github/packetfu/packetfu)
[![Coverage Status](https://coveralls.io/repos/github/decrypto-org/packetfu6/badge.svg?branch=master)](https://coveralls.io/github/decrypto-org/packetfu6?branch=master)

A library for reading and writing packets to an interface or to a
libpcap-formatted file.
This is a temporary hard copy of
[PacketFu](https://github.com/packetfu/packetfu) library.  

It is maintained [here](https://github.com/decrypto-org/packetfu6).

## Setup

To install the gem, type

```bash
gem install packetfu6
```

To install from source, type

```bash
gem install bundler
git clone https://github.com/decrypto-org/packetfu6.git
cd packetfu6
bundle install
```

## Quick Start

The best way to test your installation is by using
[packetfu-shell](https://github.com/decrypto-org/packetfu6/blob/master/examples/packetfu-shell.rb), like so

```bash
$ rvmsudo ruby examples/packetfu-shell.rb
 _______  _______  _______  _        _______ _________ _______           ______
(  ____ )(  ___  )(  ____ \| \    /\(  ____ \\__   __/(  ____ \|\     /|(  ____)
| (    )|| (   ) || (    \/|  \  / /| (    \/   ) (   | (    \/| )   ( || (
| (____)|| (___) || |      |  (_/ / | (__       | |   | (__    | |   | || (____
|  _____)|  ___  || |      |   _ (  |  __)      | |   |  __)   | |   | || (__  |
| (      | (   ) || |      |  ( \ \ | (         | |   | (      | |   | || (  ) |
| )      | )   ( || (____/\|  /  \ \| (____/\   | |   | )      | (___) || (__) |
|/       |/     \|(_______/|_/    \/(_______/   )_(   |/       (_______)(______)
 ________________________________              ________________________________
(                                )            (                                )
|   01000001 00101101 01001000   )( )( )( )( )(   00101101 01000001 00100001   |
|                                )( )( )( )( )(                                |
(________________________________)            (________________________________)
                                   PacketFu6
                a mid-level packet manipulation library for ruby

>>> PacketFu6 Shell 1.1.12.
>>> Use $packetfu_default.config for salient networking details.
IP:  192.168.0.100   Mac: ac:bc:32:85:47:3f   Gateway: ec:08:6b:62:bc:d2
Net: 192.168.0.0                              Iface:   en0
>>> Packet capturing/injecting enabled.
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
2.3.0 :001 >
```

Once you're at this point, you're in an IRB (aka:[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)) interface when you can start creating and injection packets with PacketFu6.

Here's an example of creating a TCPPacket and sending it out on the wire:

```
2.3.0 :002 > packet = TCPPacket.new(:config => Utils.whoami?)
 => --EthHeader-------------------------------------------
  eth_dst      ec:08:6b:62:bc:d2 PacketFu::EthMac
  eth_src      ac:bc:32:85:47:3f PacketFu::EthMac
  eth_proto    0x0800            StructFu::Int16
--IPHeader--------------------------------------------
  ip_v         4                 Integer
  ip_hl        5                 Integer
  ip_tos       0                 StructFu::Int8
  ip_len       20                StructFu::Int16
  ip_id        0x77e4            StructFu::Int16
  ip_frag      0                 StructFu::Int16
  ip_ttl       32                StructFu::Int8
  ip_proto     6                 StructFu::Int8
  ip_sum       0xffff            StructFu::Int16
  ip_src       192.168.0.100     PacketFu::Octets
  ip_dst       0.0.0.0           PacketFu::Octets
--TCPHeader-------------------------------------------
  tcp_src      42653             StructFu::Int16
  tcp_dst      0                 StructFu::Int16
  tcp_seq      0x8d65fbbf        StructFu::Int32
  tcp_ack      0x00000000        StructFu::Int32
  tcp_hlen     5                 PacketFu::TcpHlen
  tcp_reserved 0                 PacketFu::TcpReserved
  tcp_ecn      0                 PacketFu::TcpEcn
  tcp_flags    ......            PacketFu::TcpFlags
  tcp_win      16384             StructFu::Int16
  tcp_sum      0x7f29            StructFu::Int16
  tcp_urg      0                 StructFu::Int16
  tcp_opts                       PacketFu::TcpOptions

2.3.0 :003 > packet.ip_dst = "8.8.8.8"
 => "8.8.8.8"
2.3.0 :004 > packet.tcp_dst = 53
 => 53
2.3.0 :005 > packet.to_w
 => [1, 1, 54]
```

## Documentation

PacketFu6 is yard-compatible (as well as sdoc/rdoc, if you prefer). You
can generate local documentation easily with either `yard doc .` or
`sdoc`, and view doc/index.html with your favored browser. Once that's
done, navigate at the top, and read up on how to create a Packet or
Capture from an interface with show_live or whatever.

## Supported Rubies

This project is integrated with travis-ci and is regularly tested to work with the following rubies:

- 2.1.6
- 2.2.3
- 2.3.0

To checkout the current build status for these rubies, click [here](https://travis-ci.org/decrypto-org/packetfu6).

## Author

PacketFu6 is maintained primarily by Dimitris Grigoriou dimitris.riou@gmail.com
with help from [Decrypto](https://github.com/decrypto-org).
The initial authors of PacketFu are Tod Beardsley todb@packetfu.com and Jonathan
Claudius claudijd@yahoo.com.

See [LICENSE](https://github.com/decrypto-org/packetfu6/blob/master/LICENSE.txt) for licensing details.
