# buildifier: disable=module-docstring
load("//rules:repositories.bzl", "rules_cc_repo", "rules_foreign_cc_repo")
load("//bzip2:repositories.bzl", bzip2 = "repo")
load("//lz4:repositories.bzl", lz4 = "repo")
load("//snappy:repositories.bzl", snappy = "repo")
load("//zlib:repositories.bzl", zlib = "repo")
load("//zstd:repositories.bzl", zstd = "repo")
load("//gzip:repositories.bzl", gzip = "repo")

def repositories():
    """Load all repositories needed for the targets of rules_foreign_cc_examples_third_party"""

    # load rules
    rules_cc_repo()
    rules_foreign_cc_repo()
    bzip2()
    lz4()
    zlib()
    zstd()
    snappy()
    gzip()
