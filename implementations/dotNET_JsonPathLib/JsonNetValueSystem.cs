using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;

using JsonPath;

public sealed class JsonNetValueSystem : IJsonPathValueSystem
{
    public bool HasMember(object value, string member)
    {
        if (value is JObject)
        {
            return (value as JObject).Properties().Any(property => property.Name == member);
        }
        if (value is JArray)
        {
            int index = ParseInt(member, -1);
            return index >= 0 && index < (value as JArray).Count;
        }
        return false;
    }

    public object GetMemberValue(object value, string member)
    {
        if (value is JObject)
        {
            var memberValue = (value as JObject)[member];
            return memberValue;
        }
        if (value is JArray)
        {
            int index = ParseInt(member, -1);
            return (value as JArray)[index];
        }
        return null;
    }

    public IEnumerable<string> GetMembers(object value)
    {
        var jobject = value as JObject;
        return jobject.Properties().Select(property => property.Name);
    }

    public bool IsObject(object value)
    {
        return value is JObject;
    }

    public bool IsArray(object value)
    {
        return value is JArray;
    }

    public bool IsPrimitive(object value)
    {
        if (value == null)
        {
            throw new ArgumentNullException("value");
        }

        return ! IsObject(value) && ! IsArray(value);
    }

    private int ParseInt(string s, int defaultValue)
    {
        int result;
        return int.TryParse(s, out result) ? result : defaultValue;
    }
}
