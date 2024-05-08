<?php
$filenameBase = './xml/studium';

$xmlFile = "$filenameBase.xml";
$xsdFile = "$filenameBase.xsd";
$xslFile = "$filenameBase-655.xsl";

$xml = new DOMDocument;
$xml->load($xmlFile);
$xml->schemaValidate($xsdFile);

$xsl = new DOMDocument;
$xsl->load($xslFile);

$xslt = new XSLTProcessor();
$xslt->importStylesheet($xsl);
$xml = $xslt->transformToXml($xml);

echo $xml;
