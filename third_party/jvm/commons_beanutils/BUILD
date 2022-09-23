load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "commons_beanutils",
    exports = [
        "//external:jar/commons_beanutils/commons_beanutils",
        "//third_party/jvm/commons_collections:commons_collections",
        "//third_party/jvm/commons_logging:commons_logging"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


