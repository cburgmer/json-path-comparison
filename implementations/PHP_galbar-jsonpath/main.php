<?php
include __DIR__ . '/vendor/autoload.php';

use JsonPath\JsonObject;

$json = file_get_contents("php://stdin");
$obj = new JsonObject($json);
$r =  $obj->get($argv[1]);

if ($r === false) {
    print 'jsonpath returned false, this might indicate an error';
    die(1);
} else {
    print json_encode($r);
}
