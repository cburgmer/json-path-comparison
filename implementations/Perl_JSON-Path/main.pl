use lib qw(./build/lib/perl5/);
use JSON::Path;
use JSON;
use Try::Tiny;

# Avoid hashes yielding unreproducible stack traces.
$Carp::MaxArgNums = -1;

my $json = decode_json join("", <STDIN>);

my $jpath = JSON::Path->new($ARGV[0]);
my @result = $jpath->values($json);
print encode_json(\@result) . "\n";
