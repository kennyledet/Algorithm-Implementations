<?php

include("stablemarriage.php");

$men = array(
	"Joe" => array("Mary","Katie","Jane"),
	"Mike" => array("Jane","Mary","Katie"),
	"Bill" => array("Katie","Jane","Mary")
);

$women = array(
	"Katie" => array("Mike","Joe","Bill"),
	"Mary" => array("Bill","Mike","Joe"),
	"Jane" => array("Joe","Bill","Mike")
);

print_r(gale_shapely($men,$women));
?>