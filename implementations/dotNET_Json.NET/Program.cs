using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;

namespace Dotnet_Json.NET
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
            
            JToken o = JToken.Parse(jsonString);
            var selector = args[0];
            try
            {
                var results = o.SelectTokens(selector);
                Console.WriteLine(JArray.FromObject(results).ToString());
            }
            catch (JsonException e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(1);
            }
        }
    }
}
