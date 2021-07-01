# vim: ft=bzl
# https://github.com/google/riegeli/blob/master/third_party/net_zstd.BUILD
# https://github.com/cschuet/zstd/blob/master/bazel/third_party/zstd.BUILD
package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all",
    srcs = glob(["**"]),
)

cc_library(
    name = "zstd",
    srcs = glob([
        "common/*.c",
        "common/*.h",
        "compress/*.c",
        "compress/*.h",
        "decompress/*.c",
        "decompress/*.h",
    ]),
    hdrs = ["zstd.h"],
)
