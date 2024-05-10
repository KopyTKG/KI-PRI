<?php
require '../prolog.php';
require INC . '/html-base.php';
require INC . '/xmlTools.php';
?>
<script>
function moveToTop() {
	const TOP = document.getElementById('TOP');
  window.scrollTo({
    top: -TOP.offsetTop,
    behavior: 'smooth'
  });
}
</script>

<div class="w-screen flex flex-col items-center min-h-screen justify-center gap-10">
<h1 id="TOP" class="text-4xl font-bold text-white">Kategorie</h1>
 <?= xmlTransform(XML . "/kategorie.xml", XML . '/kategorie.xsl') ?>
</div>
<button onclick="moveToTop()" class="fixed w-32 h-32 rounded-full bg-blue-700 text-white flex justify-center items-center bottom-5 right-5">
Back to top
</button>
<?php
require SERVE . '/filter.php';
require INC . '/html-end.php';
