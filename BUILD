load("@bazel_skylib//rules:build_test.bzl", "build_test")

build_test(
    name = "build_test",
    targets = [
        "@org_bzip_bzip2//:bzip2",
        "@lz4",
        "@org_lzma_lzma//:lzma",
        "@zlib",
        "@com_github_facebook_zstd//:zstd",
        "@com_github_google_snappy//:snappy",
        # "@org_gnu_gzip//:gzip",
    ],
    visibility = ["//:__pkg__"],
)
