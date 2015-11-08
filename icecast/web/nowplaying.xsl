<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<html>
<head>
<link rel="stylesheet" href="http://play.dogmazic.net/themes/reborn/templates/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="http://play.dogmazic.net/themes/reborn/templates/dark.css" type="text/css" media="screen" />
<meta http-equiv="refresh" content="5">
</head>
<body>
<xsl:for-each select="source">
<xsl:choose>
<xsl:when test="listeners">
	
<xsl:if test="artist">
	<xsl:value-of select="artist" /> - 
		<!--<a href="#" onClick="goSearch();">--><xsl:value-of select="title" />
		<!--</a>-->
	<!--<script>
	var artist='<xsl:value-of select="artist" />';
	var title='<xsl:value-of select="title" />';
	function goSearch {
		document.location.href="";
		//todo trouver une url Ampache pour avoir le morceau en lui passant encodeURI(artist) et encodeURI(title) en paramètres
	}
	
	</script>-->
</xsl:if>
<br/>
<xsl:if test="listeners">
Listeners : <xsl:value-of select="listeners" />
</xsl:if>



</xsl:when>
<xsl:otherwise>
<h3><xsl:value-of select="@mount" /> is currently offline</h3>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
