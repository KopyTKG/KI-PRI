<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/movies">
	<main class="grid grid-cols-12 max-h-screen overflow-hidden gap-2">
        	<xsl:apply-templates select="movie"/>
        </main>
    </xsl:template>

    <xsl:template match="movie">
    <div class="w-24 h-36 skew-y-6 -skew-x-12 hover:scale-110 ease-in-out duration-100">
    	<img src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/{poster/image/@url}" alt="{title}" class="w-full h-full rounded-lg"/>
    </div>
    </xsl:template>

</xsl:stylesheet>
