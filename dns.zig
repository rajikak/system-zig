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
const print = std.debug.print;

pub fn main() !void {
    const server = DnsServer.init("127.0.0.1", 8443);
    try server.start();
    print("dns server is ready\n", .{});
}

pub const DnsServer = struct {
    ip_addr: []const u8,
    port: u16,

    pub fn init(ip_addr: []const u8, port: u16) DnsServer {
        return DnsServer{ .ip_addr = ip_addr, .port = port };
    }

    pub fn start(self: DnsServer) !void {
        const address = try std.net.Address.parseIp(self.ip_addr, self.port);
        const tpe: u32 = posix.SOCK.STREAM;
        const protocol = posix.IPPROTO.TCP;
        const listener = try posix.socket(address.any.family, tpe, protocol);
        defer posix.close(listener);

        //try posix.setsockopt(listener, posix.SQL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_init, 1)));

    }
};
