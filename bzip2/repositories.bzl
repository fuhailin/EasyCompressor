"""A module defining the third party dependency bzip2"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def repo(COMMIT = "1.0.8"):
    maybe(
        http_archive,
        name = "bzip2",
        urls = [
            "https://www.sourceware.org/pub/bzip2/bzip2-{commit}.tar.gz".format(commit = COMMIT),
            "https://sourceware.org/pub/bzip2/bzip2-{commit}.tar.gz".format(commit = COMMIT),
        ],
        strip_prefix = "bzip2-{commit}".format(commit = COMMIT),
        build_file = Label("//bzip2:bzip2.BUILD"),
    )
