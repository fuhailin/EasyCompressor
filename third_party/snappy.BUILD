load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "snappy",
    build_args = [
        "-j `nproc`",
    ],
    cache_entries = {
        "SNAPPY_BUILD_TESTS": "OFF",
        "SNAPPY_BUILD_BENCHMARKS": "OFF",
    },
    copts = [
        "-fPIC",
    ],
    lib_source = ":all_srcs",
    out_static_libs = select({
        "@platforms//os:windows": ["snappy.lib"],
        "//conditions:default": ["libsnappy.a"],
    }),
)
