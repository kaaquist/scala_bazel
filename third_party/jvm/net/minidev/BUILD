load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "accessors_smart",
    exports = [
        "//external:jar/net/minidev/accessors_smart",
        "//third_party/jvm/org/ow2/asm:asm"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "json_smart",
    exports = [
        "//external:jar/net/minidev/json_smart",
        ":accessors_smart"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


