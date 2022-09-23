load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "jaxb_impl",
    exports = [
        "//external:jar/com/sun/xml/bind/jaxb_impl",
        "//third_party/jvm/javax/xml/bind:jaxb_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


