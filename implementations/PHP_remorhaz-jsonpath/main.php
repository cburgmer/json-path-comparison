<?php
include __DIR__ . '/vendor/autoload.php';

use Remorhaz\JSON\Data\Value\EncodedJson\NodeValueFactory;
use Remorhaz\JSON\Path\Processor\Processor;
use Remorhaz\JSON\Path\Query\QueryFactory;
use Remorhaz\JSON\Path\Parser\Exception\QueryAstNotBuiltException;

$json = file_get_contents("php://stdin");

try {
    $r = Processor::create()
        ->select(
            QueryFactory::create()->createQuery($argv[1]),
            NodeValueFactory::create()->createValue($json)
        )
        ->decode();
} catch (QueryAstNotBuiltException $e) {
    print "Error: '" . $e->getMessage() . "'\r\n";
    die(2);
} catch (Exception $e) {
    print "Error: '" . $e->getMessage() . "'\r\n";
    die(1);
}

print json_encode($r);
