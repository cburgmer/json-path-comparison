package query

import kotlin.system.exitProcess
import com.fasterxml.jackson.databind.JsonNode
import com.nfeld.jsonpathkt.extension.read
import com.nfeld.jsonpathkt.JsonPath
import com.google.gson.Gson
import com.google.gson.JsonParser

fun main(args : Array<String>) {
    val json = generateSequence(::readLine).joinToString("\n")
    try {
        val results = JsonPath.parse(json)?.read<JsonNode>(args[0])
        if (results != null) {
            println(Gson().toJson(JsonParser().parse(results.toString())))
        } else {
            println(results)
        }
    } catch (e: IllegalArgumentException) {
        System.err.println(e.message);
        exitProcess(2);
    } catch (e: Exception) {
        System.err.println(e.message);
        exitProcess(1);
    }
}
