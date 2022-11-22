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

					<!-- menu do poruszania w obrębie strony -->
					<!-- menu for moving within a page -->
					<xsl:call-template name="nav"/>

					<div id="content">
						<h2 id="scientists">Scientists</h2>
						<!-- a place for information about hypertext scientists -->

						<xsl:apply-templates select="hypertext/people/person"/>
						

						<h2 id="systems">Systems</h2>
						<!-- a place for information about hypertext systems -->
						<xsl:apply-templates select="hypertext/systemList/system"/>
						
					</div>
					<!-- end content -->
				</div>
				<!-- end wrapper -->
				<footer>
					<xsl:apply-templates select="hypertext/author"/>
						<!-- wywołanie szablonu pozwalającego na wyświetlenie informacji o imieniu oraz nazwisku studenta -->
				</footer>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="link">
		<xsl:if test="not(position()=last())">

		<a target="_blank" href="{@source}">
			<xsl:value-of select="."/>
		</a>
		<br/>
		</xsl:if>

	</xsl:template>


	

	<xsl:template match="person">
		<h4>
		<xsl:value-of select="name"/>
		<xsl:value-of select="surname"/>
		</h4>
		Date of birth: <xsl:value-of select="birth"/>
		<br/>
		<xsl:if test="@alive='no'">
		Date of death: <xsl:value-of select="death"/>
		<br/>
		</xsl:if>


		<xsl:apply-templates select="image"/>

		<xsl:for-each select="achievementList/achievement">
			<xsl:sort select="title" order="ascending"/>
			<xsl:number value="position()" format="1)"/>
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

	<xsl:template match="image">	
		<img src="{@source}" class="right">
		<xsl:attribute name="title">
			<xsl:value-of select="."/>
		</xsl:attribute>
		</img>

	</xsl:template>


	<xsl:template match="system">
		<h4><xsl:value-of select="name"/></h4>
		<p><xsl:value-of select="description"/></p>
		<xsl:apply-templates select="link"/>
		
	</xsl:template>

	<xsl:template match="author">
		Copyright 2022, 
		<xsl:value-of select="name"/>
		<xsl:value-of select="surname"/>
	</xsl:template>


	<xsl:template name="nav">
		<nav>
			<ul>
				<li> <a href="#scientists">Scientists</a> </li>
				<li> <a href="#systems">Systems</a> 	</li>
			</ul>
		</nav>
		
	</xsl:template>

<!--		<nav>
			<ul>
				<li> <a href="#scientists">Scientists</a> </li>
				<li> <a href="#systems">Systems</a> 	</li>
			</ul>
		</nav>	
-->

</xsl:stylesheet>
