<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/resume">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<link type="text/css" rel="stylesheet" charset="UTF-8" href="xsl.css"/>
			</head>
			<body>
				<div class="page">
					<header>
						<h1 class="name">
							<xsl:value-of select="firstname"/>
							<xsl:value-of select="lastname"/>
						</h1>
						<div class="contact"><xsl:value-of select="telephone"/>
					●
					<xsl:value-of select="email"/></div>
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
										<!-- <xsl:for-each select="highlight">
											<li>
												<xsl:value-of select="."/>
											</li>
										</xsl:for-each> -->
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
										<xsl:apply-templates/>
										<!-- <xsl:for-each select="highlight">
											<li>
												<xsl:value-of select="."/>
											</li>
										</xsl:for-each> -->
									</ul>
								</div>
							</xsl:for-each>
						</section>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="highlight">
		<li xmlns="http://www.w3.org/1999/xhtml">
			<xsl:value-of select="text()"/>
			<xsl:if test="list">
				<xsl:value-of select="list/item[position() = 1]"/>
				<xsl:for-each select="list/item[position() > 1 and position() &lt; last()]" >, <xsl:value-of select="."/></xsl:for-each> &amp;
				<xsl:value-of select="list/item[position() = last()]"/>
			</xsl:if>
		</li>
	</xsl:template>
</xsl:stylesheet>
