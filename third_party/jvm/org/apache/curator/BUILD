load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "curator_client",
    exports = [
        "//external:jar/org/apache/curator/curator_client",
        "//third_party/jvm/com/google/guava:guava",
        "//third_party/jvm/org/apache/zookeeper:zookeeper",
        "//third_party/jvm/org/slf4j:slf4j_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "curator_framework",
    exports = [
        "//external:jar/org/apache/curator/curator_framework",
        ":curator_client"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "curator_recipes",
    exports = [
        "//external:jar/org/apache/curator/curator_recipes",
        ":curator_framework"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


