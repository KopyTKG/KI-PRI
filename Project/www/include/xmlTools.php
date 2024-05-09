<?php

// seznam jmen XML souborů
function xmlFileList($dir)
{
    $list = [];

    foreach (glob("$dir/*.xml") as $filename)
        $list[] = basename($filename, '.xml');

    return $list;
}

// výpis chyb
function xmlPrintErrors()
{ ?>
    <table>
        <?php foreach (libxml_get_errors() as $error) { ?>
            <tr>
                <td>
                    <?= $error->line ?>
                </td>
                <td>
                    <?= $error->message ?>
                </td>
            </tr>
        <?php } ?>
    </table>
    <?php
}

// validace XML pomocí XSD
function xmlValidate($xmlPath, $xsdPath): bool
{
    $doc = new DOMDocument;

    // proběhne kontrola well-formed
    libxml_use_internal_errors(true);
    $doc->loadXML(file_get_contents($xmlPath));
    xmlPrintErrors();
    libxml_use_internal_errors(false);

    // validace
    libxml_use_internal_errors(true);
    $isValid = $doc->schemaValidate($xsdPath);
    xmlPrintErrors();
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
