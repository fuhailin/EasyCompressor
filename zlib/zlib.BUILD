load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "zlib",
    build_args = [
        "--verbose",
        "-j `nproc`",
    ],
    cache_entries = {
        "CMAKE_CXX_COMPILER_FORCED": "on",
        "CMAKE_C_COMPILER_FORCED": "on",
        "SKIP_BUILD_EXAMPLES": "on",
        "BUILD_SHARED_LIBS": "off",

        # The following entries are for zlib-ng. Since zlib and zlib-ng are compatible source
        # codes and CMake ignores unknown cache entries, it is fine to combine it into one
        # dictionary.
        #
        # Reference: https://github.com/zlib-ng/zlib-ng#build-options.
        "ZLIB_COMPAT": "on",
        "ZLIB_ENABLE_TESTS": "off",

        # Warning: Turning WITH_OPTIM to "on" doesn't pass ZlibCompressorImplTest.CallingChecksum.
        "WITH_OPTIM": "on",
        # However turning off SSE4 fixes it.
        "WITH_SSE4": "off",

        # Warning: Turning WITH_NEW_STRATEGIES to "on" doesn't pass gzip compressor fuzz test.
        # Turning this off means falling into NO_QUICK_STRATEGY route.
        "WITH_NEW_STRATEGIES": "off",

        # Only allow aligned address.
        # Reference: https://github.com/zlib-ng/zlib-ng#advanced-build-options.
        "UNALIGNED_OK": "off",
    },
    generate_args = select({
        "@platforms//os:windows": ["-GNinja"],
        "//conditions:default": [],
    }),
    lib_source = ":all_srcs",
    out_static_libs = select({
        "@platforms//os:windows": ["zlibstatic.lib"],
        # "@platforms//os:windows_x86_64": ["zlib.lib"],
        "//conditions:default": ["libz.a"],
    }),
)
