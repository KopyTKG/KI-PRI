<?php
require '../prolog.php';
require INC . '/html-base.php';
require INC . '/xmlTools.php';
?>
<div class="w-screen flex flex-col items-center h-screen justify-center gap-10">
<h1 id="topKat" class="text-4xl font-bold text-white">Kategorie</h1>
 <?= xmlTransform(XML . "/kategorie.xml", XML . '/kategorie.xsl') ?>
</div>
<a href="#topKat"class="fixed w-32 h-32 rounded-full bg-blue-700 text-white flex justify-center items-center bottom-5 right-5">
Back to top
</a>
<?php
require SERVE . '/filter.php';
require INC . '/html-end.php';
