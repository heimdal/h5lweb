<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>

  <xsl:template match="distribution">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="distribution/name">
  </xsl:template>

  <xsl:template match="distribution/description">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="distribution/versions">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="distribution/versions/version">
    <li>
      <div class="action unit" id="{id}">
	<a href="javascript:showhide('description-{id}');">
	  <xsl:value-of select="version-name"/>
	</a>
	<div class="install-description" id="description-{id}">
	  <ul>
	    <xsl:apply-templates select="install"/>
	  </ul>
	</div>
      </div>
    </li>
  </xsl:template>

  <xsl:template match="distribution/versions/version/install/step">
    <li><xsl:apply-templates/></li>
  </xsl:template>

</xsl:stylesheet>
