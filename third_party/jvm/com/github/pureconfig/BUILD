load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_import(
    name = "pureconfig_core",
    exports = [
        "//third_party/jvm/com/typesafe:config",
        "//third_party/jvm/org/scala_lang:scala_library",
        ":pureconfig_macros"
    ],
    jars = [
        "//external:jar/com/github/pureconfig/pureconfig_core_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "pureconfig_generic",
    exports = [
        "//third_party/jvm/com/chuusai:shapeless",
        "//third_party/jvm/org/scala_lang:scala_library",
        ":pureconfig_core"
    ],
    jars = [
        "//external:jar/com/github/pureconfig/pureconfig_generic_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "pureconfig_macros",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library"
    ],
    jars = [
        "//external:jar/com/github/pureconfig/pureconfig_macros_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)


