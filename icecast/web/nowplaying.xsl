<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output omit-xml-declaration="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match="/icestats" >

<html>
<head>
   <title>Now Playing...</title>
   <link rel="stylesheet" href="http://play.dogmazic.net/themes/reborn/templates/default.css" type="text/css" media="screen" />
   <link rel="stylesheet" href="http://play.dogmazic.net/themes/reborn/templates/dark.css" type="text/css" media="screen" />
   
   <meta http-equiv="Pragma" content="no-cache" />
   <meta http-equiv="Expires" content="-1" />
   <meta http-equiv="refresh" content="5" />
</head>
<body>

<xsl:for-each select="source">
   <xsl:if test="@mount='/stream.ogg'">
      <xsl:choose>
		  <xsl:when test="listeners">
			 <xsl:if test="artist">
				<span>
					<a href="#" onClick="goSearchArtist();" title="Show artist"><xsl:value-of select="artist" /></a> - 
					<a href="#" onClick="goSearchSong();" title="Show song"><xsl:value-of select="title" /></a>
					<script type="text/javascript">
						var artist='<xsl:value-of select="artist" />';
						var title='<xsl:value-of select="title" />';
						
						function goSearchArtist() {
						   window.open('http://play.dogmazic.net/search.php?type=song&amp;action=search&amp;type=artist&amp;rule_1_operator=0&amp;rule_1=name&amp;rule_1_input=' + encodeURI(artist));
						}
						
						function goSearchSong() {
						   window.open('http://play.dogmazic.net/search.php?type=song&amp;action=search&amp;type=song&amp;rule_1_operator=0&amp;rule_1=artist&amp;rule_1_input=' + encodeURI(artist) + '&amp;rule_2_operator=0&amp;rule_2=title&amp;rule_2_input=' + encodeURI(title));
						}
					</script>
				</span>
			 </xsl:if>
		  </xsl:when>
		  <xsl:otherwise>
			 <h3><xsl:value-of select="@mount" /> is currently offline</h3>
		  </xsl:otherwise>
      </xsl:choose>
	</xsl:if>
</xsl:for-each>
<span style="float: right;">Listeners: <xsl:value-of select="sum(source/listeners)"/></span>

</body>
</html>

</xsl:template>
</xsl:stylesheet>