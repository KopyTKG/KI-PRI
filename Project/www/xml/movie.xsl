<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="movie">
    <div class="w-screen">
    <div class="flex lg:flex-row flex-col min-h-[45rem] w-full z-50 items-center justify-evenly gap-20">
    <img src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/{poster/image/@url}" alt="{title}" class="rounded-lg h-[35rem] border border-black shadow-2xl shadow-blue-500/40"/>
    <div class="lg:w-1/3 w-[90%] bg-stone-800/60 min-h-[30rem] border border-black border-2 rounded-lg flex flex-col justify-center  text-white">
    <h2 class="text-4xl font-bold text-center">
	<xsl:value-of select="title"/>
	</h2>
	<description class="w-full p-5 flex flex-col gap-3">
	<p class="text-xl font-bold"><xsl:value-of select="tagline"/></p>
	<p class="text-xl font-bold">Description: <xsl:value-of select="description"/></p>
	<p class="text-xl font-bold">Release: <xsl:value-of select="release"/></p>
	<p class="text-xl font-bold">Rating: <xsl:value-of select="rating"/></p>
	</description>
    </div>
	</div>
	</div>
	<img src="https://image.tmdb.org/t/p/original/{backdrop/image/@url}" alt="{title}" class="h-[45rem] absolute top-12 left-0 w-screen object-cover blur-lg -z-10 "/>
    </xsl:template>

</xsl:stylesheet>
