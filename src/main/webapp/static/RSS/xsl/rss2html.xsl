<xsl:stylesheet
		version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:media="http://search.yahoo.com/mrss/"
		exclude-result-prefixes="media">
	<xsl:output
			method="html"
			indent="no"/>
	<xsl:template match="/">
		<xsl:copy>
			<xsl:apply-templates select="//item"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="item">
		<div class="item">
			<a class="link">
				<xsl:attribute name="href">
					<xsl:value-of select="link"/>
				</xsl:attribute>
				<p class="desc">
					<xsl:value-of select="title"/>
				</p>
			</a>
            <p class="date">
               <xsl:value-of select="pubDate"/>
            </p>
		</div>
	</xsl:template>
</xsl:stylesheet>