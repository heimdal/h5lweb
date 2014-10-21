<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>

  <xsl:template match="advisory-content">
    <h3>Heimdal advisories</h3>
    <frameset onload="showonload();">
      <xsl:for-each select="/doc/software/vulnerabilities/vulnerability">
	<xsl:sort select="@date" order="descending"/>
	<div class="action unit">
	  <a href="javascript:showhide('{@date}');">
	    <xsl:value-of select="@date"/>
	    <xsl:text> - </xsl:text>
	    <xsl:value-of select="short"/>
	  </a>
	  <div class="install-description" id="{@date}">
	    <p><b><xsl:value-of select="short"/></b></p>
	    <p>
	      <b>Description:</b><br/>
	      <xsl:copy-of select="description"/>
	    </p>
	    
	    <p>
	      <b>Applies to versions:</b><br/>
	      <ul>
		<xsl:call-template name="release-advisory">
		  <xsl:with-param name="date" select="@date" />
		</xsl:call-template>
	      </ul>
	    </p>
	    <xsl:if test="count(cve) != 0">
	      <b>See also:</b><br/>
	      <p>
		<xsl:for-each select="cve">
		  <a href="http://cve.mitre.org/cgi-bin/cvename.cgi?name={.}">
		    <xsl:value-of select="."/>
		  </a> 
		  <xsl:text> </xsl:text>
		</xsl:for-each>
	      </p>
	    </xsl:if>
	  </div>
	</div>
      </xsl:for-each>
    </frameset>
  </xsl:template>

  <xsl:template name="release-advisory">
    <xsl:param name="date" select="'dummy-date'" />
    <xsl:for-each select="/doc/software/releases/release/vulnerabilities/vulnerability[@date=$date]">
      <xsl:sort select="../../version" order="descending"/>
      <li>
	<a href="releases.html?show={../../version}">
	  <xsl:value-of select="../../name"/>
	  <xsl:text> - </xsl:text>
	  <xsl:value-of select="../../version"/>
	</a>
      </li>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
