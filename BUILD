load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_binary(
    srcs = glob(["src/main/scala/com/happy/*.scala"]),
    name = "App",
    main_class = "com.happy.Main"
)
scala_test(
    name = "test-main",
    srcs = ["src/test/scala/com/happy/MainSpec.scala"],
    deps = [":App"]
)