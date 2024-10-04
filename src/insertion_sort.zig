const std = @import("std");
const testing = std.testing;

// INSERT SORT ALGORITHM
// Best fit for small sets of data

fn sort(comptime T: type, allocator: std.mem.Allocator, input: []const T, toAdd: T) std.mem.Allocator.Error![]const T {
    var output: []T = try allocator.alloc(T, input.len + 1);
    std.mem.copyForwards(T, output, input);
    output[input.len] = toAdd;

    for (1..output.len) |i| {
        const key = output[i];
        var j = i - 1;
        while (j > 0 and output[j] > key) {
            output[j + 1] = output[j];
            j = j - 1;
            output[j] = key;
        }
    }

    return output;
}

test "sort 3 items array" {
    const inputSet = [_]u8{ 2, 1 };
    const expected = [_]u8{ 1, 2, 3 };
    const result = try sort(u8, std.testing.allocator, inputSet[0..], 3) catch |err| {
        std.debug.print("error: {}\n", .{err});
    };

    try testing.expect(std.mem.eql(u8, result, expected[0..]));
}
