package com.happy

import com.happy.utils._
import com.typesafe.scalalogging.LazyLogging


object Main extends App with LazyLogging {
	logger.info(s"Hello, from logger")
	println("Hello Kasper - Bazel Scala Here!")
	println(s"Hello ${Configuration.theConf.webServerSettingConfiguration.serverPort}")
	logger.info(s"${Configuration.theConf.webServerSettingConfiguration.serverPort}")

	def status(): String = "OKi"
}