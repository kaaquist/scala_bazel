load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "jaxb_api",
    exports = [
        "//external:jar/javax/xml/bind/jaxb_api",
        "//third_party/jvm/javax/activation:activation",
        "//third_party/jvm/javax/xml/stream:stax_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


