package query

import kotlin.system.exitProcess
import com.nfeld.jsonpathkt.extension.read
import com.nfeld.jsonpathkt.JsonPath
import com.google.gson.Gson

fun main(args : Array<String>) {
    val json = generateSequence(::readLine).joinToString("\n")
    try {
        val results = JsonPath.parse(json)?.read<Any>(args[0])
        println(results?.toString())
    } catch (e: IllegalArgumentException) {
        System.err.println(e.message);
        exitProcess(2);
    } catch (e: Exception) {
        System.err.println(e.message);
        exitProcess(1);
    }
}
