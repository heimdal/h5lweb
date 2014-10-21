<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>

  <xsl:template match="doc/footer">
    <div id="footer">
      Contact address:
      <address>
	heimdal@h5l.org
      </address>
      
      <a id="validator" href="http://validator.w3.org/check/referer">
	<img src="http://www.w3.org/Icons/valid-xhtml10"
	     alt="Valid XHTML 1.0!" height="31" width="88" />
      </a>

    </div>
  </xsl:template>

</xsl:stylesheet>
