<?php
include __DIR__ . '/vendor/autoload.php';

error_reporting(E_ERROR | E_PARSE);

use JsonPath\JsonObject;
use JsonPath\InvalidJsonPathException;

$json = file_get_contents("php://stdin");
$obj = new JsonObject($json);

try {
    $r =  $obj->get($argv[1]);
} catch (InvalidJsonPathException $e) {
    print "Invalid JSONPath error: '" . $e->getMessage() . "'\r\n";
    die(2);
} catch (DivisionByZeroError $e) {
    print "Error: '" . $e->getMessage() . "'\r\n";
    die(1);
} catch (Exception $e) {
    print "Error: '" . $e->getMessage() . "'\r\n";
    die(1);
}

print json_encode($r);
