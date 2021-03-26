### What
**This is a fork of [robbiev/devdns](https://github.com/robbiev/devdns) packaged for development under docker.**

DNS server that replies the same address ("127.0.0.1" by default) to all type A queries and NXDOMAIN to any other query.

### Why
It's often useful during development to access local services using a local domain. Existing options are:

1. Add them all to `/etc/hosts` (quickly becomes a mess, have to list all subdomains)
2. Run a DNS server like BIND (complex configuration)
3. Run a DNS proxy like [Dnsmasq](http://passingcuriosity.com/2013/dnsmasq-dev-osx/) (reasonable option but still needs configuration)

Using devdns you just need to download a binary and run it. It works best with the OS X `resolver` system (see below).

#### Why on Docker?

If you need just the binary, download and use [robbiev's](https://github.com/robbiev/devdns) version. If you have a docker stack and want to run it all with one command, this is your place.


### How

#### Manual binary
Follow the instructions on [robbiev's](https://github.com/robbiev/devdns) version.

#### Docker binary

`docker build -t devdns .`
`docker run -it --rm -p 5300:5300/udp --name devdns devdns`

On OS X you can use the [resolver system](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man5/resolver.5.html) (`man 5 resolver`) to resolve only a chosen few domains to this local server:

```
sudo mkdir -p /etc/resolver

# all domains ending in ".dev"
sudo vi /etc/resolver/dev
```

Contents of /etc/resolver/dev:

```
nameserver 127.0.0.1
port 5300
```
