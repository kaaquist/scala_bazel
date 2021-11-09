load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "logback_classic",
    exports = [
        "//external:jar/ch/qos/logback/logback_classic",
        "//third_party/jvm/org/slf4j:slf4j_api",
        ":logback_core"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "logback_core",
    exports = [
        "//external:jar/ch/qos/logback/logback_core"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


