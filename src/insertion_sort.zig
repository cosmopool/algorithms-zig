const std = @import("std");
const testing = std.testing;
const testAllocator = std.testing.allocator;

// INSERT SORT ALGORITHM
// Best fit for small sets of data

fn sort(comptime T: type, allocator: std.mem.Allocator, comptime input: []const T) std.mem.Allocator.Error![]const T {
    const output: []T = try allocator.alloc(T, input.len);
    std.mem.copyForwards(T, output, input);

    for (1..output.len) |i| {
        const key = output[i];
        var j: usize = i - 1;
        while (j >= 0 and output[j] > key) {
        //     output[j + 1] = output[j];
        //     if (j == 0) break;
        //     j = j - 1;
        }
        // output[j + 1] = key;
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
