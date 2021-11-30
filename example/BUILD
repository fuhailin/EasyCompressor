load("@bazel_skylib//rules:build_test.bzl", "build_test")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "zlib_usage_example",
    srcs = ["zlib_example.cpp"],
    deps = ["@zlib"],
)

cc_binary(
    name = "lz4_usage_example",
    srcs = ["lz4_frameCompress.c"],
    deps = ["@lz4"],
)

build_test(
    name = "build_test",
    targets = [
        "@bzip2",
        # "@org_gnu_gzip//:gzip",
        "@lz4",
        "@org_lzma_lzma//:lzma",
        "@snappy",
        "@zlib",
        "@zstd//:zstd",
    ],
    visibility = ["//:__pkg__"],
)
