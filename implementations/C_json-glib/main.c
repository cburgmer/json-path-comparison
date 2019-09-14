#include <stdlib.h>
#include <glib-object.h>
#include <gio/gunixoutputstream.h>
#include <gio/gunixinputstream.h>
#include <json-glib/json-glib.h>

int
main (int argc, char *argv[])
{
  JsonParser *parser;
  JsonNode *root;
  GError *error;

  if (argc < 2)
    {
      g_print ("Usage: main <selector>\n");
      return EXIT_FAILURE;
    }

  GInputStream *stdin;
  stdin = g_unix_input_stream_new (0, TRUE);

  parser = json_parser_new ();

  error = NULL;
  json_parser_load_from_stream (parser, stdin, NULL, &error);
  if (error)
    {
      g_print ("Unable to parse: %s\n", error->message);
      g_error_free (error);
      g_object_unref (stdin);
      g_object_unref (parser);
      return EXIT_FAILURE;
    }

  g_object_unref (stdin);

  root = json_parser_get_root (parser);


  JsonNode *result;
  JsonPath *path = json_path_new ();
  json_path_compile (path, argv[1], &error);
  if (error)
    {
      g_print ("Unable to compile selector `%s': %s\n", argv[1], error->message);
      g_error_free (error);
      g_object_unref (path);
      g_object_unref (parser);
      return EXIT_FAILURE;
    }

  result = json_path_match (path, root);

  g_object_unref (path);

  GOutputStream *stdout;
  JsonGenerator *generator;

  stdout = g_unix_output_stream_new(1, TRUE);
  generator = json_generator_new ();
  json_generator_set_root (generator, result);
  json_generator_to_stream (generator, stdout, NULL, &error);
  if (error)
    {
      g_print ("Unable to serialize: %s\n", error->message);
      g_error_free (error);
      g_object_unref (parser);
      g_object_unref (stdout);
      g_object_unref (generator);
      return EXIT_FAILURE;
    }

  g_output_stream_write (stdout, "\n", 1, NULL, &error);

  g_object_unref (parser);
  g_object_unref (stdout);
  g_object_unref (generator);

  return EXIT_SUCCESS;
}
