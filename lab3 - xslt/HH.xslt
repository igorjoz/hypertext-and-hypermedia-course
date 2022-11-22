<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">

		<html>
			<head>
				<meta charset="UTF-8" />
				<title>Hypertext hypermedia</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<link rel="stylesheet" href="index.css" />
			</head>
			<body>
				<div id="wrapper">
					<header>
						<h1>Hypertext hypermedia</h1>
					</header>

					<!-- menu for moving within a page -->
					<xsl:call-template name="navigation"></xsl:call-template>


					<div id="content">
						<h2 id="scientists">Scientists</h2>
						<xsl:apply-templates select="hypertext/people/person"/>
						<!-- a place for information about hypertext scientists -->

						<h2 id="systems">Systems</h2>
						<xsl:apply-templates select="hypertext/systemList/system"/>
						<!-- a place for information about hypertext systems -->


					</div>
				</div>
				<footer>
					<xsl:apply-templates select="hypertext/author"/>	<!-- wywołanie szablonu pozwalającego na wyświetlenie informacji o imieniu oraz nazwisku studenta -->
				</footer>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="author">
		Copyright 2022,
		<xsl:value-of select="name"/>
		<xsl:value-of select="surname"/>
	</xsl:template>

	<xsl:template name="navigation">
		<nav>
			<ul>
				<li>
					<a href="#scientists">Scientists</a>
				</li>
				
				<li>
					<a href="#systems">Systems</a>
				</li>
			</ul>
		</nav>
	</xsl:template>

	<xsl:template match="link">
			<a href="{@source}" target="_blank">
				<xsl:value-of select="."/>
			</a>
			<br/>
	</xsl:template>

	<xsl:template match="image">
		<img src="{@source}" class="right">
			
			<xsl:attribute name="title">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</img>
	</xsl:template>

	<xsl:template match="person">
		<h3>
			<xsl:value-of select="name"/>
			<xsl:value-of select="surname"/>
		</h3>
		<p>
			Date of birth:
			<xsl:value-of select="birth"/>
		</p>
		
		<xsl:if test="@alive='no'">
			<p>
				Date of death: <xsl:value-of select="death"/>
			</p>
		</xsl:if>

		<xsl:apply-templates select="image"/>

		<br/>

		<xsl:for-each select="achievementList/achievement">
			<xsl:sort select="title" order="ascending"/>
			
			<xsl:number value="position()" format="1."/>
			
			<xsl:value-of select="title"/>
			
			<br/>
			
			<xsl:value-of select="description"/>
			
			<br/>
		</xsl:for-each>

		<ul>
			<li>
				<xsl:apply-templates select="link"/>
			</li>
		</ul>
	</xsl:template>

	<xsl:template match="system">
		<header>
			<h3>
				<xsl:value-of select="name"/>
			</h3>	
		</header>
		
		<div>
			<p>
				<xsl:value-of select="description"/>
			</p>
		</div>
		
		<xsl:apply-templates select="link"/>
	</xsl:template>

</xsl:stylesheet>
