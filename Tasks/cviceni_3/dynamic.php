
<!DOCTYPE html>
<html>

<body>
    <?php
    // XML
    $xml = new DOMDocument;
    $xml->load('xml/student.dynamic.xml');
    // XSL
    $xsl = new DOMDocument;
    $xsl->load('css/student.xsl');
    // transformer
    $xslt = new XSLTProcessor();
    $xslt->importStylesheet($xsl);
    $transformovany_xml = $xslt->transformToXml($xml);
    // output
    echo $transformovany_xml;
    ?>
</body>

</html>
