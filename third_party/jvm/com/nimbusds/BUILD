load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "nimbus_jose_jwt",
    exports = [
        "//external:jar/com/nimbusds/nimbus_jose_jwt",
        "//third_party/jvm/com/github/stephenc/jcip:jcip_annotations",
        "//third_party/jvm/net/minidev:json_smart"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


