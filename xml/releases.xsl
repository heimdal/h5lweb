<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>


  <xsl:template match="release-content">
    <h3>Heimdal releases</h3>
    <frameset onload="showonload();">
      <xsl:for-each select="/doc/software/releases/release">
	<xsl:sort select="date" order="descending"/>
	<div class="action unit">
	  <a href="javascript:showhide('{version}');">
	    <xsl:value-of select="date"/>
	    <xsl:text> - </xsl:text>
	    <xsl:value-of select="name"/>
	    <xsl:text> </xsl:text>
	    <xsl:value-of select="version"/>
	  </a>
	  <div class="install-description" id="{version}">
	    <p>
	      <b>
		<xsl:value-of select="name"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="version"/>
	      </b>
	    </p>
	    <p>
	      Released <xsl:value-of select="date"/>
	      <xsl:text> </xsl:text>
	      <xsl:choose>
		<xsl:when test="deprecated-release">
		  and is deprecated
		  <a href="/dist/src/old/heimdal-{version}.tar.gz" onclick="javascript: pageTracker._trackPageview('/downloads/heimdal-{version}'); ">
		    heimdal-<xsl:value-of select="version"/>.tar.gz
		  </a>
		</xsl:when>
		<xsl:otherwise>
		  <a href="/dist/src/heimdal-{version}.tar.gz" onclick="javascript: pageTracker._trackPageview('/downloads/heimdal-{version}'); ">
		    heimdal-<xsl:value-of select="version"/>.tar.gz
		  </a>
		</xsl:otherwise>
	      </xsl:choose>
	    </p>
	    <p>
	      <b>Major changes</b>
	    </p>
	    <ul>
	      <xsl:for-each select="major-changes/change">
		<li><xsl:apply-templates/></li>
	      </xsl:for-each>
	    </ul>
	    <xsl:if test="count(vulnerabilities/vulnerability) != 0">
	      <p>
		<b>Vulnerabilities</b>
	      </p>
	      <ul>
		<xsl:for-each select="vulnerabilities/vulnerability">
		  <xsl:for-each select="/doc/software/vulnerabilities/vulnerability[@date=current()/@date]">
		    <li>
		      <a href="advisories.html?show={@date}">
			<xsl:value-of select="@date"/>
			<xsl:text> - </xsl:text>
			<xsl:value-of select="short"/>
		      </a>
		    </li>
		  </xsl:for-each>
		</xsl:for-each>
	      </ul>
	    </xsl:if>
	  </div>
	</div>
      </xsl:for-each>
    </frameset>
  </xsl:template>

</xsl:stylesheet>
