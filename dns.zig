// a simple DNS server in Zig
// references:
// https://www.cloudflare.com/learning/dns/what-is-dns/
// https://medium.com/@openmohan/dns-basics-and-building-simple-dns-server-in-go-6cb8e1cfe461
// https://reintech.io/blog/implementing-a-dns-server-in-go
// https://domenicoluciani.com/2024/05/07/create-dns-resolver.html
// https://github.com/EmilHernvall/dnsguide

const std = @import("std");

pub fn main() void {
    std.debug.print("dns server in zig\n", .{});
}
