using System;
using System.Linq;
using System.Text.Json.Nodes;
using Json.More;
using Json.Path;


namespace Dotnet_JsonPathNet
{
    class Program
    {
        static void Main(string[] args)
        {
            var options = new PathParsingOptions
            {
                AllowMathOperations = true,
                AllowRelativePathStart = true,
                AllowJsonConstructs = true,
                TolerateSurroundingWhitespace = true,
                AllowInOperator = true
            };

            string jsonString = "";
            string s;
            while ((s = Console.ReadLine()) != null)
            {
                jsonString += s;
            }
            
            var o = JsonNode.Parse(jsonString);
            var selector = args[0];
            JsonPath path = null;
            try
            {
                path = JsonPath.Parse(selector, options);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }
            try
            {
                var results = path.Evaluate(o);
                Console.WriteLine(results.Matches.Select(m => m.Value).ToJsonArray().AsJsonString());
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(1);
            }
        }
    }
}
