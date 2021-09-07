load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@rules_cc//cc:repositories.bzl", "rules_cc_dependencies")

def rules_compressor_deps():
    rules_cc_dependencies()
    rules_foreign_cc_dependencies()
