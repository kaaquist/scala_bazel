load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_import(
    name = "shapeless",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/typelevel:macro_compat"
    ],
    jars = [
        "//external:jar/com/chuusai/shapeless_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


