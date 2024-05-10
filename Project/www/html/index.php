<?php
require '../prolog.php';
require INC . '/html-base.php';
require INC . '/xmlTools.php';
?>
<div class="w-full h-full flex flex-row gap-10">
	<div class="w-1/2 my-auto flex flex-col justify-center items-center gap-10 z-10">
		<img src="assets/logo.png" alt="MovieDB" class="w-2/4">
		<h1 class="text-8xl font-bold text-white underline underline-offset-8">MovieDB</h1>
	</div>

	<div class="w-1/2 my-auto flex flex-col justify-center items-center gap-10 ">
		<div class="w-full h-screen bg-stone-800">
			<?= xmlTransform(XML . "/filmy.xml", XML . '/display.xsl') ?>
		</div>
	</div>

</div>
<?php
require INC . '/html-end.php';
