<?php

$kodPredmetu = $_POST['kodPredmetu'];

if (empty($kodPredmetu)) {
    return;
}


$xml = new DOMDocument;
$xml->load('./xml/studium.xml');

$xsl = new DOMDocument;
$xsl->load("./xml/studium-predmety.xsl");

$xslt = new XSLTProcessor();
$xslt->importStylesheet($xsl);

$xslt->setParameter('', 'kodPredmetu', (string)$kodPredmetu);

echo($xslt->transformToXml($xml));
