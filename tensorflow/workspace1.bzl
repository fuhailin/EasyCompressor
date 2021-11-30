"""TensorFlow workspace initialization. Consult the WORKSPACE on how to use it."""

load("@tf_toolchains//toolchains:archives.bzl", "bazel_toolchains_archive")

def workspace():
    bazel_toolchains_archive()


# Alias so it can be loaded without assigning to a different symbol to prevent
# shadowing previous loads and trigger a buildifier warning.
tf_workspace1 = workspace
