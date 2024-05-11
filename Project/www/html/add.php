<?php
require '../prolog.php';
require INC . '/html-base.php';
require INC . '/xmlTools.php';

$message = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['xml'])) {
    $xmlFile = $_FILES['xml'];
    $tmpName = $xmlFile['tmp_name'];

    if (file_exists($tmpName)) {
        $isValid = xmlValidate($tmpName, XML . '/movie.xsd');
        if (!$isValid) {
            $message = "Neplatný XML soubor";
        } else {
            $doc = new DOMDocument();
            $doc->load($tmpName);
            $movieElement = $doc->getElementsByTagName('movie')->item(0);
            $id = $movieElement->getAttribute('id');
            $imdb = $movieElement->getAttribute('imdb');
            if (!$id) {
                $message = "XML soubor nemá atribut 'id'";
            } else {
                $target = MOVIES . "/$id.xml";

                if (file_exists($target)) {
                    $message = "Soubor již existuje";
                } else {
                    if (rename($tmpName, $target)) {
                        $indexFile = MOVIES . '/index.xml';
                        if (file_exists($indexFile)) {
                            $doc->load($indexFile);
                            $root = $doc->documentElement;

                            // Create the movie element with all details
                            $newMovie = $doc->createElement('movie');
                            $newMovie->setAttribute('id', $id);
                            $newMovie->setAttribute('imdb', $imdb);
                            $newMovie = $root->appendChild($newMovie);

                            $title = $doc->createElement('title', $movieElement->getElementsByTagName('title')->item(0)->nodeValue);
                            $newMovie->appendChild($title);

                            $release = $doc->createElement('release', $movieElement->getElementsByTagName('release')->item(0)->nodeValue);
                            $newMovie->appendChild($release);

                            $poster = $doc->createElement('poster');
                            $posterImage = $doc->createElement('image');
                            $posterImage->setAttribute('url', $movieElement->getElementsByTagName('poster')->item(0)->getElementsByTagName('image')->item(0)->getAttribute('url'));
                            $poster->appendChild($posterImage);
                            $newMovie->appendChild($poster);

                            $categoriesElement = $doc->createElement('categories');
                            foreach ($movieElement->getElementsByTagName('categories')->item(0)->getElementsByTagName('category') as $category) {
                                $catElement = $doc->createElement('category', $category->nodeValue);
                                $categoriesElement->appendChild($catElement);
                            }
                            $newMovie->appendChild($categoriesElement);

                            $doc->save($indexFile);
                            $message = "Film přidán úspěšně";
                        } else {
                            $message = "Index soubor neexistuje";
                        }
                    } else {
                        $message = "Chyba při ukládání souboru";
                    }
                }
            }
        }
    } else {
        $message = "Žádný soubor nebyl nahrán";
    }
}
?>
<main class="min-h-[90vh] flex flex-col justify-center">
<form action="add.php" method="post" enctype="multipart/form-data" class="w-72 h-64 bg-stone-300 flex flex-col justify-evenly items-center rounded-lg mx-auto">
	<h1 class="text-2xl font-bold">Přidat film</h1>
	<div class="px-5 w-full">
	<input type="file" name="xml" accept="text/xml" data-max-file-size="1M">
	</div>
	<button type="submit" class="bg-blue-300 px-3 py-1 border border-2 border-black rounded-lg hover:bg-blue-400">
		Přidat
	</button>
</form>
<div  class="bg-red-200 my-10 mx-20 px-10">
<!-- Display messages -->
<?php if ($message): ?>
<p><?= htmlspecialchars($message) ?></p>
<?php endif; ?>
</div>
</main>
<?php
require INC . '/html-end.php';
