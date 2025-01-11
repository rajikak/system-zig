// a simple DNS server in Zig
// references:
// https://www.cloudflare.com/learning/dns/what-is-dns/
// https://medium.com/@openmohan/dns-basics-and-building-simple-dns-server-in-go-6cb8e1cfe461
// https://reintech.io/blog/implementing-a-dns-server-in-go
// https://domenicoluciani.com/2024/05/07/create-dns-resolver.html
// https://github.com/EmilHernvall/dnsguide
// https://github.com/google/gopacket/blob/master/layers/dns.go

const std = @import("std");
const net = std.net;
const posix = std.posix;

pub fn main() !void {
    const ip = "127.0.0.1";
    const port = 5882;
    const address = try std.net.Address.parseIp(ip, port);

    const tpe: u32 = posix.SOCK.STREAM;
    const protocol = posix.IPPROTO.TCP;
    const listener = try posix.socket(address.any.family, tpe, protocol);
    defer posix.close(listener);
}
