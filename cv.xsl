<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/resume">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta name="HandheldFriendly" content="true"/>
				<link type="text/css" rel="stylesheet" charset="UTF-8" href="xsl.css"/>
			</head>
			<body>
				<div class="page">
					<header>
						<h1 class="name">
							<xsl:value-of select="firstname"/>
							<xsl:value-of select="lastname"/>
						</h1>
						<div class="contact">
							<a href="tel:{telephone}">
							  <xsl:value-of select="telephone"/>
							</a>
							●
							<a href="mailto:{email}">
							  <xsl:value-of select="email"/>
							</a>
						</div>
					</header>
					<xsl:for-each select="section">
						<section>
							<h2>
								<xsl:value-of select="title"/>
							</h2>
							<xsl:if test="highlight">
								<div class="experience">
									<ul>
										<xsl:apply-templates select="highlight"/>
									</ul>
								</div>
							</xsl:if>
							<xsl:for-each select="experience">
								<div class="experience">
									<h3>
										<xsl:value-of select="title"/>
									</h3>
									<div class="dates"><xsl:value-of select="start"/> » <xsl:value-of select="end"/></div>
									<div class="location"><xsl:value-of select="organisation"/>, <xsl:value-of select="location"/></div>
									<ul>
										<xsl:apply-templates select="highlight"/>
									</ul>
								</div>
							</xsl:for-each>
						</section>
					</xsl:for-each>
					<footer>
						<xsl:value-of select="document('.git/head-info.xml')/head/hash"/>
					</footer>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="highlight">
		<li xmlns="http://www.w3.org/1999/xhtml">
			<xsl:choose>
				<xsl:when test="list">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="list/item[position() = 1]"/>
					<xsl:for-each select="list/item[position() > 1 and position() &lt; last()]" >, <xsl:value-of select="."/></xsl:for-each> &amp;
					<xsl:value-of select="list/item[position() = last()]"/>.
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>
</xsl:stylesheet>
