<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <title><xsl:value-of select="/rss/channel/title"/> — RSS Feed</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <style>
          * { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            font-family: 'Georgia', serif;
            background: #1a1a2e;
            color: #e0d6c8;
            max-width: 700px;
            margin: 0 auto;
            padding: 2rem 1.5rem;
            line-height: 1.6;
          }
          .banner {
            background: linear-gradient(135deg, #2a1a3e, #1a1a2e);
            border: 1px solid #3d2a5c;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            text-align: center;
          }
          .banner h1 {
            color: #f0c674;
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
          }
          .banner p {
            color: #a89b8c;
            font-size: 0.9rem;
          }
          .notice {
            background: #2a2a3e;
            border-left: 3px solid #f0c674;
            padding: 0.75rem 1rem;
            margin-bottom: 2rem;
            border-radius: 0 8px 8px 0;
            font-size: 0.85rem;
            color: #c8b8a8;
          }
          .notice strong { color: #f0c674; }
          .post {
            border-bottom: 1px solid #2a2a3e;
            padding: 1.25rem 0;
          }
          .post:last-child { border-bottom: none; }
          .post h2 {
            font-size: 1.15rem;
            margin-bottom: 0.25rem;
          }
          .post h2 a {
            color: #f0c674;
            text-decoration: none;
          }
          .post h2 a:hover {
            text-decoration: underline;
          }
          .post .date {
            color: #7a6f63;
            font-size: 0.8rem;
          }
          .post .desc {
            margin-top: 0.5rem;
            color: #c8b8a8;
            font-size: 0.95rem;
          }
        </style>
      </head>
      <body>
        <div class="banner">
          <h1>✦ <xsl:value-of select="/rss/channel/title"/></h1>
          <p><xsl:value-of select="/rss/channel/description"/></p>
        </div>
        <div class="notice">
          <strong>This is an RSS feed.</strong> Copy the URL into your feed reader to subscribe. New posts delivered straight to you.
        </div>
        <xsl:for-each select="/rss/channel/item">
          <div class="post">
            <h2><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a></h2>
            <div class="date"><xsl:value-of select="pubDate"/></div>
            <xsl:if test="description">
              <div class="desc"><xsl:value-of select="description"/></div>
            </xsl:if>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
