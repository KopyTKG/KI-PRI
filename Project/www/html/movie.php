<?php
require '../prolog.php';
require INC . '/html-base.php';
require INC . '/xmlTools.php';
// Capture the category from URL parameters
$id = isset($_GET['id']) ? htmlspecialchars($_GET['id']) : '';

if ($id === '') {
    die('No movie ID provided.');
}

$xmlFilePath = MOVIES . "/$id.xml";
$xslFilePath = XML . '/movie.xsl';

// Load XML
$xml = new DOMDocument();
if (!file_exists($xmlFilePath) || !$xml->load($xmlFilePath)) {
    die('Failed to load XML file.');
}

// Load XSLT
$xsl = new DOMDocument();
if (!$xsl->load($xslFilePath)) {
    die('Failed to load XSLT file.');
}

// Configure the XSLT processor
$proc = new XSLTProcessor();
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);
?>
