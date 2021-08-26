using System;
using System.Collections.Generic;
using System.Text.Json;
using JsonCons.JsonPath;

namespace JsonCons.JsonPath
{
    class Program
    {
        static void Main(string[] args)
        {
            string jsonString = "";
            string s;
            while ((s = Console.ReadLine()) != null)
            {
                jsonString += s;
            }
            
            using var doc = JsonDocument.Parse(jsonString);
            var selectorString = args[0];
            JsonSelector selector = null;
            try
            {
                selector = JsonSelector.Parse(selectorString);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }
            try
            {
                IList<JsonElement> results = selector.Select(doc.RootElement);
                Console.WriteLine($"{JsonSerializer.Serialize(results)}");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(1);
            }
        }
    }
}
