load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_library(
    name = "scala_compiler",
    exports = [
        "@io_bazel_rules_scala_scala_compiler//:io_bazel_rules_scala_scala_compiler"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_library(
    name = "scala_library",
    exports = [
        "@io_bazel_rules_scala_scala_library//:io_bazel_rules_scala_scala_library"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_library(
    name = "scala_reflect",
    exports = [
        "@io_bazel_rules_scala_scala_reflect//:io_bazel_rules_scala_scala_reflect"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


