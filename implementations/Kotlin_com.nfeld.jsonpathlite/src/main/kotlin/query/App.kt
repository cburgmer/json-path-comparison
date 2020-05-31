package query

import kotlin.system.exitProcess
import com.nfeld.jsonpathlite.JsonPath
import com.google.gson.Gson
import org.json.JSONObject
import org.json.JSONArray

fun main(args : Array<String>) {
    val json = generateSequence(::readLine).joinToString("\n")
    try {
        val results = JsonPath.parse(json).read<Any>(args[0])
        if (results is JSONObject || results is JSONArray) {
            println(results)
        } else {
            println(Gson().toJson(results))
        }
    } catch (e: IllegalArgumentException) {
        System.err.println(e.message);
        exitProcess(2);
    } catch (e: Exception) {
        System.err.println(e.message);
        exitProcess(1);
    }
}
