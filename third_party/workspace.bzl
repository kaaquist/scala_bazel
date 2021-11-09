# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output = ctx.path("jar/%s" % jar_name),
        url = ctx.attr.urls,
        sha256 = ctx.attr.sha256,
        executable = False
    )
    src_name = "%s-sources.jar" % ctx.name
    srcjar_attr = ""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output = ctx.path("jar/%s" % src_name),
            url = ctx.attr.src_urls,
            sha256 = ctx.attr.src_sha256,
            executable = False
        )
        srcjar_attr = '\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "ch.qos.logback:logback-classic:1.2.3", "lang": "java", "sha1": "7c4f3c474fb2c041d8028740440937705ebb473a", "sha256": "fb53f8539e7fcb8f093a56e138112056ec1dc809ebb020b59d8a36a5ebac37e0", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar", "source": {"sha1": "cfd5385e0c5ed1c8a5dce57d86e79cf357153a64", "sha256": "480cb5e99519271c9256716d4be1a27054047435ff72078d9deae5c6a19f63eb", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3-sources.jar"} , "name": "ch_qos_logback_logback_classic", "actual": "@ch_qos_logback_logback_classic//jar", "bind": "jar/ch/qos/logback/logback_classic"},
    {"artifact": "ch.qos.logback:logback-core:1.2.3", "lang": "java", "sha1": "864344400c3d4d92dfeb0a305dc87d953677c03c", "sha256": "5946d837fe6f960c02a53eda7a6926ecc3c758bbdd69aa453ee429f858217f22", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3.jar", "source": {"sha1": "3ebabe69eba0196af9ad3a814f723fb720b9101e", "sha256": "1f69b6b638ec551d26b10feeade5a2b77abe347f9759da95022f0da9a63a9971", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3-sources.jar"} , "name": "ch_qos_logback_logback_core", "actual": "@ch_qos_logback_logback_core//jar", "bind": "jar/ch/qos/logback/logback_core"},
    {"artifact": "com.chuusai:shapeless_2.12:2.3.3", "lang": "scala", "sha1": "6041e2c4871650c556a9c6842e43c04ed462b11f", "sha256": "312e301432375132ab49592bd8d22b9cd42a338a6300c6157fb4eafd1e3d5033", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/chuusai/shapeless_2.12/2.3.3/shapeless_2.12-2.3.3.jar", "source": {"sha1": "02511271188a92962fcf31a9a217b8122f75453a", "sha256": "2d53fea1b1ab224a4a731d99245747a640deaa6ef3912c253666aa61287f3d63", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/chuusai/shapeless_2.12/2.3.3/shapeless_2.12-2.3.3-sources.jar"} , "name": "com_chuusai_shapeless_2_12", "actual": "@com_chuusai_shapeless_2_12//jar:file", "bind": "jar/com/chuusai/shapeless_2_12"},
    {"artifact": "com.github.pureconfig:pureconfig-core_2.12:0.11.1", "lang": "scala", "sha1": "5dbffdcf8f23ce7ed7106b4641f12c50fcc0a050", "sha256": "af62bd8d78e128f2240636c688b9ccf96aadb9d72c6a10488357b3b5482fdae8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/github/pureconfig/pureconfig-core_2.12/0.11.1/pureconfig-core_2.12-0.11.1.jar", "source": {"sha1": "26af36aee5e872fb907c3f56a0c9c4df02196e2a", "sha256": "889eb1123fbb99e9e1d07d7165b760e948685e18e0650ecb968e65defb73b73b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/github/pureconfig/pureconfig-core_2.12/0.11.1/pureconfig-core_2.12-0.11.1-sources.jar"} , "name": "com_github_pureconfig_pureconfig_core_2_12", "actual": "@com_github_pureconfig_pureconfig_core_2_12//jar:file", "bind": "jar/com/github/pureconfig/pureconfig_core_2_12"},
    {"artifact": "com.github.pureconfig:pureconfig-generic_2.12:0.11.1", "lang": "scala", "sha1": "4cfb47bdabe62a4047e8ccc716bd62817e01d32b", "sha256": "cdfbb04c825348ca676391787fc15f46e0bb13da3090fbb31400f7571dc6eea6", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/github/pureconfig/pureconfig-generic_2.12/0.11.1/pureconfig-generic_2.12-0.11.1.jar", "source": {"sha1": "0357f88b1135be3b61a7a5f350dbd6d938719d6b", "sha256": "ffe4e37d2bce08e06a4fa46bab48fd5f163040a92537147a91c335d8d4eb9ee5", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/github/pureconfig/pureconfig-generic_2.12/0.11.1/pureconfig-generic_2.12-0.11.1-sources.jar"} , "name": "com_github_pureconfig_pureconfig_generic_2_12", "actual": "@com_github_pureconfig_pureconfig_generic_2_12//jar:file", "bind": "jar/com/github/pureconfig/pureconfig_generic_2_12"},
    {"artifact": "com.github.pureconfig:pureconfig-macros_2.12:0.11.1", "lang": "scala", "sha1": "710542633cad773574cd9634f401eee4e5173a23", "sha256": "99e00517e42982d0ea94d32009310a09021f6380dc5ee3d226c01b5d8bb23e60", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/github/pureconfig/pureconfig-macros_2.12/0.11.1/pureconfig-macros_2.12-0.11.1.jar", "source": {"sha1": "c175d7c5223d4e08a5d37d2cbeca61059b342dac", "sha256": "434036d3964d70364dd71e23e46c1b039a579e39aee99c17f2d583a9b12d3654", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/github/pureconfig/pureconfig-macros_2.12/0.11.1/pureconfig-macros_2.12-0.11.1-sources.jar"} , "name": "com_github_pureconfig_pureconfig_macros_2_12", "actual": "@com_github_pureconfig_pureconfig_macros_2_12//jar:file", "bind": "jar/com/github/pureconfig/pureconfig_macros_2_12"},
    {"artifact": "com.typesafe.scala-logging:scala-logging_2.12:3.9.4", "lang": "scala", "sha1": "63be4e252677d5de9742cdfc0eada82420f142f0", "sha256": "57fc0b1be2128e2f6741fc63722d4a9bbfa63cc57fb03ada63118394b615b558", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/scala-logging/scala-logging_2.12/3.9.4/scala-logging_2.12-3.9.4.jar", "source": {"sha1": "aa0aacdecec1eed2d9317f0ef4d822aba6b22400", "sha256": "2c403cee1cf4a82f15c42d411f7694432d5c3da4be08049eee8b4834431c262f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/scala-logging/scala-logging_2.12/3.9.4/scala-logging_2.12-3.9.4-sources.jar"} , "name": "com_typesafe_scala_logging_scala_logging_2_12", "actual": "@com_typesafe_scala_logging_scala_logging_2_12//jar:file", "bind": "jar/com/typesafe/scala_logging/scala_logging_2_12"},
    {"artifact": "com.typesafe:config:1.3.4", "lang": "java", "sha1": "d0b3799b8e3a65c7b58c2aab9963603e687e2f91", "sha256": "8aa8931d8143154f86d393d4a85cfa207a884f16469cdf314dc8d6abba3f1438", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/config/1.3.4/config-1.3.4.jar", "source": {"sha1": "92987ecc1f26527345e8436d37804babdf640288", "sha256": "fad62d6f8ac7d04a6ed896c6fd8ff5d1ce7a5e608cd3c4b66f187e05ff08af0a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/config/1.3.4/config-1.3.4-sources.jar"} , "name": "com_typesafe_config", "actual": "@com_typesafe_config//jar", "bind": "jar/com/typesafe/config"},
    {"artifact": "org.scalactic:scalactic_2.12:3.2.3", "lang": "scala", "sha1": "0a67ccc40a4e01cb87153c45d0bbbe38459283cf", "sha256": "ae90b144db41b2947f85c926f218e0f4821cb5c4e896050b05dbdc8d8976a8e9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.12/3.2.3/scalactic_2.12-3.2.3.jar", "source": {"sha1": "702d48988d5ab0974025de6c00b6701582d241aa", "sha256": "e7ac7b33c26c6310cccc162341e5fa0c09d32ab82387ef1c544a73259071a789", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.12/3.2.3/scalactic_2.12-3.2.3-sources.jar"} , "name": "org_scalactic_scalactic_2_12", "actual": "@org_scalactic_scalactic_2_12//jar:file", "bind": "jar/org/scalactic/scalactic_2_12"},
    {"artifact": "org.scalatest:scalatest-compatible:3.2.3", "lang": "java", "sha1": "d4c9f6af285874dbb11a2f3d5f6ccfcdf03bdaf3", "sha256": "78d08ea4e51ecaf33b66daeb10342f2794906f46eb0c5e1b0b26fa0f65a50a20", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-compatible/3.2.3/scalatest-compatible-3.2.3.jar", "source": {"sha1": "49a08233b53fbfa2ddc6225e35607d15b528f7f1", "sha256": "0bc33a5eeb862128718005a7a46b29becfb04d4d6e70e9a52d43e476f4027af4", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-compatible/3.2.3/scalatest-compatible-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_compatible", "actual": "@org_scalatest_scalatest_compatible//jar", "bind": "jar/org/scalatest/scalatest_compatible"},
    {"artifact": "org.scalatest:scalatest-core_2.12:3.2.3", "lang": "scala", "sha1": "26715f0464601b437ea9e2136066f4e7137b831a", "sha256": "db7679d95c56922cc30ba86b06af43bcd124ad5815e861f8d6be6a456d9ef36c", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-core_2.12/3.2.3/scalatest-core_2.12-3.2.3.jar", "source": {"sha1": "5c0799860d4efaf7c999f9e00fa2316904aa3363", "sha256": "48f2a735cf1eec2b6dd0a01c5626398dacb41998d17bf1f6ae2d1a2699725ec9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-core_2.12/3.2.3/scalatest-core_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_core_2_12", "actual": "@org_scalatest_scalatest_core_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_core_2_12"},
    {"artifact": "org.scalatest:scalatest-diagrams_2.12:3.2.3", "lang": "scala", "sha1": "e86d2299d7594597a2db7db9eaca7fda76ba6c02", "sha256": "5e3f07de96bba23ab35274c6ec46cb98d1bcdd7d6731d291d3f8662a56accb3d", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-diagrams_2.12/3.2.3/scalatest-diagrams_2.12-3.2.3.jar", "source": {"sha1": "d7b6ea4e30940e83f52d1a90a4cbc747a4c91528", "sha256": "9f6b8dee59c35fa6d6463bcb625cf2df13f44090fe91239331d27f486e7bde9b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-diagrams_2.12/3.2.3/scalatest-diagrams_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_diagrams_2_12", "actual": "@org_scalatest_scalatest_diagrams_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_diagrams_2_12"},
    {"artifact": "org.scalatest:scalatest-featurespec_2.12:3.2.3", "lang": "scala", "sha1": "77b58ec18552d81523ba207b2c4dba39218769c2", "sha256": "c44afbc76a362d10605abad68944c830c8502ea55119bbc5deb9169f7aded8c9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-featurespec_2.12/3.2.3/scalatest-featurespec_2.12-3.2.3.jar", "source": {"sha1": "7970e17f6419daa9a2345abc6f450e9bc4aa4cd6", "sha256": "cb656b569246bb09e637e88eecc3d77f5e9f6f50e4fda29b39e219ab463050ef", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-featurespec_2.12/3.2.3/scalatest-featurespec_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_featurespec_2_12", "actual": "@org_scalatest_scalatest_featurespec_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_featurespec_2_12"},
    {"artifact": "org.scalatest:scalatest-flatspec_2.12:3.2.3", "lang": "scala", "sha1": "c7a12932bf319d9e9ffac36a68f98bab1fbe9be8", "sha256": "d4ffcf5ec663edf7eedd56ace2ac3afe965402047ad1168eae9708999fabf1d2", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-flatspec_2.12/3.2.3/scalatest-flatspec_2.12-3.2.3.jar", "source": {"sha1": "ca476738e3e6246804057049912785a3ac1770ed", "sha256": "ee42c003cc1b784f3f156e544ea18b84f2a39f3c51dd8c9e37f6dc17e5cf7adc", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-flatspec_2.12/3.2.3/scalatest-flatspec_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_flatspec_2_12", "actual": "@org_scalatest_scalatest_flatspec_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_flatspec_2_12"},
    {"artifact": "org.scalatest:scalatest-freespec_2.12:3.2.3", "lang": "scala", "sha1": "12ba3c8400d90bb3684f33aba1b5a850ca4508ae", "sha256": "bb9f84821b6f739e60414a1f4ea6b51a9bbdcd0ff5cf9685b76ac74fc1afb712", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-freespec_2.12/3.2.3/scalatest-freespec_2.12-3.2.3.jar", "source": {"sha1": "98f87dbc18da7583f47bc3c7c3a5b96a504a1ea1", "sha256": "8fc33bfde50dd1207e35acd4853da4b0eddbe6c493172c44848ab05c3ea3c11c", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-freespec_2.12/3.2.3/scalatest-freespec_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_freespec_2_12", "actual": "@org_scalatest_scalatest_freespec_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_freespec_2_12"},
    {"artifact": "org.scalatest:scalatest-funspec_2.12:3.2.3", "lang": "scala", "sha1": "5ecf3ffabac9694e72e0c4b8cc501ec26929c736", "sha256": "f0a537e9ff1995a59c2a3cf2d90e062e170501cb75626d0d107d365fc7613968", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-funspec_2.12/3.2.3/scalatest-funspec_2.12-3.2.3.jar", "source": {"sha1": "c02b08915d6d9220f316a6fc150f9c89fc14093c", "sha256": "2f3174ad19817530affaed6f94b29a988582d21f2442cbb5d9ba77547462e1d3", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-funspec_2.12/3.2.3/scalatest-funspec_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_funspec_2_12", "actual": "@org_scalatest_scalatest_funspec_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_funspec_2_12"},
    {"artifact": "org.scalatest:scalatest-funsuite_2.12:3.2.3", "lang": "scala", "sha1": "d16c4d2c70297f4950a7f158f91505b0b78a5038", "sha256": "4d11ad7f0e65500ab8b93ff72defeb94eb82bd5772c1ae2bf1a74a9ab386ba51", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-funsuite_2.12/3.2.3/scalatest-funsuite_2.12-3.2.3.jar", "source": {"sha1": "3ec0c79f177a880de2f5e6fb2796a250a0976f19", "sha256": "0cb57a0600ad1d5fb31cdbde7bbde00dc8cec6d5857feb617623fb41f7d98d81", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-funsuite_2.12/3.2.3/scalatest-funsuite_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_funsuite_2_12", "actual": "@org_scalatest_scalatest_funsuite_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_funsuite_2_12"},
    {"artifact": "org.scalatest:scalatest-matchers-core_2.12:3.2.3", "lang": "scala", "sha1": "2790ed2c801b5cf25bf4dab3883d8d4829d3df28", "sha256": "0f28cdc645ff00753880e684b017536e3207a5416ece4aae6bdcb82b37678182", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-matchers-core_2.12/3.2.3/scalatest-matchers-core_2.12-3.2.3.jar", "source": {"sha1": "546339ff0060438488346fb1ce9ad406f85f960c", "sha256": "0326ff5f28c075e6aa2337136ef3ac4e0d26ba824579e156dcbcb5276441baaf", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-matchers-core_2.12/3.2.3/scalatest-matchers-core_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_matchers_core_2_12", "actual": "@org_scalatest_scalatest_matchers_core_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_matchers_core_2_12"},
    {"artifact": "org.scalatest:scalatest-mustmatchers_2.12:3.2.3", "lang": "scala", "sha1": "50dfd9407565699d7467e469e79b9b0cf37927bf", "sha256": "bcde3f7354ddb9d8226fae9ef428f30f80dc70eabd0371da84032c129fcdec35", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-mustmatchers_2.12/3.2.3/scalatest-mustmatchers_2.12-3.2.3.jar", "source": {"sha1": "14414528e32086c53be8d5c21342a92b0dd164ba", "sha256": "505e8d314deaa028aff4acb7e708b5f9d62116adf01e0d7ef4a2a3fa5518ef36", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-mustmatchers_2.12/3.2.3/scalatest-mustmatchers_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_mustmatchers_2_12", "actual": "@org_scalatest_scalatest_mustmatchers_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_mustmatchers_2_12"},
    {"artifact": "org.scalatest:scalatest-propspec_2.12:3.2.3", "lang": "scala", "sha1": "24f8aebf181901b25d8fa20cd9b91a4dcb8f0cc4", "sha256": "9eeeec91345665bf9b02d734b643e2bb5fb40b09dedd41b8112a0886d1d68d10", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-propspec_2.12/3.2.3/scalatest-propspec_2.12-3.2.3.jar", "source": {"sha1": "f7c77ebcb1759820021dddbe75c9ce414aa85070", "sha256": "472e4e94826f6ced6b22709c1141f575a245bffb0897d6028f45802eab3dae0d", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-propspec_2.12/3.2.3/scalatest-propspec_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_propspec_2_12", "actual": "@org_scalatest_scalatest_propspec_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_propspec_2_12"},
    {"artifact": "org.scalatest:scalatest-refspec_2.12:3.2.3", "lang": "scala", "sha1": "04a8798e4b53303dc5c7633d4331fb876ed58585", "sha256": "78162772614a40fb321ab296afef19ef6070cd9753c3bdacec72f34e6c4de79a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-refspec_2.12/3.2.3/scalatest-refspec_2.12-3.2.3.jar", "source": {"sha1": "fd72aca7874e3a2261576d1bcaf49c8102f4ea00", "sha256": "29002cdf4805a4a2d5193472e82e00484a697bf70a9b108cb74f8fa4fc7e7dfa", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-refspec_2.12/3.2.3/scalatest-refspec_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_refspec_2_12", "actual": "@org_scalatest_scalatest_refspec_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_refspec_2_12"},
    {"artifact": "org.scalatest:scalatest-shouldmatchers_2.12:3.2.3", "lang": "scala", "sha1": "c36152c640a2751a8f07032008ee50b5549479e1", "sha256": "4d87d195614c31ce4f5b329dd4bd7e06ac93dec56207ed839f1007b7f32b42d9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-shouldmatchers_2.12/3.2.3/scalatest-shouldmatchers_2.12-3.2.3.jar", "source": {"sha1": "4807106655a1ae236154f92a0cbb0644f37a2d3b", "sha256": "2a5d994e4c7e1bea8d46751f840441e6baa637cfed907da92700c94dcd7898e5", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-shouldmatchers_2.12/3.2.3/scalatest-shouldmatchers_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_shouldmatchers_2_12", "actual": "@org_scalatest_scalatest_shouldmatchers_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_shouldmatchers_2_12"},
    {"artifact": "org.scalatest:scalatest-wordspec_2.12:3.2.3", "lang": "scala", "sha1": "d1cc1e981aba1dfdc5fce90c8670b855321f7164", "sha256": "44c37777e79934358eba79973f5ebbbd564b569352e4db4f5db9ab3f42b8a782", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-wordspec_2.12/3.2.3/scalatest-wordspec_2.12-3.2.3.jar", "source": {"sha1": "253366bd062b4af1263625e852a4a5c29f832f01", "sha256": "db7f8262e80fcb89d0972a1c2b4591fed62e09815bf7a85fcb5b2fedb75e2e8d", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest-wordspec_2.12/3.2.3/scalatest-wordspec_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_wordspec_2_12", "actual": "@org_scalatest_scalatest_wordspec_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_wordspec_2_12"},
    {"artifact": "org.scalatest:scalatest_2.12:3.2.3", "lang": "scala", "sha1": "1ecdccaa80af11cf18cfbd67cec8e043f9a6e9d9", "sha256": "061688f54c9dce4d277a3b64fa075f4a1d63bd96e0703e0c831a133626beda35", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.12/3.2.3/scalatest_2.12-3.2.3.jar", "source": {"sha1": "72a8c436cc4fa25409afa622a0360619267a68d3", "sha256": "690855060db1631ffe007b9365847183695ee907d1b7d5bcb13828166e6f997e", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.12/3.2.3/scalatest_2.12-3.2.3-sources.jar"} , "name": "org_scalatest_scalatest_2_12", "actual": "@org_scalatest_scalatest_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_2_12"},
# duplicates in org.slf4j:slf4j-api promoted to 1.7.30
# - ch.qos.logback:logback-classic:1.2.3 wanted version 1.7.25
# - com.typesafe.scala-logging:scala-logging_2.12:3.9.4 wanted version 1.7.30
    {"artifact": "org.slf4j:slf4j-api:1.7.30", "lang": "java", "sha1": "b5a4b6d16ab13e34a88fae84c35cd5d68cac922c", "sha256": "cdba07964d1bb40a0761485c6b1e8c2f8fd9eb1d19c53928ac0d7f9510105c57", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar", "source": {"sha1": "71a1fdefa224da50f1db6306ce609981e20186c9", "sha256": "9ee459644577590fed7ea94afae781fa3cc9311d4553faee8a3219ffbd7cc386", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30-sources.jar"} , "name": "org_slf4j_slf4j_api", "actual": "@org_slf4j_slf4j_api//jar", "bind": "jar/org/slf4j/slf4j_api"},
    {"artifact": "org.typelevel:macro-compat_2.12:1.1.1", "lang": "scala", "sha1": "ed809d26ef4237d7c079ae6cf7ebd0dfa7986adf", "sha256": "8b1514ec99ac9c7eded284367b6c9f8f17a097198a44e6f24488706d66bbd2b8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/typelevel/macro-compat_2.12/1.1.1/macro-compat_2.12-1.1.1.jar", "source": {"sha1": "ade6d6ec81975cf514b0f9e2061614f2799cfe97", "sha256": "c748cbcda2e8828dd25e788617a4c559abf92960ef0f92f9f5d3ea67774c34c8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/typelevel/macro-compat_2.12/1.1.1/macro-compat_2.12-1.1.1-sources.jar"} , "name": "org_typelevel_macro_compat_2_12", "actual": "@org_typelevel_macro_compat_2_12//jar:file", "bind": "jar/org/typelevel/macro_compat_2_12"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)