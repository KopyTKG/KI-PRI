<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/categories">
         <main>
             <div class="grid grid-cols-4 min-w-2/4 gap-5">
                 <xsl:apply-templates select="category"/>
             </div>
	     </main>
	     <script>
	     if (window.location.href.includes("c=")) {
	     		var category = window.location.href.split("c=")[1];
	    	 	const el = document.getElementById(category);
	     		classes = ["border", "border-white", "border-2"]
	     		classes.forEach((c) => {
	     			el.classList.add(c); 
	     		})
	     }
	     function SetCategory(category) {
			window.location.href = "index.php?c=" + category;
	     }
	     </script>
    </xsl:template>

    <xsl:output method="html" indent="yes"/>
    <xsl:template match="category">
    <div id="{name}"  class="box w-52 h-32 overflow-hidden rounded-xl" onclick="SetCategory('{name}')">
    <div class="w-52 h-32 {color}/70 z-[100] flex items-center justify-center relative hover:{color}/90">
        		<h2 class="text-xl font-bold text-center">
                		<xsl:value-of select="name"/>
			</h2>
		</div>
		<img src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/{background/@url}" alt="{name}" class="relative -mt-48 z-[0]"/>
        </div>
    </xsl:template>

</xsl:stylesheet>
