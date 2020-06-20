#include <stdlib.h>
#include <stdio.h>
#include <glib-object.h>
#include <gio/gunixoutputstream.h>
#include <gio/gunixinputstream.h>
#include <json-glib/json-glib.h>

void
g_print_no_convert(const gchar *buf)
{
  fputs(buf, stdout);
}

static void
log_handler_cb (const gchar    *log_domain,
                GLogLevelFlags  log_level,
                const gchar    *message,
                gpointer        user_data)
{
    g_printerr ("%s\n", message);
}

int
main (int argc, char *argv[])
{
  // https://stackoverflow.com/questions/43927373/force-utf-8-encoding-in-glibs-g-print
  // Otherwise OSX and Linux seem to diverge on the output of json-glib error messages
  g_set_print_handler(g_print_no_convert);

  // Remove timestamp from errors
  g_log_set_default_handler(log_handler_cb, NULL);


  JsonParser *parser;
  JsonNode *root;
  GError *error;

  if (argc < 2)
    {
      g_print ("Usage: main <selector>\n");
      return EXIT_FAILURE;
    }

  GInputStream *stdin_stream;
  stdin_stream = g_unix_input_stream_new (0, TRUE);

  parser = json_parser_new ();

  error = NULL;
  json_parser_load_from_stream (parser, stdin_stream, NULL, &error);
  if (error)
    {
      g_print ("Unable to parse: %s\n", error->message);
      g_error_free (error);
      g_object_unref (stdin_stream);
      g_object_unref (parser);
      return EXIT_FAILURE;
    }

  g_object_unref (stdin_stream);

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
      return 2;
    }

  result = json_path_match (path, root);

  g_object_unref (path);

  GOutputStream *stdout_stream;
  JsonGenerator *generator;

  stdout_stream = g_unix_output_stream_new(1, TRUE);
  generator = json_generator_new ();
  json_generator_set_root (generator, result);
  json_generator_to_stream (generator, stdout_stream, NULL, &error);
  if (error)
    {
      g_print ("Unable to serialize: %s\n", error->message);
      g_error_free (error);
      g_object_unref (parser);
      g_object_unref (stdout_stream);
      g_object_unref (generator);
      return EXIT_FAILURE;
    }

  g_output_stream_write (stdout_stream, "\n", 1, NULL, &error);

  g_object_unref (parser);
  g_object_unref (stdout_stream);
  g_object_unref (generator);

  return EXIT_SUCCESS;
}
