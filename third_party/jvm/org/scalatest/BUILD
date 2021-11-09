load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_import(
    name = "scalatest",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core",
        ":scalatest_diagrams",
        ":scalatest_featurespec",
        ":scalatest_flatspec",
        ":scalatest_freespec",
        ":scalatest_funspec",
        ":scalatest_funsuite",
        ":scalatest_matchers_core",
        ":scalatest_mustmatchers",
        ":scalatest_propspec",
        ":scalatest_refspec",
        ":scalatest_shouldmatchers",
        ":scalatest_wordspec"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "scalatest_compatible",
    exports = [
        "//external:jar/org/scalatest/scalatest_compatible"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_core",
    exports = [
        "//third_party/jvm/org/scala_lang/modules:scala_xml",
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        "//third_party/jvm/org/scalactic:scalactic",
        ":scalatest_compatible"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_core_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_diagrams",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_diagrams_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_featurespec",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_featurespec_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_flatspec",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_flatspec_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_freespec",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_freespec_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_funspec",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_funspec_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_funsuite",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_funsuite_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_matchers_core",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_matchers_core_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_mustmatchers",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_matchers_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_mustmatchers_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_propspec",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_propspec_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_refspec",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_refspec_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_shouldmatchers",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_matchers_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_shouldmatchers_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalatest_wordspec",
    exports = [
        "//third_party/jvm/org/scala_lang:scala_library",
        "//third_party/jvm/org/scala_lang:scala_reflect",
        ":scalatest_core"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_wordspec_2_12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


