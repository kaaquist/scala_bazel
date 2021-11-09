package com.happy.utils

import com.typesafe.scalalogging.LazyLogging
import com.happy.utils.Configuration.WebServerSettingConf
import pureconfig.generic.ProductHint
import pureconfig.{CamelCase, ConfigFieldMapping, SnakeCase}
import pureconfig.generic.auto._

case class Configuration() extends LazyLogging {
  implicit def hint[T]: ProductHint[T] = ProductHint[T](ConfigFieldMapping(CamelCase, SnakeCase))

  lazy val prefixRoot = "happy"

  lazy val webServerSettingConfiguration: WebServerSettingConf =
    pureconfig.loadConfigOrThrow[WebServerSettingConf](s"$prefixRoot.web_server_settings")
}

object Configuration {
  val theConf: Configuration = Configuration()

  case class WebServerSettingConf(
                                   timeoutNoneServer: Int,
                                   timeoutServer: Int,
                                   serverPort: Int,
                                   serverAddress: String
                                 )
}