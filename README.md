# rules_compressor
⚡ A compression library that implements many compression supported by bazel

### [Bazel](https://bazel.build/)

To use rules_compressor within a project which uses the [Bazel](https://bazel.build/) build tool, add the following lines to your `WORKSPACE` file:

```python
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "rules_compressor",
        branch = "main",
        remote = "https://github.com/fuhailin/rules_compressor.git",
)

load("@rules_compressor//tensorflow:workspace2.bzl", "tf_workspace2")

tf_workspace2()
```

You can then add `targets` to the deps section of a `cc_binary` or `cc_library` rule. Here’s a simple example:

```python
build_test(
    name = "build_test_rules_compressor",
    targets = [
        "@lz4",
        "@org_lzma_lzma//:lzma",
        "@snappy",
        "@zlib",
        "@zstd//:zstd",
    ],
    visibility = ["//:__pkg__"],
)
```

