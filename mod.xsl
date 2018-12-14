<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.product-details">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-product-details" ox-mod="product-details">
            <xsl:variable name="product" select="data/ecom-products/i[1]"/>
            <xsl:variable name="product_imgs" select="$product/media/i[type = 'image']"/>
            

            <section class="img-slider">

                <div class="J_slider" data-on="1" data-count="{count($product_imgs)}">
                    <div class="flip-window transition">
                        <div class="flip-pages" style="width:{count($product_imgs)}00%;">
                            <xsl:for-each select="$product_imgs">

                                <img class="flip-page" style="background-image:url({src});"
                                                 src="http://a.oxm1.cc/img/blank.png" />

                            </xsl:for-each>
                        </div>

                    </div>
                    <xsl:if test="count($product_imgs) &gt; 1">

                        <div class="index-dots">
                            <xsl:for-each select="$product_imgs">
                                <i class="dot skin-bgcolor"></i>
                            </xsl:for-each>
                        </div>
                    </xsl:if>
                </div>
            </section>
            <section class="info">
                <h3 class="title">
                    <xsl:value-of select="$product/title"/>
                </h3>
                <p class="brief">
                    <xsl:value-of select="$product/brief"/>
                </p>
                
                <p class="buyinfo">
                    <xsl:if test="$product/price and $product/price != '' ">
                        <span class="price">
                        	<em><xsl:value-of select="$product/price"/></em>
                            <del><xsl:value-of select="$product/orig_price"/></del>
                        </span>
                        &#160;&#160;
                    </xsl:if>
                    <xsl:for-each select="$product/tags/i">
                        <em class="tag {.}"><xsl:value-of select="."/></em>
                    </xsl:for-each>
                </p>

            </section>
            <xsl:if test="count($product/parameter/i) &gt; 0">
                <section class="params">
                    <xsl:for-each select="$product/parameter/i">
                        <p>
                            <xsl:value-of select="name"/>&#160;&#160;
                            <xsl:value-of select="value"/>
                        </p>
                    </xsl:for-each>
                </section>
            </xsl:if>
            <section class="desc-text">
                <xsl:value-of disable-output-escaping="yes" select="$product/description"/>
            </section>
        </div>
    </xsl:template>
</xsl:stylesheet>
