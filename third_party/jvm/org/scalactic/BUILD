load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_import(
    name = "scalactic",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect"
    ],
    jars = [
        "//external:jar/org/scalactic/scalactic_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


