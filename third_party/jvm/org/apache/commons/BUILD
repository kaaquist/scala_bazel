load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "commons_compress",
    exports = [
        "//external:jar/org/apache/commons/commons_compress"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "commons_configuration2",
    exports = [
        "//external:jar/org/apache/commons/commons_configuration2",
        "//third_party/jvm/commons_logging:commons_logging"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "commons_lang3",
    exports = [
        "//external:jar/org/apache/commons/commons_lang3"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "commons_math3",
    exports = [
        "//external:jar/org/apache/commons/commons_math3"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "commons_text",
    exports = [
        "//external:jar/org/apache/commons/commons_text",
        ":commons_lang3"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


