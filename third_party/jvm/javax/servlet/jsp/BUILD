load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "jsp_api",
    exports = [
        "//external:jar/javax/servlet/jsp/jsp_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


