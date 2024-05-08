<!DOCTYPE html>
<html lang="cs">


<head>
    <meta charset="UTF-8">
</head>

<body>
    <form method="post" action="predmenty.php">
	<label for="kodPredmetu">Kód předmětu</label>
	<input type="text" id="kodPredmetu" name="kodPredmetu">
	<button type="submit">Odeslat</button>
    </form>
    <form method="post" action="predmety.php">
	<label for="kodPredmetu">Kód předmětu</label>
	<select id="kodPredmetu" name="kodPredmetu">
	    <option value="MA1">KMA-MA1</option>
	    <option value="MUL">MI-MUL</option>
	    <option value="NIE">KI-NIE</option>
	    <option value="UDI">KI-UDI</option>
	</select>
	<button type="submit">Odeslat</button>
    </form>
</body>

</html>
