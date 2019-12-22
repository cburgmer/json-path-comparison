package query;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.Option;

public class App {
    public static void main(String[] args) throws IOException, UnsupportedEncodingException {
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(System.in, "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();

        String inputStr;
        while ((inputStr = streamReader.readLine()) != null)
            responseStrBuilder.append(inputStr);
        String json = responseStrBuilder.toString();

        Object results = JsonPath.parse(json).read(args[0]);

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(System.out, results);
    }
}
