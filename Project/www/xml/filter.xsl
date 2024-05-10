<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:param name="selectedCategory"/>

    <xsl:template match="/movies">
    	<main class="flex flex-col items-center w-screen gap-10">
	<h1 class="text-5xl text-white font-bold">Movies in Category: <xsl:value-of select="$selectedCategory"/></h1>
	<div class="grid grid-cols-4 gap-5">
<xsl:apply-templates select="movie[categories/category = $selectedCategory]"/>
	</div>
	</main>	    
    </xsl:template>

    <xsl:template match="movie">
        <div class="w-52 h-72 bg-stone-800 rounded-lg">
            <h2><xsl:value-of select="title"/></h2>
            <p>Release Year: <xsl:value-of select="release"/></p>
            <p>Categories: 
                <xsl:for-each select="categories/category">
                    <span><xsl:value-of select="."/> </span>
                </xsl:for-each>
            </p>
        </div>
    </xsl:template>

</xsl:stylesheet>
