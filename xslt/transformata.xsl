<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="rootElement">
		<xsl:apply-templates select="commits"/>  
	</xsl:template>

	<xsl:template match="commits">
		<FacebookPosts>
			<xsl:choose>
				<xsl:when test="contains(message, '[Facebook]')">
					<header>Yo! Look at my genius commit!</header>
					<postToFacebook>true</postToFacebook>
					<msg>
						<xsl:call-template name="removePrefix">
							<xsl:with-param name="value" select="message"/>
						</xsl:call-template>
					</msg>
				</xsl:when>
				<xsl:otherwise>
					<postToFacebook>false</postToFacebook>
					<msg>
						<xsl:value-of select="message"/>
					</msg>
				</xsl:otherwise>
			</xsl:choose>
			<author>
				<username>
					<xsl:value-of select="author/username"/>
				</username>
			</author>
			<timestamp>
				<xsl:value-of select="timestamp" />
			</timestamp>
			<id>
				<xsl:value-of select="id" />
			</id>
			<url>
				<xsl:value-of select="url" />
			</url>
		</FacebookPosts>
	</xsl:template>
	
	<xsl:template name="removePrefix">
		<xsl:param name="value"/>
		<xsl:value-of select="substring-after($value, '[Facebook]')"/>
	</xsl:template>
	
</xsl:stylesheet>
