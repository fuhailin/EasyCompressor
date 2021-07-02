load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@rules_cc//cc:repositories.bzl", "rules_cc_dependencies")

def easycompressor_deps():
    rules_cc_dependencies()

    # rules_foreign_cc_dependencies()
    rules_foreign_cc_dependencies(register_preinstalled_tools = False)
