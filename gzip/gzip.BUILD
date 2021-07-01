load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all",
    srcs = glob(["**"]),
)

# I tested and this builds only for me on Linux
configure_make(
    name = "gzip",
    # configure_env_vars = select({
    #     "@platforms//os:macos": {"AR": ""},
    #     "//conditions:default": {},
    # }),
    configure_in_place = True,
    configure_options = [
        "--enable-shared=no",
        "--with-pic",
    ],
    lib_source = "@gzip//:all",
    # make_commands = [
    #     "make -j `nproc`",
    #     "make install",
    # ],
    # static_libraries = ["libgzip.a"],
)
