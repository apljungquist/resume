# Maintain a file with information about current HEAD for use with XSLT
filepath=".git/head-info.xml"

echo '<?xml version="1.0" encoding="UTF-8"?>' > "${filepath}"
echo '<?xml-stylesheet type="text/xsl" href="cv.xsl"?>' >> "${filepath}"
echo "<head>" >> "${filepath}"
echo "<hash>$(git rev-parse HEAD)</hash>" >> "${filepath}"
echo "</head>" >> "${filepath}"
