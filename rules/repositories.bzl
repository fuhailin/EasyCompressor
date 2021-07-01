"""A module defining the third party dependency rules"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def rules_cc_repo():
    COMMIT = "daf6ace7cfeacd6a83e9ff2ed659f416537b6c74"
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

def rules_foreign_cc_repo():
    COMMIT = "6d1d16d3bb1c09a5154b483de902755ce1f05746"
    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "031f454a5c8979bec6c2f8df906041a16efe208b7613da8ac6c58b06158e1c68",
        urls = [
            # "https://3rdcpp-1256340525.cos.ap-beijing.myqcloud.com/rules_foreign_cc-{commit}.tar.gz".format(commit = COMMIT),
            "https://github.com.cnpmjs.org/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://github.91chifun.workers.dev//https://github.com/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://hub.fastgit.org/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
            "https://github.com/bazelbuild/rules_foreign_cc/archive/{commit}.zip".format(commit = COMMIT),
        ],
        strip_prefix = "rules_foreign_cc-" + COMMIT,
    )
