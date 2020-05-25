use JSON::Path;
use JSON::Fast;

my $json = from-json join("", $*IN.lines);

my $jp;

try {
  $jp = JSON::Path.new(@*ARGS[0]);

  CATCH {
    default {
      $*ERR.say: .message;
      exit 2;
    }
  }
}

try {
  print to-json $jp.values($json);
  CATCH {
    default {
      $*ERR.say: .message;
      exit 1;
    }
  }
}
