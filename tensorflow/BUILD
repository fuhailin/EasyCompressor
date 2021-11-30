# Description:
# TensorFlow is a computational framework, primarily for use in machine
# learning applications.

load(
    "//tensorflow:tensorflow.bzl",
    "if_google",
    "if_oss",
)

package(default_visibility = [":internal"])

licenses(["notice"])

config_setting(
    name = "windows",
    # Internal builds query the target OS.
    flag_values = if_google(
        {"//tools/cpp:cc_target_os": "windows"},
        {},
    ),
    # OSS builds query the CPU type.
    values = if_oss(
        {"cpu": "x64_windows"},
        {},
    ),
    visibility = ["//visibility:public"],
)