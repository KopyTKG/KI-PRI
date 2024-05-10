<?php
// Capture the category from URL parameters
$category = isset($_GET['c']) ? $_GET['c'] : '';
$category = urldecode($category); // Use urldecode to handle spaces and other URL-encoded characters

// Load XML
$xml = new DOMDocument();
$xml->load(MOVIES . '/index.xml');

// Load XSLT
$xsl = new DOMDocument();
$xsl->load(XML . '/filter.xsl');

// Configure the XSLT processor
$proc = new XSLTProcessor();
$proc->importStyleSheet($xsl);

// Pass the 'category' parameter to the XSLT
$proc->setParameter('', 'selectedCategory', $category);

// Transform XML
echo $proc->transformToXML($xml);
?>
