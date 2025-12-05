package query;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

import net.sf.saxon.s9api.XdmValue;

import org.xmljacquard.ajp.AjpRunner;

public class App {
    public static void main(String[] args) throws IOException, UnsupportedEncodingException {
        final BufferedReader streamReader = new BufferedReader(new InputStreamReader(System.in, "UTF-8"));
        final StringBuilder responseStrBuilder = new StringBuilder();

        String inputStr;
        while ((inputStr = streamReader.readLine()) != null) {
            responseStrBuilder.append(inputStr);
        }

        final String json = responseStrBuilder.toString();

    
        try {
            final AjpRunner runner   = new AjpRunner().withQuery(args[0]);
            final XdmValue  nodelist = runner.getNodelist(json);
            final XdmValue  values   = runner.arrayOfValues(nodelist);

            System.out.println(runner.serializeToJson(values));

            System.exit(0);

        } catch (final Exception e) {
            System.err.println(e);
            System.exit(2);
        }
    }
}
