"""TensorFlow workspace initialization. Consult the WORKSPACE on how to use it."""

# Import third party config rules.
load("//tensorflow:version_check.bzl", "check_bazel_version_at_least")
load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Import external repository rules.
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
load("@rules_cc//cc:repositories.bzl", "rules_cc_dependencies")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

# Define all external repositories required by TensorFlow
def _tf_repositories():
    """All external dependencies for TF builds."""

    # To update any of the dependencies bellow:
    # a) update URL and strip_prefix to the new git commit hash
    # b) get the sha256 hash of the commit by running:
    #    curl -L <url> | sha256sum
    # and update the sha256 with the result.

    
    http_archive(
        name = "bzip2",
        build_file = Label("//third_party:bzip2.BUILD"),
        strip_prefix = "bzip2-1.0.8",
        urls = [
            "https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz",
            "https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz",
        ],
    )

    http_archive(
        name = "org_gnu_gzip",
        urls = [
            "https://ftp.gnu.org/gnu/gzip/gzip-1.11.tar.gz",
        ],
        strip_prefix = "gzip-1.11",
        build_file = Label("//third_party:gzip.BUILD"),
    )

    tf_http_archive(
        name = "lz4",
        sha256 = "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc",
        strip_prefix = "lz4-1.9.2",
        build_file = "//third_party:lz4.BUILD",
        urls = tf_mirror_urls("https://github.com/lz4/lz4/archive/v1.9.2.tar.gz"),
    )

    tf_http_archive(
        name = "org_lzma_lzma",
        build_file = "//third_party:lzma.BUILD",
        sha256 = "ae197f65cff62cbd2d648e282dca648f02402d8f6b5a81be0ff913d0598de9bb",
        strip_prefix = "xz-5.2.3",
        urls = tf_mirror_urls("https://github.com/xz-mirror/xz/archive/v5.2.3.tar.gz"),
    )

    tf_http_archive(
        name = "snappy",
        build_file = "//third_party:snappy.BUILD",
        sha256 = "16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f",
        strip_prefix = "snappy-1.1.8",
        system_build_file = "//third_party/systemlibs:snappy.BUILD",
        urls = tf_mirror_urls("https://github.com/google/snappy/archive/1.1.8.tar.gz"),
    )

    tf_http_archive(
        name = "zlib",
        build_file = "//third_party:zlib.BUILD",
        sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
        strip_prefix = "zlib-1.2.11",
        system_build_file = "//third_party/systemlibs:zlib.BUILD",
        urls = tf_mirror_urls("https://zlib.net/zlib-1.2.11.tar.gz"),
    )

    http_archive(
        name = "zstd",
        urls = [
            "https://github.com/facebook/zstd/archive/v1.5.0.tar.gz",
        ],
        strip_prefix = "zstd-1.5.0",
        build_file = Label("//third_party:zstd.BUILD"),
    )

def workspace():
    # Check the bazel version before executing any repository rules, in case
    # those rules rely on the version we require here.
    check_bazel_version_at_least("1.0.0")

    # Import all other repositories. This should happen before initializing
    # any external repositories, because those come with their own
    # dependencies. Those recursive dependencies will only be imported if they
    # don't already exist (at least if the external repository macros were
    # written according to common practice to query native.existing_rule()).
    _tf_repositories()

    # TODO(rostam): Delete after the release of Bazel built-in cc_shared_library.
    # Initializes Bazel package rules' external dependencies.
    rules_pkg_dependencies()
    rules_cc_dependencies()
    rules_foreign_cc_dependencies()


# Alias so it can be loaded without assigning to a different symbol to prevent
# shadowing previous loads and trigger a buildifier warning.
tf_workspace2 = workspace
