<?php
include __DIR__ . '/vendor/autoload.php';

use Flow\JSONPath\JSONPath;

$json = file_get_contents("php://stdin");
$o = json_decode($json);

try {
    $r = (new JSONPath($o))->find($argv[1])->data();
} catch (Exception $e) {
    print "Error: '" . $e->getMessage() . "'\r\n";
    die(1);
}

print json_encode($r);
