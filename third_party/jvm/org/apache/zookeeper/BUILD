load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "zookeeper",
    exports = [
        "//external:jar/org/apache/zookeeper/zookeeper",
        "//third_party/jvm/io/netty:netty",
        "//third_party/jvm/jline:jline",
        "//third_party/jvm/log4j:log4j",
        "//third_party/jvm/org/apache/yetus:audience_annotations",
        "//third_party/jvm/org/slf4j:slf4j_api",
        "//third_party/jvm/org/slf4j:slf4j_log4j12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


