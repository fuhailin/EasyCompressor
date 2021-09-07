load("@bazel_skylib//rules:build_test.bzl", "build_test")

exports_files([
    "config.lzma-linux.h",
    "config.lzma-osx-arm64.h",
    "config.lzma-osx-x86_64.h",
    "config.lzma-windows.h",
])

build_test(
    name = "build_test",
    targets = [
        "@org_lzma_lzma//:lzma",
    ],
    visibility = ["//:__pkg__"],
)
