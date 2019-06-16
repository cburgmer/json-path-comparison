use JSON::Path;
use JSON;

my $json = decode_json join("", <STDIN>);

my $jpath   = JSON::Path->new($ARGV[0]);
my @result   = $jpath->values($json);

print encode_json \@result
