"""A module defining the third party dependency rules"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def rules_cc_repo(COMMIT = "daf6ace7cfeacd6a83e9ff2ed659f416537b6c74"):
    # project_name = "C++ rules for Bazel",
    # project_desc = "Bazel rules for the C++ language",
    # project_url = "https://github.com/bazelbuild/rules_cc",
    maybe(
        http_archive,
        name = "rules_cc",
        sha256 = "b295cad8c5899e371dde175079c0a2cdc0151f5127acc92366a8c986beb95c76",
        urls = [
            "https://github.com.cnpmjs.org/bazelbuild/rules_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://hub.fastgit.org/bazelbuild/rules_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://github.com/bazelbuild/rules_cc/archive/{commit}.zip".format(commit = COMMIT),
        ],
        strip_prefix = "rules_cc-" + COMMIT,
    )

def rules_foreign_cc_repo(COMMIT = "main"):
    maybe(
        http_archive,
        name = "rules_foreign_cc",
        urls = [
            "https://github.com.cnpmjs.org/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://github.91chifun.workers.dev//https://github.com/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://hub.fastgit.org/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://github.com/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
        ],
        strip_prefix = "rules_foreign_cc-" + COMMIT,
    )
