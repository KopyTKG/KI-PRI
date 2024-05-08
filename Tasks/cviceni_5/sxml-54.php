<?php
// Create a new SimpleXMLElement to hold the entire document
$xml = new SimpleXMLElement('<fakulty/>');

// Add a faculty element with an attribute
$faculty = $xml->addChild('fakulta');
$faculty->addAttribute('dekan', 'RNDr. Michal Varady, Ph. D.');

// Add a department within the faculty
$department = $faculty->addChild('katedra');
$department->addAttribute('zkratka_katedry', 'PRF');

// Add department head information
$leader = $department->addChild('vedouci');
$leader->addChild('jmeno', 'Jiri Skvor');
$leader->addChild('telefon', '+420 475 286 711');
$leader->addChild('email', 'email@example.com');

// Add employees under the department
$employees = $department->addChild('zamestnanci');
$employee = $employees->addChild('zamestnanec');
$employee->addChild('jmeno', 'Pavel Beranek');
$employee->addChild('telefon', '+420 475 286 724');
$employee->addChild('email', 'email');
$employee->addChild('pozice', 'odborny asistent');

// Add courses offered by the department
$courses = $department->addChild('predmety');
$course = $courses->addChild('predmet');
$course->addAttribute('zkratka', 'PCA');
$course->addAttribute('typ', 'kombinovane');
$course->addChild('nazev', 'Pocitacova Architektura');
$course->addChild('popis', 'Popis pocitacove Architektury');

$field = $faculty->addChild('obor');
$name = $field->addChild('nazev', 'Informacni Technologie');
// Generate XML file
Header('Content-type: text/xml');
echo $xml->asXML();

?>

