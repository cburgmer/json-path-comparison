using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Manatee.Json;
using Manatee.Json.Path;

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
            
            var o = JsonValue.Parse(jsonString);
            var selector = args[0];
            try
            {
                var path = JsonPath.Parse(selector);
                var results = path.Evaluate(o);
                Console.WriteLine(results.ToString());
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(1);
            }
        }
    }
}
