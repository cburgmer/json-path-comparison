using System;
using System.Linq;
using System.Text.Json;
using Json.More;
using Json.Path;


namespace Dotnet_Manatee.Json
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
            
            var o = JsonDocument.Parse(jsonString).RootElement;
            var selector = args[0];
            JsonPath path = null;
            try
            {
                path = JsonPath.Parse(selector);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }
            try
            {
                var results = path.Evaluate(o);
                Console.WriteLine(results.Matches.Select(m => m.Value).AsJsonElement().ToJsonString());
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(1);
            }
        }
    }
}
