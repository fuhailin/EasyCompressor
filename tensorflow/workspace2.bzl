"""TensorFlow workspace initialization. Consult the WORKSPACE on how to use it."""

# Import third party config rules.
load("//tensorflow:version_check.bzl", "check_bazel_version_at_least")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

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
        name = "org_bzip_bzip2",
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

    http_archive(
        name = "lz4",
        sha256 = "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc",
        strip_prefix = "lz4-1.9.2",
        build_file = Label("//third_party:lz4.BUILD"),
        urls = ["https://github.com/lz4/lz4/archive/v1.9.2.tar.gz"],
    )

    http_archive(
        name = "org_lzma_lzma",
        build_file = Label("//third_party/lzma:lzma.BUILD"),
        sha256 = "ae197f65cff62cbd2d648e282dca648f02402d8f6b5a81be0ff913d0598de9bb",
        strip_prefix = "xz-5.2.3",
        urls = ["https://github.com/xz-mirror/xz/archive/v5.2.3.tar.gz"],
    )

    http_archive(
        name = "com_github_google_snappy",
        build_file = Label("//third_party:snappy.BUILD"),
        sha256 = "75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7",
        strip_prefix = "snappy-1.1.9",
        urls = ["https://github.com/google/snappy/archive/1.1.9.tar.gz"],
    )

    http_archive(
        name = "com_github_facebook_zstd",
        urls = [
            "https://github.com/facebook/zstd/archive/v1.5.0.tar.gz",
        ],
        strip_prefix = "zstd-1.5.0",
        build_file = Label("//third_party:zstd.BUILD"),
    )

    COMMIT = "1.2.11"
    http_archive(
        name = "zlib",
        build_file = Label("//third_party:zlib.BUILD"),
        sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
        strip_prefix = "zlib-{commit}".format(commit = COMMIT),
        urls = [
            "https://zlib.net/zlib-{commit}.tar.gz".format(commit = COMMIT),
        ],
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
