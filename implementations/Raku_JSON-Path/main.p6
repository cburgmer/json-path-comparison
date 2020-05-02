use JSON::Path;
use JSON::Fast;

my $json = from-json join("", $*IN.lines);

try {
  my $jp = JSON::Path.new(@*ARGS[0]);

  print to-json $jp.values($json);
  CATCH {
    default {
      $*ERR.say: .message;
      exit 1;
    }
  }
}
