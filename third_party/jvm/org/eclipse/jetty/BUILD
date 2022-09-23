load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "jetty_http",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_http",
        ":jetty_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_io",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_io",
        ":jetty_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_security",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_security",
        ":jetty_server"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_server",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_server",
        "//third_party/jvm/javax/servlet:javax_servlet_api",
        ":jetty_http",
        ":jetty_io"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_servlet",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_servlet",
        ":jetty_security"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_util",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_util_ajax",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_util_ajax",
        ":jetty_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_webapp",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_webapp",
        ":jetty_servlet",
        ":jetty_xml"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "jetty_xml",
    exports = [
        "//external:jar/org/eclipse/jetty/jetty_xml",
        ":jetty_util"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)


