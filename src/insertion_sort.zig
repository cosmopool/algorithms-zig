const std = @import("std");
const testing = std.testing;
const testAllocator = std.testing.allocator;

/// INSERT SORT ALGORITHM
/// Best fit for small sets of data
fn sort(comptime T: type, allocator: std.mem.Allocator, comptime input: []const T) std.mem.Allocator.Error![]const T {
    const output: []T = try allocator.alloc(T, input.len);
    std.mem.copyForwards(T, output, input);

    for (1..output.len) |j| {
        const key = output[j];
        var i: isize = @intCast(j - 1);
        while (i >= 0 and output[@intCast(i)] > key) {
            output[@as(usize, @intCast(i)) + 1] = output[@intCast(i)];
            i = @intCast(i - 1);
        }
        const idx: usize = @intCast(i + 1);
        output[idx] = key;
    }

    return output;
}

test "sort 2 items array" {
    const inputSet = [_]u8{ 2, 1 };
    const expected = [_]u8{ 1, 2 };

    const result = try sort(u8, testAllocator, inputSet[0..]);
    defer testAllocator.free(result);

    try testing.expect(std.mem.eql(u8, result, expected[0..]));
}

test "sort 5 items array" {
    const inputSet = [_]u8{ 2, 1, 5, 4, 3 };
    const expected = [_]u8{ 1, 2, 3, 4, 5 };

    const result = try sort(u8, testAllocator, inputSet[0..]);
    defer testAllocator.free(result);

    try testing.expect(std.mem.eql(u8, result, expected[0..]));
}
