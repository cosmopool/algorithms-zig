const std = @import("std");
const testing = std.testing;

comptime {
    _ = @import("insertion_sort.zig");
}

test "dummy test" {
    try testing.expect(1 == 1);
}
