<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>


  <xsl:template match="doc/header">

    <div class="header">
      <div id="centerheader">
	<table>
	  <tr>
	    <td>
	      <a href="logo.html">
		<img src="/ref/keyhole-heimdal.png" width="311" height="100" alt="keyhole logo"/>
	      </a>
	    </td>
	    <td>
	      <p>
		<xsl:apply-templates select="text"/>
	      </p>
	    </td>
	  </tr>
	</table>
      </div>

    </div>

    <div class="nav">
      <a href="index.html">Home</a>
      <xsl:text> </xsl:text>
      <a href="releases.html">Releases</a>
      <xsl:text> </xsl:text>
      <a href="help.html">Contribute</a>
      <xsl:text> </xsl:text>
      <a href="advisories.html">Advisories</a>
      <xsl:text> </xsl:text>
      <a href="binaries.html">Binaries</a>
      <xsl:text> </xsl:text>
      <a href="sources.html">Sources</a>
      <xsl:text> </xsl:text>
      <a href="compile.html">Building</a>
      <xsl:text> </xsl:text>
      <a href="/blog/">Blog <img alt="rss" src="rss.png"></img></a>
    </div>

  </xsl:template>
</xsl:stylesheet>
