#!/bin/bash

# Source file (modify this)
RSS_FILE="Helsinki.xml"

# Remove HTML
sed -E '
# Links to text (link)
s#<a href="([^"]+)">([^<]+)</a>#\2 (\1)#g;
# Remove other tags
s#\r##g;
s#\r$##g;
s#\n##g;
s#^m##g;
s#&lt;strong&gt;##g;
s#&lt;/strong&gt;##g;
s#&#13;##g;
s#&lt;br\s*/?&gt;# #g;
s#&lt;p&gt;# #;
s#&lt;/p&gt;##g;
s#&lt;i&gt;##g;
s#&lt;/i&gt;##g;
' "$RSS_FILE" > Helsinki_clean.xml # Modify this

# It's not clean but fine to be published


