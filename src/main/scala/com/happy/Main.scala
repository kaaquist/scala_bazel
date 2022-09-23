package com.happy

import com.happy.utils._
import com.typesafe.scalalogging.LazyLogging
import org.apache.avro.Schema
import org.apache.avro.generic.{GenericData, GenericRecord}
import org.apache.avro.util.RandomData
import org.apache.commons.io.input.ReaderInputStream
import org.apache.parquet.avro.AvroParquetWriter
import org.apache.parquet.hadoop.ParquetFileWriter
import org.apache.parquet.hadoop.metadata.CompressionCodecName
import org.apache.hadoop.fs.Path
import scala.collection.JavaConverters._
import java.nio.charset.Charset

object Main extends App with LazyLogging {
	System.setProperty("hadoop.home.dir", "/")
	logger.info(s"Hello, from logger")
	println("Hello Kasper - Bazel Scala Here!")
	println(s"Hello ${Configuration.theConf.webServerSettingConfiguration.serverPort}")
	logger.info(s"${Configuration.theConf.webServerSettingConfiguration.serverPort}")
	val home = System.getProperty("user.home")
	val avroFile = scala.io.Source.fromFile(s"${home}/developer/github.com/kaaquist/first_bazel_scala/src/main/resources/avro_file.avsc")
	val theRealDeal = new ReaderInputStream(avroFile.bufferedReader(), Charset.forName("UTF-8"))
	if (avroFile == null) println("Crap! Hello!")
	val schema = new Schema.Parser().parse(theRealDeal)
	val it = new RandomData(schema, 10).iterator()
	val genericData = GenericData.get()
	val writer = AvroParquetWriter.builder[GenericRecord](new Path("result.parquet"))
		.withDataModel(genericData)
		.withSchema(schema)
		.withCompressionCodec(CompressionCodecName.SNAPPY)
		.withWriteMode(ParquetFileWriter.Mode.OVERWRITE)
		.build()
	for (t <- it.asScala) {
		println(s"${t} :: type :: ${t.getClass.getTypeName}")
		writer.write(t.asInstanceOf[org.apache.avro.generic.GenericRecord])
	}
	writer.close()
	def status(): String = "OKi"
}