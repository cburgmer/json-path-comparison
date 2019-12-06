package query

import io.gatling.jsonpath.JsonPath

import com.fasterxml.jackson.databind.{ JsonNode, ObjectMapper }
import scala.collection.JavaConverters._

import java.io.InputStreamReader;

import scala.io.StdIn.readLine

object App {

  val mapper = new ObjectMapper

  def main(args : Array[String]) {
    val selector = args(0)
    val responseStrBuilder = new StringBuilder()

    var line: String = null
    while ({line = readLine(); line != null}) {
      responseStrBuilder.append(line)
    }
    val data = responseStrBuilder.toString()

    val json = mapper.readValue(data, classOf[JsonNode])
    val results = JsonPath.query(selector, json)

    results match {
      case Right(it) =>
        val matches = it.toList
        val node = mapper.createArrayNode();
        node.addAll(matches.asJava)

        mapper.writeValue(System.out, node);
      case Left(e) =>
        println(e)
        sys.exit(1)
    }
  }
}
