load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "parquet_avro",
    exports = [
        "//external:jar/org/apache/parquet/parquet_avro",
        "//third_party/jvm/it/unimi/dsi:fastutil",
        "//third_party/jvm/org/apache/avro:avro",
        ":parquet_column",
        ":parquet_format",
        ":parquet_hadoop"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "parquet_column",
    exports = [
        "//external:jar/org/apache/parquet/parquet_column",
        "//third_party/jvm/commons_codec:commons_codec",
        ":parquet_common",
        ":parquet_encoding"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "parquet_common",
    exports = [
        "//external:jar/org/apache/parquet/parquet_common",
        "//third_party/jvm/org/slf4j:slf4j_api",
        ":parquet_format"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "parquet_encoding",
    exports = [
        "//external:jar/org/apache/parquet/parquet_encoding",
        "//third_party/jvm/commons_codec:commons_codec",
        ":parquet_common"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "parquet_format",
    exports = [
        "//external:jar/org/apache/parquet/parquet_format",
        "//third_party/jvm/org/slf4j:slf4j_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "parquet_hadoop",
    exports = [
        "//external:jar/org/apache/parquet/parquet_hadoop",
        "//third_party/jvm/commons_pool:commons_pool",
        "//third_party/jvm/org/codehaus/jackson:jackson_core_asl",
        "//third_party/jvm/org/codehaus/jackson:jackson_mapper_asl",
        "//third_party/jvm/org/xerial/snappy:snappy_java",
        ":parquet_column",
        ":parquet_format",
        ":parquet_jackson"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "parquet_jackson",
    exports = [
        "//external:jar/org/apache/parquet/parquet_jackson"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


