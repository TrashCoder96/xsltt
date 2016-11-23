<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/" name="patient_template">
        <xsl:param name="name_param" />
        <xsl:param name="param1_param" />
        <xsl:param name="param2_param" />
        <tr>
            <td>
                <xsl:if test="$param1_param &gt; 100">
                    <xsl:attribute name="style">
                        <xsl:text>color:green</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="$name_param"/>
            </td>
            <td><xsl:value-of select="$param1_param"/></td>
            <td><xsl:value-of select="$param2_param"/></td>
            <td><xsl:value-of select="number($param1_param)*(number($param2_param))"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="/">

        <html>
            <head>
                <title>еее рок</title>
            </head>
            <body>
                <table border="1">
                    <tr>
                        <th>Имя</th>
                        <th>Param1</th>
                        <th>Param2</th>
                        <th>SumParam</th>
                    </tr>
                    <xsl:for-each select="history/patient">
                        <xsl:sort select="param1" data-type="number" order="descending"/>
                        <xsl:call-template name="patient_template">
                            <xsl:with-param name="name_param" select="name"/>
                            <xsl:with-param name="param1_param" select="param1"/>
                            <xsl:with-param name="param2_param" select="param2"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </table>
                Сумма param1:
                <xsl:value-of select="sum(history/patient/param1)" />
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>