load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "config",
    exports = [
        "//external:jar/com/typesafe/config"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


