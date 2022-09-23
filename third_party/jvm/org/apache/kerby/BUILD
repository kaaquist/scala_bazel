load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "kerb_admin",
    exports = [
        "//external:jar/org/apache/kerby/kerb_admin",
        ":kerb_server",
        ":kerb_util",
        ":kerby_xdr"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_client",
    exports = [
        "//external:jar/org/apache/kerby/kerb_client",
        ":kerb_common",
        ":kerb_core",
        ":kerb_util",
        ":kerby_config",
        ":token_provider"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_common",
    exports = [
        "//external:jar/org/apache/kerby/kerb_common",
        "//third_party/jvm/commons_io:commons_io",
        ":kerb_crypto",
        ":kerby_config"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_core",
    exports = [
        "//external:jar/org/apache/kerby/kerb_core",
        ":kerby_pkix"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_crypto",
    exports = [
        "//external:jar/org/apache/kerby/kerb_crypto",
        ":kerb_core",
        ":kerby_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_identity",
    exports = [
        "//external:jar/org/apache/kerby/kerb_identity",
        ":kerb_core",
        ":kerby_config"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_server",
    exports = [
        "//external:jar/org/apache/kerby/kerb_server",
        ":kerb_common",
        ":kerb_identity"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_simplekdc",
    exports = [
        "//external:jar/org/apache/kerby/kerb_simplekdc",
        ":kerb_admin",
        ":kerb_client"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerb_util",
    exports = [
        "//external:jar/org/apache/kerby/kerb_util",
        ":kerb_core",
        ":kerb_crypto",
        ":kerby_config"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerby_asn1",
    exports = [
        "//external:jar/org/apache/kerby/kerby_asn1"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerby_config",
    exports = [
        "//external:jar/org/apache/kerby/kerby_config",
        "//third_party/jvm/org/slf4j:slf4j_api"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerby_pkix",
    exports = [
        "//external:jar/org/apache/kerby/kerby_pkix",
        "//third_party/jvm/org/slf4j:slf4j_api",
        ":kerby_asn1",
        ":kerby_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerby_util",
    exports = [
        "//external:jar/org/apache/kerby/kerby_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "kerby_xdr",
    exports = [
        "//external:jar/org/apache/kerby/kerby_xdr"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "token_provider",
    exports = [
        "//external:jar/org/apache/kerby/token_provider",
        "//third_party/jvm/com/nimbusds:nimbus_jose_jwt",
        ":kerb_core"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


