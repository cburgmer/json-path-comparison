package query;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.sjf4j.Sjf4j;
import org.sjf4j.path.JsonPath;


public class App {
    public static void main(String[] args) throws IOException, UnsupportedEncodingException {
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(System.in, "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();

        String inputStr;
        while ((inputStr = streamReader.readLine()) != null)
            responseStrBuilder.append(inputStr);
        String json = responseStrBuilder.toString();

        try {
            Object node = Sjf4j.global().fromJson(json);
            JsonPath path = JsonPath.parse(args[0]);
            Object result = path.eval(node);

            System.out.println(Sjf4j.global().toJsonString(result));
        } catch (final Exception e) {
            System.err.println(e);
            System.exit(2);
        }
    }
}
