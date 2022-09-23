load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary", "scala_library", "scala_test")
exports_files(["update_dependencies.sh"])

scala_binary(
    name = "App",
    srcs = glob(["src/main/scala/**/*.scala"]),
    main_class = "com.happy.Main",
    resources = glob(["src/main/resources/application.conf"]),
    deps = [
        "//third_party/jvm/com/github/pureconfig:pureconfig_core",
        "//third_party/jvm/com/github/pureconfig:pureconfig_generic",
        "//third_party/jvm/com/github/pureconfig:pureconfig_macros",
        "//third_party/jvm/com/typesafe/scala_logging:scala_logging",
        "//third_party/jvm/ch/qos/logback:logback_classic",
        "//third_party/jvm/org/apache/avro:avro",
        "//third_party/jvm/commons_io:commons_io",
        "//third_party/jvm/org/apache/parquet:parquet_avro",
        "//third_party/jvm/org/apache/hadoop:hadoop_hdfs",
        "//third_party/jvm/org/apache/hadoop:hadoop_common",
    ],
)

scala_test(
    name = "test-main",
    srcs = ["src/test/scala/com/happy/MainSpec.scala"],
    deps = [":App",
            "//third_party/jvm/com/github/pureconfig:pureconfig_core",
            "//third_party/jvm/com/github/pureconfig:pureconfig_generic",
            "//third_party/jvm/com/github/pureconfig:pureconfig_macros",
            "//third_party/jvm/com/typesafe/scala_logging:scala_logging",
            "//third_party/jvm/ch/qos/logback:logback_classic",
            "//third_party/jvm/org/apache/avro:avro",
            "//third_party/jvm/commons_io:commons_io",
            "//third_party/jvm/org/apache/parquet:parquet_avro",
            "//third_party/jvm/org/apache/hadoop:hadoop_hdfs",
            "//third_party/jvm/org/apache/hadoop:hadoop_common",
            ],
)

load("@rules_java//java:defs.bzl", "java_binary")

sh_binary(
    name = "dependencies",
    srcs = ["//:update_dependencies.sh"],
    tags = [
        "manual",
    ],
)
