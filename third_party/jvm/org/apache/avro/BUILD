load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "avro",
    exports = [
        "//external:jar/org/apache/avro/avro",
        "//third_party/jvm/com/fasterxml/jackson/core:jackson_core",
        "//third_party/jvm/com/fasterxml/jackson/core:jackson_databind",
        "//third_party/jvm/org/apache/commons:commons_compress",
        "//third_party/jvm/org/slf4j:slf4j_api"
    ],
    visibility = [
        "//visibility:public"
    ]
)


