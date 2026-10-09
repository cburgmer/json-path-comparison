package query;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.github.treetrail.jsonpath.JsonPath;
import io.github.treetrail.jsonpath.JsonPathSyntaxException;
import io.github.treetrail.jsonpath.jackson2.Jackson2Model;

public class App {
    public static void main(String[] args) throws IOException {
        String json = new String(System.in.readAllBytes(), StandardCharsets.UTF_8);
        ObjectMapper mapper = new ObjectMapper();

        try {
            JsonNode document = mapper.readTree(json);
            List<JsonNode> results = JsonPath.compile(args[0]).query(document, Jackson2Model.INSTANCE).values();

            mapper.writeValue(System.out, results);
        } catch (JsonPathSyntaxException e) {
            System.err.println(e.getMessage());
            System.exit(2);
        } catch (Exception e) {
            System.err.println(e);
            System.exit(1);
        }
    }
}
