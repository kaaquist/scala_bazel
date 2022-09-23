load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "hadoop_annotations",
    exports = [
        "//external:jar/org/apache/hadoop/hadoop_annotations"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "hadoop_auth",
    exports = [
        "//external:jar/org/apache/hadoop/hadoop_auth",
        "//third_party/jvm/com/google/guava:guava",
        "//third_party/jvm/com/nimbusds:nimbus_jose_jwt",
        "//third_party/jvm/commons_codec:commons_codec",
        "//third_party/jvm/log4j:log4j",
        "//third_party/jvm/net/minidev:json_smart",
        "//third_party/jvm/org/apache/curator:curator_framework",
        "//third_party/jvm/org/apache/httpcomponents:httpclient",
        "//third_party/jvm/org/apache/kerby:kerb_simplekdc",
        "//third_party/jvm/org/apache/zookeeper:zookeeper",
        "//third_party/jvm/org/slf4j:slf4j_api",
        "//third_party/jvm/org/slf4j:slf4j_log4j12"
    ],
    visibility = [
        "//third_party/jvm:__subpackages__"
    ]
)



java_library(
    name = "hadoop_common",
    exports = [
        "//external:jar/org/apache/hadoop/hadoop_common",
        "//third_party/jvm/com/fasterxml/jackson/core:jackson_databind",
        "//third_party/jvm/com/fasterxml/woodstox:woodstox_core",
        "//third_party/jvm/com/google/code/findbugs:jsr305",
        "//third_party/jvm/com/google/code/gson:gson",
        "//third_party/jvm/com/google/guava:guava",
        "//third_party/jvm/com/google/protobuf:protobuf_java",
        "//third_party/jvm/com/google/re2j:re2j",
        "//third_party/jvm/com/jcraft:jsch",
        "//third_party/jvm/com/sun/jersey:jersey_core",
        "//third_party/jvm/com/sun/jersey:jersey_json",
        "//third_party/jvm/com/sun/jersey:jersey_server",
        "//third_party/jvm/com/sun/jersey:jersey_servlet",
        "//third_party/jvm/commons_beanutils:commons_beanutils",
        "//third_party/jvm/commons_cli:commons_cli",
        "//third_party/jvm/commons_codec:commons_codec",
        "//third_party/jvm/commons_collections:commons_collections",
        "//third_party/jvm/commons_io:commons_io",
        "//third_party/jvm/commons_logging:commons_logging",
        "//third_party/jvm/commons_net:commons_net",
        "//third_party/jvm/dnsjava:dnsjava",
        "//third_party/jvm/javax/servlet/jsp:jsp_api",
        "//third_party/jvm/javax/servlet:javax_servlet_api",
        "//third_party/jvm/log4j:log4j",
        "//third_party/jvm/org/apache/avro:avro",
        "//third_party/jvm/org/apache/commons:commons_compress",
        "//third_party/jvm/org/apache/commons:commons_configuration2",
        "//third_party/jvm/org/apache/commons:commons_lang3",
        "//third_party/jvm/org/apache/commons:commons_math3",
        "//third_party/jvm/org/apache/commons:commons_text",
        "//third_party/jvm/org/apache/curator:curator_client",
        "//third_party/jvm/org/apache/curator:curator_recipes",
        "//third_party/jvm/org/apache/htrace:htrace_core4",
        "//third_party/jvm/org/apache/httpcomponents:httpclient",
        "//third_party/jvm/org/apache/kerby:kerb_simplekdc",
        "//third_party/jvm/org/apache/zookeeper:zookeeper",
        "//third_party/jvm/org/codehaus/woodstox:stax2_api",
        "//third_party/jvm/org/eclipse/jetty:jetty_server",
        "//third_party/jvm/org/eclipse/jetty:jetty_servlet",
        "//third_party/jvm/org/eclipse/jetty:jetty_util",
        "//third_party/jvm/org/eclipse/jetty:jetty_webapp",
        "//third_party/jvm/org/slf4j:slf4j_api",
        "//third_party/jvm/org/slf4j:slf4j_log4j12",
        ":hadoop_annotations",
        ":hadoop_auth"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "hadoop_hdfs",
    exports = [
        "//external:jar/org/apache/hadoop/hadoop_hdfs",
        "//third_party/jvm/com/fasterxml/jackson/core:jackson_databind",
        "//third_party/jvm/com/google/guava:guava",
        "//third_party/jvm/com/google/protobuf:protobuf_java",
        "//third_party/jvm/com/sun/jersey:jersey_core",
        "//third_party/jvm/com/sun/jersey:jersey_server",
        "//third_party/jvm/commons_cli:commons_cli",
        "//third_party/jvm/commons_codec:commons_codec",
        "//third_party/jvm/commons_daemon:commons_daemon",
        "//third_party/jvm/commons_io:commons_io",
        "//third_party/jvm/commons_logging:commons_logging",
        "//third_party/jvm/io/netty:netty",
        "//third_party/jvm/io/netty:netty_all",
        "//third_party/jvm/javax/servlet:javax_servlet_api",
        "//third_party/jvm/log4j:log4j",
        "//third_party/jvm/org/apache/htrace:htrace_core4",
        "//third_party/jvm/org/eclipse/jetty:jetty_server",
        "//third_party/jvm/org/eclipse/jetty:jetty_util",
        "//third_party/jvm/org/eclipse/jetty:jetty_util_ajax",
        "//third_party/jvm/org/fusesource/leveldbjni:leveldbjni_all"
    ],
    visibility = [
        "//visibility:public"
    ]
)


