load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

configure_make(
    name = "gzip",
    env = select({
        "@platforms//os:macos": {"AR": ""},
        "//conditions:default": {},
    }),
    # configure_options = [
    #     "--enable-shared=no",
    #     "--with-pic",
    # ],
    lib_source = ":all_srcs",
    targets = [
        "-j`nproc`",
        "install",
    ],
    out_static_libs = ["libgzip.a"],
    # out_binaries = [
    #     "gzip",
    # ],
)