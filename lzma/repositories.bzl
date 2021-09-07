"""A module defining the third party dependency lzma"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def repo(COMMIT = "5.2.3"):
    maybe(
        http_archive,
        name = "org_lzma_lzma",
        build_file = Label("//lzma:lzma.BUILD"),
        strip_prefix = "xz-{commit}".format(commit = COMMIT),
        urls = [
            "https://github.com/xz-mirror/xz/archive/v{}.tar.gz".format(COMMIT),
        ],
    )
