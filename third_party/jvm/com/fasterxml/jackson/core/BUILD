load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "jackson_annotations",
    exports = [
        "//external:jar/com/fasterxml/jackson/core/jackson_annotations"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jackson_core",
    exports = [
        "//external:jar/com/fasterxml/jackson/core/jackson_core"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jackson_databind",
    exports = [
        "//external:jar/com/fasterxml/jackson/core/jackson_databind",
        ":jackson_annotations",
        ":jackson_core"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


