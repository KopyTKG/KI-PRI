<?php
require '../prolog.php';
require INC . '/html-base.php';
require INC . '/xmlTools.php';
?>
<div class="w-screen flex flex-col items-center h-screen justify-center gap-10">
<h1 class="text-4xl font-bold text-white">Kategorie</h1>
 <?= xmlTransform(XML . "/kategorie.xml", XML . '/kategorie.xsl') ?>
</div>
<?php
require INC . '/html-end.php';
