using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Jint;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;

using JsonPath;

namespace Dotnet_JsonPathLib
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

            var engine = new Engine();

            object Eval(string script, object value) =>
                engine.SetValue("$$", value)
                      .Execute(script.Replace("@", "$$"))
                      .GetCompletionValue()
                      .ToObject();

            var context = new JsonPathContext
            {
                ScriptEvaluator = new Func<string, object, string, object>((script, value, context) => Eval(script, value)),
                ValueSystem = new JsonNetValueSystem()
            };

            try
            {
                var results = context.Select(o, selector);
                Console.WriteLine(JArray.FromObject(results).ToString());
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(1);
            }
        }
    }
}
