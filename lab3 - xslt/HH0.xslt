<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">

		<html>
			<head>
				<meta charset="UTF-8" />
			</head>
			
			<body>
					<header>
						<h3>Hypertext hypermedia</h3>
					</header>

				<section>
					<xsl:call-template name="personNameAndSurname"></xsl:call-template>
				</section>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="hypertext/people/person" name="personNameAndSurname">

		<xsl:value-of select="hypertext/people/person/name"/>

		<xsl:value-of select="hypertext/people/person/surname"/>

		<br></br>
		
		<xsl:value-of select="hypertext/people/person[2]/name"/>

		<xsl:value-of select="hypertext/people/person[2]/surname"/>
		
	</xsl:template>

</xsl:stylesheet>
