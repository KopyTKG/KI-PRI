<?php

// validace XML pomocí XSD
function xmlValidate($xmlPath, $xsdPath): bool
{
    $doc = new DOMDocument;

    // proběhne kontrola well-formed
    libxml_use_internal_errors(true);
    $doc->loadXML(file_get_contents($xmlPath));
    libxml_use_internal_errors(false);

    // validace
    libxml_use_internal_errors(true);
    $isValid = $doc->schemaValidate($xsdPath);
    libxml_use_internal_errors(false);

    return $isValid;
}

// transformace XML pomocí XSL
function xmlTransform($xmlPath, $xslPath): false|string
{
    $xml = new DOMDocument;
    $xsl = new DOMDocument;
    $xslt = new XSLTProcessor();

    if (@!$xml->load($xmlPath) || !$xsl->load($xslPath) || !$xslt->importStylesheet($xsl))
        return false;

    return $xslt->transformToXml($xml);
}
