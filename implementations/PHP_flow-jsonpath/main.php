<?php
include __DIR__ . '/vendor/autoload.php';

use Flow\JSONPath\JSONPath;
use Flow\JSONPath\JSONPathException;

# don't leak absolute paths via warnings which we don't care for anyway as it's somebody else's code we are running
error_reporting(E_ERROR | E_PARSE);

$json = file_get_contents("php://stdin");
$o = json_decode($json);

try {
    $r = (new JSONPath($o))->find($argv[1])->data();
} catch (JSONPathException $e) {
    print "Error: '" . $e->getMessage() . "'\r\n";
    die(2);
} catch (Exception $e) {
    print "Error: '" . $e->getMessage() . "'\r\n";
    die(1);
}

print json_encode($r);
