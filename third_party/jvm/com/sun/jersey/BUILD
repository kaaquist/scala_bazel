load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "jersey_core",
    exports = [
        "//external:jar/com/sun/jersey/jersey_core",
        "//third_party/jvm/javax/ws/rs:jsr311_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jersey_json",
    exports = [
        "//external:jar/com/sun/jersey/jersey_json",
        "//third_party/jvm/com/sun/xml/bind:jaxb_impl",
        "//third_party/jvm/org/codehaus/jackson:jackson_core_asl",
        "//third_party/jvm/org/codehaus/jackson:jackson_jaxrs",
        "//third_party/jvm/org/codehaus/jackson:jackson_mapper_asl",
        "//third_party/jvm/org/codehaus/jackson:jackson_xc",
        "//third_party/jvm/org/codehaus/jettison:jettison",
        ":jersey_core"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jersey_server",
    exports = [
        "//external:jar/com/sun/jersey/jersey_server",
        ":jersey_core"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jersey_servlet",
    exports = [
        "//external:jar/com/sun/jersey/jersey_servlet",
        ":jersey_server"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


