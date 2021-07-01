load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def repo():
    COMMIT = "1.10"
    maybe(
        http_archive,
        name = "gzip",
        urls = [
            "https://ftp.gnu.org/gnu/gzip/gzip-{commit}.tar.gz".format(commit = COMMIT),
        ],
        strip_prefix = "gzip-" + COMMIT,
        build_file = Label("//gzip:gzip.BUILD"),
    )
