load("@bazel_skylib//rules:build_test.bzl", "build_test")

exports_files(
    [
        "bzip2.BUILD",
    ],
    visibility = ["//visibility:public"],
)

build_test(
    name = "build_test",
    targets = [
        "@bzip2//:bzip2_lib",
    ],
    visibility = ["//:__pkg__"],
)

cc_library(
    name = "bzip21",
    deps = [
        "@bzip2//:bzip2_lib",
    ],
)
