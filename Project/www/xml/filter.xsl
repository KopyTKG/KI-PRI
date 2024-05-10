<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:param name="selectedCategory"/>
    <xsl:template match="/movies">
    	<main class="flex flex-col items-center w-screen gap-10">
		<script>
		function selectMovie(id) {
			//redirect to movie.php with id search parameter
			window.location = `movie.php?id=${id}`;
		}
		</script>
	<h1 class="text-5xl text-white font-bold">Movies in Category: <xsl:value-of select="$selectedCategory"/></h1>
		<div class="grid xl:grid-cols-6 lg:grid-cols-5 md:grid-cols-4 sm:grid-cols-3 grid-cols-2 gap-5">
			<xsl:apply-templates select="movie[categories/category = $selectedCategory]"/>
		</div>
	</main>	    
    </xsl:template>

    <xsl:template match="movie">
        <div onclick="selectMovie({@id})" class="w-52 h-72 bg-stone-800 rounded-lg flex flex-col justify-between px-3 py-2 hover:scale-110 ease-in-out duration-100 cursor-pointer">
	<h2 class="w-full bg-black border-stone-600 border text-white rounded-xl text-center px-2 z-10"><xsl:value-of select="title"/></h2>
	<description class="w-max border border-stone-600 bg-stone-800/80 rounded-xl px-2 z-10">
            <p class="text-white text-xl font-bold"><xsl:value-of select="release"/></p>
	</description>
	<img src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/{poster/image/@url}" alt="{title}" class="w-52 h-72 rounded-lg absolute -ml-3 -mt-2 "/>
	</div>
    </xsl:template>

</xsl:stylesheet>
