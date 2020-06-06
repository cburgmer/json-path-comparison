<?php
// disable absolute paths showing up in output
error_reporting(E_ERROR | E_PARSE);

require_once('build/jsonpath.php');

$json = file_get_contents("php://stdin");
$o = json_decode($json, true);
try {
    $result = jsonPath($o, $argv[1]);
} catch (ArgumentCountError $e) {
    print "ArgumentCountError" . "\n";
    die(1);
}

if ($result === false) {
    print 'jsonpath returned false, this might indicate an error';
    die(3);
} else {
    echo json_encode($result);
}
?>
