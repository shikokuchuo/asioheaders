pkgname <- "ipaddress"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('ipaddress')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("address_in_network")
### * address_in_network

flush(stderr()); flush(stdout())

### Name: address_in_network
### Title: Network membership of addresses
### Aliases: address_in_network is_within is_within_any

### ** Examples

is_within(ip_address("192.168.2.6"), ip_network("192.168.2.0/28"))

is_within(ip_address("192.168.3.6"), ip_network("192.168.2.0/28"))

is_within_any(ip_address("192.168.3.6"), ip_network(c("192.168.2.0/28", "192.168.3.0/28")))



cleanEx()
nameEx("collapse_networks")
### * collapse_networks

flush(stderr()); flush(stdout())

### Name: collapse_networks
### Title: Collapse contiguous and overlapping networks
### Aliases: collapse_networks

### ** Examples

collapse_networks(ip_network(c("192.168.0.0/24", "192.168.1.0/24")))



cleanEx()
nameEx("common_network")
### * common_network

flush(stderr()); flush(stdout())

### Name: common_network
### Title: Find the common network of two addresses
### Aliases: common_network

### ** Examples

# address range matches network boundaries
common_network(ip_address("192.168.0.0"), ip_address("192.168.0.15"))

# address range does not match network boundaries
common_network(ip_address("192.167.255.255"), ip_address("192.168.0.16"))



cleanEx()
nameEx("country_networks")
### * country_networks

flush(stderr()); flush(stdout())

### Name: country_networks
### Title: Country-level IP networks
### Aliases: country_networks

### ** Examples

## Not run: 
##D country_networks(c("GB", "US"))
##D 
##D country_networks(c("GB", "US"), collapse = FALSE)
##D 
##D # retrieve networks for a single country
##D country_networks("TO")$networks[[1]]
##D 
##D # expand networks for multiple countries
##D tidyr::unchop(country_networks(c("GB", "US")), networks)
## End(Not run)



cleanEx()
nameEx("exclude_networks")
### * exclude_networks

flush(stderr()); flush(stdout())

### Name: exclude_networks
### Title: Remove networks from others
### Aliases: exclude_networks

### ** Examples

exclude_networks(ip_network("192.0.2.0/28"), ip_network("192.0.2.1/32"))

exclude_networks(ip_network("192.0.2.0/28"), ip_network("192.0.2.15/32"))



cleanEx()
nameEx("iana_ipv4")
### * iana_ipv4

flush(stderr()); flush(stdout())

### Name: iana_ipv4
### Title: IPv4 address space allocation
### Aliases: iana_ipv4
### Keywords: datasets

### ** Examples

iana_ipv4



cleanEx()
nameEx("iana_ipv6")
### * iana_ipv6

flush(stderr()); flush(stdout())

### Name: iana_ipv6
### Title: IPv6 address space allocation
### Aliases: iana_ipv6
### Keywords: datasets

### ** Examples

iana_ipv6



cleanEx()
nameEx("ip_address")
### * ip_address

flush(stderr()); flush(stdout())

### Name: ip_address
### Title: Vector of IP addresses
### Aliases: ip_address

### ** Examples

# supports IPv4 and IPv6 simultaneously
ip_address(c("192.168.0.1", "2001:db8::8a2e:370:7334"))

# validates inputs and replaces with NA
ip_address(c("255.255.255.256", "192.168.0.1/32"))



cleanEx()
nameEx("ip_cast")
### * ip_cast

flush(stderr()); flush(stdout())

### Name: ip_cast
### Title: Cast to IP vector
### Aliases: ip_cast as_ip_address as_ip_interface as_ip_network

### ** Examples

as_ip_address(ip_interface("192.168.0.1/10"))

as_ip_network(ip_interface("192.168.0.1/10"))



cleanEx()
nameEx("ip_format")
### * ip_format

flush(stderr()); flush(stdout())

### Name: ip_format
### Title: Format IP vector
### Aliases: ip_format format.ip_address format.ip_interface
###   format.ip_network

### ** Examples

format(ip_address("2001:db8::8a2e:370:7334"))

format(ip_address("2001:db8::8a2e:370:7334"), exploded = TRUE)



cleanEx()
nameEx("ip_interface")
### * ip_interface

flush(stderr()); flush(stdout())

### Name: ip_interface
### Title: Vector of IP interfaces
### Aliases: ip_interface ip_interface.default ip_interface.ip_address

### ** Examples

# construct from character vector
ip_interface(c("192.168.0.1/10", "2001:db8:c3::abcd/45"))

# construct from address + prefix length objects
ip_interface(ip_address(c("192.168.0.1", "2001:db8:c3::abcd")), c(10L, 45L))

# extract IP address
x <- ip_interface(c("192.168.0.1/10", "2001:db8:c3::abcd/45"))
as_ip_address(x)

# extract IP network (with host bits masked)
as_ip_network(x)



cleanEx()
nameEx("ip_network")
### * ip_network

flush(stderr()); flush(stdout())

### Name: ip_network
### Title: Vector of IP networks
### Aliases: ip_network ip_network.default ip_network.ip_address

### ** Examples

# construct from character vector
ip_network(c("192.168.0.0/24", "2001:db8::/48"))

# validates inputs and replaces with NA
ip_network(c("192.168.0.0/33", "192.168.0.0"))

# IP networks should not have any host bits set
ip_network("192.168.0.1/22")

# but we can mask the host bits if desired
ip_network("192.168.0.1/22", strict = FALSE)

# construct from address + prefix length
ip_network(ip_address("192.168.0.0"), 24L)

# construct from address + netmask
ip_network(ip_address("192.168.0.0"), prefix_length(ip_address("255.255.255.0")))

# construct from address + hostmask
ip_network(ip_address("192.168.0.0"), prefix_length(ip_address("0.0.0.255")))



cleanEx()
nameEx("ip_operators")
### * ip_operators

flush(stderr()); flush(stdout())

### Name: ip_operators
### Title: Operators for IP addresses
### Aliases: ip_operators %<<% %>>%

### ** Examples

# use ip_to_binary() to understand these examples better

# bitwise NOT
!ip_address("192.168.0.1")

# bitwise AND
ip_address("192.168.0.1") & ip_address("255.0.0.255")

# bitwise OR
ip_address("192.168.0.0") | ip_address("255.0.0.255")

# bitwise XOR
ip_address("192.168.0.0") ^ ip_address("255.0.0.255")

# bitwise shift left
ip_address("192.168.0.1") %<<% 1

# bitwise shift right
ip_address("192.168.0.1") %>>% 1

# addition of integers
ip_address("192.168.0.1") + 10

# subtraction of integers
ip_address("192.168.0.1") - 10



cleanEx()
nameEx("ip_test")
### * ip_test

flush(stderr()); flush(stdout())

### Name: ip_test
### Title: Test for IP vector
### Aliases: ip_test is_ip_address is_ip_interface is_ip_network

### ** Examples

is_ip_address(ip_address("192.168.0.1"))
is_ip_interface(ip_interface("192.168.0.1/10"))
is_ip_network(ip_network("192.168.0.0/24"))



cleanEx()
nameEx("ip_to_binary")
### * ip_to_binary

flush(stderr()); flush(stdout())

### Name: ip_to_binary
### Title: Represent address as binary
### Aliases: ip_to_binary binary_to_ip

### ** Examples

x <- ip_address(c("192.168.0.1", "2001:db8::8a2e:370:7334", NA))
ip_to_binary(x)

binary_to_ip(ip_to_binary(x))



cleanEx()
nameEx("ip_to_bytes")
### * ip_to_bytes

flush(stderr()); flush(stdout())

### Name: ip_to_bytes
### Title: Represent address as raw bytes
### Aliases: ip_to_bytes bytes_to_ip

### ** Examples

x <- ip_address(c("192.168.0.1", "2001:db8::8a2e:370:7334", NA))
ip_to_bytes(x)

bytes <- list(
  as.raw(c(0xc0, 0xa8, 0x00, 0x01)),
  as.raw(c(
    0x20, 0x01, 0x0d, 0xb8, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x8a, 0x2e, 0x03, 0x70, 0x73, 0x34
  )),
  NULL
)
bytes_to_ip(bytes)



cleanEx()
nameEx("ip_to_hex")
### * ip_to_hex

flush(stderr()); flush(stdout())

### Name: ip_to_hex
### Title: Represent address as hexadecimal
### Aliases: ip_to_hex hex_to_ip

### ** Examples

x <- ip_address(c("192.168.0.1", "2001:db8::8a2e:370:7334", NA))
ip_to_hex(x)

hex_to_ip(ip_to_hex(x))



cleanEx()
nameEx("ip_to_hostname")
### * ip_to_hostname

flush(stderr()); flush(stdout())

### Name: ip_to_hostname
### Title: Translate address to/from hostname
### Aliases: ip_to_hostname ip_to_hostname_all hostname_to_ip
###   hostname_to_ip_all

### ** Examples

## Not run: 
##D hostname_to_ip("r-project.org")
##D 
##D ip_to_hostname(hostname_to_ip("r-project.org"))
## End(Not run)



cleanEx()
nameEx("ip_to_integer")
### * ip_to_integer

flush(stderr()); flush(stdout())

### Name: ip_to_integer
### Title: Represent address as integer
### Aliases: ip_to_integer integer_to_ip

### ** Examples

x <- ip_address(c("192.168.0.1", "2001:db8::8a2e:370:7334", NA))
ip_to_integer(x)

integer_to_ip(ip_to_integer(x))

# with IPv4 only, we can use numeric data type
as.numeric(ip_to_integer(ip_address("192.168.0.1")))

integer_to_ip(3232235521)



cleanEx()
nameEx("ipv6-transition")
### * ipv6-transition

flush(stderr()); flush(stdout())

### Name: ipv6-transition
### Title: IPv6 transition mechanisms
### Aliases: ipv6-transition is_ipv4_mapped is_6to4 is_teredo
###   extract_ipv4_mapped extract_6to4 extract_teredo_server
###   extract_teredo_client

### ** Examples

# these examples show the reserved networks
is_ipv4_mapped(ip_network("::ffff:0.0.0.0/96"))

is_6to4(ip_network("2002::/16"))

is_teredo(ip_network("2001::/32"))

# these examples show embedded IPv4 addresses
extract_ipv4_mapped(ip_address("::ffff:192.168.0.1"))

extract_6to4(ip_address("2002:c000:0204::"))

extract_teredo_server(ip_address("2001:0000:4136:e378:8000:63bf:3fff:fdd2"))

extract_teredo_client(ip_address("2001:0000:4136:e378:8000:63bf:3fff:fdd2"))



cleanEx()
nameEx("is_ipv6")
### * is_ipv6

flush(stderr()); flush(stdout())

### Name: is_ipv6
### Title: Version of the address space
### Aliases: is_ipv6 is_ipv4

### ** Examples

ip <- ip_address(c("192.168.0.1", "2001:db8::7334"))

is_ipv4(ip)

is_ipv6(ip)



cleanEx()
nameEx("is_reserved")
### * is_reserved

flush(stderr()); flush(stdout())

### Name: is_reserved
### Title: Reserved addresses
### Aliases: is_reserved is_private is_global is_multicast is_unspecified
###   is_loopback is_link_local is_site_local

### ** Examples

is_private(ip_network(c("192.168.0.0/16", "2001:db8::/32")))

is_global(ip_network(c("1.0.0.0/8", "2002::/32")))

is_multicast(ip_network(c("224.0.0.0/4", "ff00::/8")))

is_unspecified(ip_network(c("0.0.0.0/32", "::/128")))

is_reserved(ip_network(c("240.0.0.0/4", "f000::/5")))

is_loopback(ip_network(c("127.0.0.0/8", "::1/128")))

is_link_local(ip_network(c("169.254.0.0/16", "fe80::/10")))

is_site_local(ip_network("fec0::/10"))



cleanEx()
nameEx("max_prefix_length")
### * max_prefix_length

flush(stderr()); flush(stdout())

### Name: max_prefix_length
### Title: Size of the address space
### Aliases: max_prefix_length

### ** Examples

x <- ip_address(c("192.168.0.1", "2001:db8::7334"))

max_prefix_length(x)



cleanEx()
nameEx("netmask")
### * netmask

flush(stderr()); flush(stdout())

### Name: netmask
### Title: Network mask
### Aliases: netmask prefix_length netmask.numeric hostmask
###   hostmask.numeric

### ** Examples

x <- ip_network(c("192.168.0.0/22", "2001:db00::0/26"))

prefix_length(x)

netmask(x)

hostmask(x)

# construct netmask/hostmask from prefix length
netmask(c(22L, 26L), c(FALSE, TRUE))

hostmask(c(22L, 26L), c(FALSE, TRUE))

# extract prefix length from netmask/hostmask
prefix_length(ip_address(c("255.255.255.0", "0.255.255.255")))

# invalid netmask/hostmask raise a warning and return NA
prefix_length(ip_address("255.255.255.1"))



cleanEx()
nameEx("network_in_network")
### * network_in_network

flush(stderr()); flush(stdout())

### Name: network_in_network
### Title: Network membership of other networks
### Aliases: network_in_network is_supernet is_subnet overlaps

### ** Examples

net1 <- ip_network("192.168.1.128/30")
net2 <- ip_network("192.168.1.0/24")

is_supernet(net1, net2)

is_subnet(net1, net2)

overlaps(net1, net2)



cleanEx()
nameEx("network_size")
### * network_size

flush(stderr()); flush(stdout())

### Name: network_size
### Title: Network size
### Aliases: network_size network_address broadcast_address num_addresses

### ** Examples

x <- ip_network(c("192.168.0.0/22", "2001:db8::/33"))

network_address(x)

broadcast_address(x)

num_addresses(x)



cleanEx()
nameEx("reverse_pointer")
### * reverse_pointer

flush(stderr()); flush(stdout())

### Name: reverse_pointer
### Title: Reverse DNS pointer
### Aliases: reverse_pointer

### ** Examples

reverse_pointer(ip_address("127.0.0.1"))

reverse_pointer(ip_address("2001:db8::1"))



cleanEx()
nameEx("sample")
### * sample

flush(stderr()); flush(stdout())

### Name: sample
### Title: Sample random addresses
### Aliases: sample sample_ipv4 sample_ipv6 sample_network

### ** Examples

sample_ipv4(5)

sample_ipv6(5)

sample_network(ip_network("192.168.0.0/16"), 5)

sample_network(ip_network("2001:db8::/48"), 5)



cleanEx()
nameEx("sequence")
### * sequence

flush(stderr()); flush(stdout())

### Name: sequence
### Title: List addresses within a network
### Aliases: sequence seq.ip_network hosts

### ** Examples

seq(ip_network("192.168.0.0/30"))

seq(ip_network("2001:db8::/126"))

hosts(ip_network("192.168.0.0/30"))

hosts(ip_network("2001:db8::/126"))



cleanEx()
nameEx("summarize_address_range")
### * summarize_address_range

flush(stderr()); flush(stdout())

### Name: summarize_address_range
### Title: List constituent networks of an address range
### Aliases: summarize_address_range

### ** Examples

# address range matches network boundaries
summarize_address_range(ip_address("192.168.0.0"), ip_address("192.168.0.15"))

# address range does not match network boundaries
summarize_address_range(ip_address("192.167.255.255"), ip_address("192.168.0.16"))



cleanEx()
nameEx("traverse_hierarchy")
### * traverse_hierarchy

flush(stderr()); flush(stdout())

### Name: traverse_hierarchy
### Title: Traverse the network hierarchy
### Aliases: traverse_hierarchy supernet subnets

### ** Examples

supernet(ip_network("192.168.0.0/24"))

supernet(ip_network("192.168.0.0/24"), new_prefix = 10L)

subnets(ip_network("192.168.0.0/24"))

subnets(ip_network("192.168.0.0/24"), new_prefix = 27L)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
