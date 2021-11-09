# Do not edit. bazel-deps autogenerates this file from.
_JAVA_LIBRARY_TEMPLATE = """
java_library(
  name = "{name}",
  exports = [
      {exports}
  ],
  runtime_deps = [
    {runtime_deps}
  ],
  visibility = [
      "{visibility}"
  ]
)\n"""

_SCALA_IMPORT_TEMPLATE = """
scala_import(
    name = "{name}",
    exports = [
        {exports}
    ],
    jars = [
        {jars}
    ],
    runtime_deps = [
        {runtime_deps}
    ],
    visibility = [
        "{visibility}"
    ]
)
"""

_SCALA_LIBRARY_TEMPLATE = """
scala_library(
    name = "{name}",
    exports = [
        {exports}
    ],
    runtime_deps = [
        {runtime_deps}
    ],
    visibility = [
        "{visibility}"
    ]
)
"""


def _build_external_workspace_from_opts_impl(ctx):
    build_header = ctx.attr.build_header
    separator = ctx.attr.separator
    target_configs = ctx.attr.target_configs

    result_dict = {}
    for key, cfg in target_configs.items():
      build_file_to_target_name = key.split(":")
      build_file = build_file_to_target_name[0]
      target_name = build_file_to_target_name[1]
      if build_file not in result_dict:
        result_dict[build_file] = []
      result_dict[build_file].append(cfg)

    for key, file_entries in result_dict.items():
      build_file_contents = build_header + '\n\n'
      for build_target in file_entries:
        entry_map = {}
        for entry in build_target:
          elements = entry.split(separator)
          build_entry_key = elements[0]
          if elements[1] == "L":
            entry_map[build_entry_key] = [e for e in elements[2::] if len(e) > 0]
          elif elements[1] == "B":
            entry_map[build_entry_key] = (elements[2] == "true" or elements[2] == "True")
          else:
            entry_map[build_entry_key] = elements[2]

        exports_str = ""
        for e in entry_map.get("exports", []):
          exports_str += "\"" + e + "\",\n"

        jars_str = ""
        for e in entry_map.get("jars", []):
          jars_str += "\"" + e + "\",\n"

        runtime_deps_str = ""
        for e in entry_map.get("runtimeDeps", []):
          runtime_deps_str += "\"" + e + "\",\n"

        name = entry_map["name"].split(":")[1]
        if entry_map["lang"] == "java":
            build_file_contents += _JAVA_LIBRARY_TEMPLATE.format(name = name, exports=exports_str, runtime_deps=runtime_deps_str, visibility=entry_map["visibility"])
        elif entry_map["lang"].startswith("scala") and entry_map["kind"] == "import":
            build_file_contents += _SCALA_IMPORT_TEMPLATE.format(name = name, exports=exports_str, jars=jars_str, runtime_deps=runtime_deps_str, visibility=entry_map["visibility"])
        elif entry_map["lang"].startswith("scala") and entry_map["kind"] == "library":
            build_file_contents += _SCALA_LIBRARY_TEMPLATE.format(name = name, exports=exports_str, runtime_deps=runtime_deps_str, visibility=entry_map["visibility"])
        else:
            print(entry_map)

      ctx.file(ctx.path(key + "/BUILD"), build_file_contents, False)
    return None

build_external_workspace_from_opts = repository_rule(
    attrs = {
        "target_configs": attr.string_list_dict(mandatory = True),
        "separator": attr.string(mandatory = True),
        "build_header": attr.string(mandatory = True),
    },
    implementation = _build_external_workspace_from_opts_impl
)




def build_header():
 return """load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")"""

def list_target_data_separator():
 return "|||"

def list_target_data():
    return {
"third_party/jvm/ch/qos/logback:logback_classic": ["lang||||||java","name||||||//third_party/jvm/ch/qos/logback:logback_classic","visibility||||||//visibility:public","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||//third_party/jvm/ch/qos/logback:logback_core|||//third_party/jvm/org/slf4j:slf4j_api|||//external:jar/ch/qos/logback/logback_classic","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/ch/qos/logback:logback_core": ["lang||||||java","name||||||//third_party/jvm/ch/qos/logback:logback_core","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||//external:jar/ch/qos/logback/logback_core","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/com/typesafe:config": ["lang||||||java","name||||||//third_party/jvm/com/typesafe:config","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||//external:jar/com/typesafe/config","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_compatible": ["lang||||||java","name||||||//third_party/jvm/org/scalatest:scalatest_compatible","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||//external:jar/org/scalatest/scalatest_compatible","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/slf4j:slf4j_api": ["lang||||||java","name||||||//third_party/jvm/org/slf4j:slf4j_api","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||//external:jar/org/slf4j/slf4j_api","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scala_lang:scala_compiler": ["lang||||||scala/unmangled:2.12.11","name||||||//third_party/jvm/org/scala_lang:scala_compiler","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||@io_bazel_rules_scala_scala_compiler//:io_bazel_rules_scala_scala_compiler","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scala_lang:scala_library": ["lang||||||scala/unmangled:2.12.11","name||||||//third_party/jvm/org/scala_lang:scala_library","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||@io_bazel_rules_scala_scala_library//:io_bazel_rules_scala_scala_library","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scala_lang:scala_reflect": ["lang||||||scala/unmangled:2.12.11","name||||||//third_party/jvm/org/scala_lang:scala_reflect","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||@io_bazel_rules_scala_scala_reflect//:io_bazel_rules_scala_scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/com/chuusai:shapeless": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/com/chuusai:shapeless","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/com/chuusai/shapeless_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/typelevel:macro_compat","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/com/github/pureconfig:pureconfig_core": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/com/github/pureconfig:pureconfig_core","visibility||||||//visibility:public","kind||||||import","deps|||L|||","jars|||L|||//external:jar/com/github/pureconfig/pureconfig_core_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/com/github/pureconfig:pureconfig_macros|||//third_party/jvm/com/typesafe:config","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/com/github/pureconfig:pureconfig_generic": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/com/github/pureconfig:pureconfig_generic","visibility||||||//visibility:public","kind||||||import","deps|||L|||","jars|||L|||//external:jar/com/github/pureconfig/pureconfig_generic_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/com/github/pureconfig:pureconfig_core|||//third_party/jvm/com/chuusai:shapeless","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/com/github/pureconfig:pureconfig_macros": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/com/github/pureconfig:pureconfig_macros","visibility||||||//visibility:public","kind||||||import","deps|||L|||","jars|||L|||//external:jar/com/github/pureconfig/pureconfig_macros_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/com/typesafe/scala_logging:scala_logging": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/com/typesafe/scala_logging:scala_logging","visibility||||||//visibility:public","kind||||||import","deps|||L|||","jars|||L|||//external:jar/com/typesafe/scala_logging/scala_logging_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scala_lang:scala_reflect|||//third_party/jvm/org/slf4j:slf4j_api","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scala_lang/modules:scala_parser_combinators": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scala_lang/modules:scala_parser_combinators","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||@io_bazel_rules_scala_scala_parser_combinators//:io_bazel_rules_scala_scala_parser_combinators","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scala_lang/modules:scala_xml": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scala_lang/modules:scala_xml","visibility||||||//third_party/jvm:__subpackages__","kind||||||library","deps|||L|||","jars|||L|||","sources|||L|||","exports|||L|||@io_bazel_rules_scala_scala_xml//:io_bazel_rules_scala_scala_xml","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalactic:scalactic": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalactic:scalactic","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalactic/scalactic_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest","visibility||||||//visibility:public","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scalatest:scalatest_funsuite|||//third_party/jvm/org/scalatest:scalatest_funspec|||//third_party/jvm/org/scala_lang:scala_reflect|||//third_party/jvm/org/scalatest:scalatest_shouldmatchers|||//third_party/jvm/org/scalatest:scalatest_refspec|||//third_party/jvm/org/scalatest:scalatest_featurespec|||//third_party/jvm/org/scalatest:scalatest_propspec|||//third_party/jvm/org/scalatest:scalatest_mustmatchers|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scalatest:scalatest_freespec|||//third_party/jvm/org/scalatest:scalatest_flatspec|||//third_party/jvm/org/scalatest:scalatest_wordspec|||//third_party/jvm/org/scalatest:scalatest_diagrams|||//third_party/jvm/org/scalatest:scalatest_matchers_core","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_core": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_core","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_core_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_reflect|||//third_party/jvm/org/scala_lang/modules:scala_xml|||//third_party/jvm/org/scalatest:scalatest_compatible|||//third_party/jvm/org/scalactic:scalactic|||//third_party/jvm/org/scala_lang:scala_library","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_diagrams": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_diagrams","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_diagrams_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_featurespec": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_featurespec","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_featurespec_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_flatspec": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_flatspec","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_flatspec_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_freespec": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_freespec","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_freespec_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_funspec": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_funspec","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_funspec_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_funsuite": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_funsuite","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_funsuite_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_matchers_core": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_matchers_core","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_matchers_core_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scala_lang:scala_reflect|||//third_party/jvm/org/scalatest:scalatest_core","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_mustmatchers": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_mustmatchers","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_mustmatchers_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_matchers_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_propspec": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_propspec","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_propspec_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_refspec": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_refspec","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_refspec_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_shouldmatchers": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_shouldmatchers","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_shouldmatchers_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_matchers_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/scalatest:scalatest_wordspec": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/scalatest:scalatest_wordspec","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/scalatest/scalatest_wordspec_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library|||//third_party/jvm/org/scalatest:scalatest_core|||//third_party/jvm/org/scala_lang:scala_reflect","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"],
"third_party/jvm/org/typelevel:macro_compat": ["lang||||||scala:2.12.11","name||||||//third_party/jvm/org/typelevel:macro_compat","visibility||||||//third_party/jvm:__subpackages__","kind||||||import","deps|||L|||","jars|||L|||//external:jar/org/typelevel/macro_compat_2_12","sources|||L|||","exports|||L|||//third_party/jvm/org/scala_lang:scala_library","runtimeDeps|||L|||","processorClasses|||L|||","generatesApi|||B|||false","licenses|||L|||","generateNeverlink|||B|||false"]
 }


def build_external_workspace(name):
  return build_external_workspace_from_opts(name = name, target_configs = list_target_data(), separator = list_target_data_separator(), build_header = build_header())

