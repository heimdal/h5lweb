<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		>

  <xsl:template match="a">
    <a href="{@href}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="roundedbox">
    <div style="width: 100%;">
      <b class="rtop">
	<b class="r1"></b> <b class="r2"></b> <b class="r3"></b> <b class="r4"></b>
      </b>
      <div style="text-align: center;">
	<h3>
	  <xsl:apply-templates/>
	</h3>
      </div>
      <b class="rbottom">
	<b class="r4"></b> <b class="r3"></b> <b class="r2"></b> <b class="r1"></b>
      </b>
    </div>
  </xsl:template>

  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="b">
    <b>
      <xsl:apply-templates/>
    </b>
  </xsl:template>


  <xsl:template match="pre">
    <pre class="{@class}">
      <xsl:value-of select="."/>
    </pre>
  </xsl:template>

  <xsl:template match="img">
    <img src="{@src}"/>
  </xsl:template>

  <xsl:template match="h1">
    <h1>
      <xsl:apply-templates/>
    </h1>
  </xsl:template>

  <xsl:template match="h2">
    <h2>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>

  <xsl:template match="h3">
    <xsl:if test="@link">
      <a name="{@link}"/>
    </xsl:if>
    <h3>
      <xsl:apply-templates/>
    </h3>
  </xsl:template>

  <xsl:template match="br">
    <br/>
  </xsl:template>

  <xsl:template match="ul">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="li">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>


</xsl:stylesheet>
