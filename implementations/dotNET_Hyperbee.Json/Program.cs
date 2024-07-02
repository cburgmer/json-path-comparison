using System;
using System.Linq;
using System.Text.Json;

using Hyperbee.Json.Extensions;

namespace DotNET_Hyperbee.Json
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
            
            try
            {
                using var doc = JsonDocument.Parse(jsonString);
                var selector = args[0];

                try
                {
                    var results = doc.RootElement.Select(selector).ToArray();
                    Console.WriteLine($"{JsonSerializer.Serialize(results)}");
                }
                catch (NotSupportedException notEx)
                {
                    Console.WriteLine(notEx.Message);
                    Environment.Exit(2);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                    Environment.Exit(1);
                }
            } 
            catch(Exception ex){
                Console.WriteLine(ex.Message);
                Environment.Exit(2);
            }
        }
    }
}
