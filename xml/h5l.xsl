<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>

<xsl:output
   method="xml"
   indent="yes"
   encoding="UTF-8"
   doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
   doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
   />

<xsl:template match="doc">
  <html>
    <head>
      <title>
	<xsl:value-of select="header/title"/>
      </title>
      <link rel="stylesheet" 
	    type="text/css"
	    href="heimdal.css"
	    media="screen,projection" />
      <script src="actions.js" type="text/javascript"/>
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-72361364-4', 'auto');
        ga('send', 'pageview');
      </script>
      <meta name="description" content="Heimdal"/>
      <meta name="keywords" 
	    content="kerberos 5 kerberos5 kth pdc nada stockholm university heimdal"/>
    </head>
    <body onload="showonload();">
      <xsl:apply-templates select="one|three|header|footer"/>
    </body>
  </html>
</xsl:template>

<xsl:include href="basic.xsl"/>
<xsl:include href="header.xsl"/>

<xsl:template match="one/content">
  <div id="mainContent">
    <div class="onefull">
      <xsl:apply-templates/>
    </div>
  </div>
</xsl:template>

<xsl:template match="three/left">
  <div id="content">
    <div class="quarter noBorderOnLeft borderOnRight sideBarLeft">
      <xsl:apply-templates/>
    </div>
  </div>
</xsl:template>
  
<xsl:template match="three/middle">
  <div id="mainContent">
    <div class="half noBorderOnLeft">
      <xsl:apply-templates/>
    </div>
  </div>
</xsl:template>
  
<xsl:template match="three/right">
  <div id="news">
    <div class="quarter">
      <xsl:apply-templates/>
    </div>
  </div>
</xsl:template>

<xsl:template match="three/right/advisories">
  <div class="advisories">
    <ul>
      <xsl:for-each select="/doc/software/vulnerabilities/vulnerability">
	<xsl:sort select="@date" order="descending"/>
	<xsl:if test="position() &lt;= 5">
	  <li>
	    <a href="advisories.html?show={@date}">
	      <xsl:value-of select="@date"/> : 
	      <xsl:value-of select="short"/>
	    </a>
	  </li>
	</xsl:if>
      </xsl:for-each>
    </ul>
  </div>
</xsl:template>

<xsl:template match="last-release-date">
  <xsl:for-each select="/doc/software/releases/release">
    <xsl:sort select="date" order="descending"/>
    <xsl:if test="position() = 1">
      <a href="releases.html?show={version}">
	<xsl:value-of select="date"/>
      </a>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="show-last-release-version">
  <xsl:for-each select="/doc/software/releases/release">
    <xsl:sort select="version" order="descending"/>
    <xsl:if test="position() = 1">
      <a href="releases.html?show={version}">
	<xsl:value-of select="version"/>
      </a>
    </xsl:if>
  </xsl:for-each>
</xsl:template>


<xsl:template match="download-last-release-version">
  <xsl:for-each select="/doc/software/releases/release">
    <xsl:sort select="version" order="descending"/>
    <xsl:if test="position() = 1">
      <a href="https://github.com/heimdal/heimdal/releases/tag/heimdal-{version}">
	Download 
	<xsl:value-of select="version"/>
      </a>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="toc">
  <div class="toc">
    <ul>
    <xsl:for-each select="../h3">
      <li><a href="#{@link}"><xsl:value-of select="."/></a></li>
    </xsl:for-each>
    </ul>
  </div>
</xsl:template>


<!-- Binaries -->

<xsl:include href="binaries.xsl"/>
<xsl:include href="releases.xsl"/>
<xsl:include href="advisories.xsl"/>

<xsl:include href="footer.xsl"/>

</xsl:stylesheet>
