<?php
require 'vendor/autoload.php';
use App\Calculator;

$calc = new Calculator();
echo "3 + 4 = " . $calc->add(3, 4);
