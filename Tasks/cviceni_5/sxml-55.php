<?php

$sql = mysqli_connect("db","admin","Heslo11","db");

if ($sql->connect_error) {
    die("Connection failed: " . $sql->connect_error);
}

$fac_query = $sql->query("SELECT * FROM Fakulty WHERE id = 1;");
$fac_data = $fac_query->fetch_all(MYSQLI_ASSOC);
$xml = new SimpleXMLElement('<fakulty/>');
// create foreach loop for fac_data
foreach($fac_data as &$fakulta) {
	$faculty = $xml->addChild('fakulta');
	$faculty->addAttribute('dekan', $fakulta['Dekan']);

	$kat_query = $sql->query("SELECT * FROM Katedry WHERE Fakulta_id =" . $fakulta['id'] . ";");
	$kat_data = $kat_query->fetch_all(MYSQLI_ASSOC);
	foreach($kat_data as &$katedra) {
		$department = $faculty->addChild('katedra');
		$department->addAttribute('zkratka_katedry', $katedra['Zkratka']);
		
		$vedeni_query = $sql->query("SELECT * FROM Vedouci WHERE Katedra_id =" . $katedra['id'] . ";");	
		$vedeni_data = $vedeni_query->fetch_all(MYSQLI_ASSOC);
		foreach($vedeni_data as &$vedouci) {
			$leader = $department->addChild('vedouci');
			$leader->addChild('jmeno', $vedouci['Jmeno']);
			$leader->addChild('telefon', $vedouci['Telefon']);
			$leader->addChild('email', $vedouci['Email']);
		}
		
		$employees = $department->addChild('zamestnanci');
	
		$zamestanci_query = $sql->query("SELECT * FROM Zamestnanci WHERE Katedra_id =" . $katedra['id'] . ";");	
		$zamestanci_data = $zamestanci_query->fetch_all(MYSQLI_ASSOC);
		foreach($zamestanci_data as &$zamestnanec) {
			$employee = $employees->addChild('zamestnanec');
			$employee->addChild('jmeno', $zamestnanec['Jmeno']);
			$employee->addChild('telefon', $zamestnanec['Telefon']);
			$employee->addChild('email', $zamestnanec['Email']);
			$employee->addChild('pozice', $zamestnanec['Pozice']);
		}
		
		$courses = $department->addChild('predmety');
		
		$predmety_query = $sql->query("SELECT * FROM Predmety WHERE Katedra_id =" . $katedra['id'] . ";");	
		$predmety_data = $predmety_query->fetch_all(MYSQLI_ASSOC);
		foreach($predmety_data as &$predmet) {
			$course = $courses->addChild('predmet');
			$course->addAttribute('zkratka', $predmet['Zkratka']);
			$course->addChild('nazev', $predmet['Nazev']);
		}
		
	}

	$fields = $faculty->addChild('obory');
		
	$obory_query = $sql->query("SELECT * FROM Obory WHERE Fakulta_id =" . $fakulta['id'] . ";");
	$obory_data = $obory_query->fetch_all(MYSQLI_ASSOC);
	foreach($obory_data as &$obor) {
		$field = $fields->addChild('obor');
		$field->addChild('nazev', $obor['Nazev']);
	}
}
// Set header and output XML
header('Content-type: text/xml');
echo $xml->asXML();
?>

