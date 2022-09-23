load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "woodstox_core",
    exports = [
        "//external:jar/com/fasterxml/woodstox/woodstox_core",
        "//third_party/jvm/org/codehaus/woodstox:stax2_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


