# Description
#    lzma is a general purpose data compression library https://tukaani.org/xz/
#    Public Domain
#    Referenced https://github.com/nelhage/rules_boost/blob/master/BUILD.lzma

load("@bazel_skylib//rules:copy_file.bzl", "copy_file")

copy_file(
    name = "copy_config",
    src = select({
        ":android": "@org_tensorflow//third_party/systemlibs:config.lzma-linux.h",
        ":linux": "@org_tensorflow//third_party/systemlibs:config.lzma-linux.h",
        ":osx_arm64": "@org_tensorflow//third_party/systemlibs:config.lzma-osx-arm64.h",
        ":osx_x86_64": "@org_tensorflow//third_party/systemlibs:config.lzma-osx-x86_64.h",
        ":windows": "@org_tensorflow//third_party/systemlibs:config.lzma-windows.h",
    }),
    out = "src/liblzma/api/config.h",  # minimize the number of exported include paths
)