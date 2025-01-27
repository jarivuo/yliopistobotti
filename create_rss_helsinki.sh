#!/bin/bash

# Read the original RSS feed and pick 8 items (modify this)
events=$(curl -s "https://helsinginyliopisto.etapahtuma.fi/Default.aspx?tabid=1171&format=rss" | xmllint --xpath '//item[position() <= 8]' - 2>/dev/null || echo "")

# A new RSS feed (modify this)
output="Helsinki.xml"

# Start RSS feed
echo '<?xml version="1.0" encoding="UTF-8"?>' > "$output"
echo '<rss xmlns:a10="http://www.w3.org/2005/Atom" version="2.0">' >> "$output" # Modify this if you read some othe page
echo '  <channel>' >> "$output"
echo '    <title>Helsingin yliopisto RSS</title>' >> "$output"
echo '    <link>https://helsinki.fi</link>' >> "$output"
echo '    <description>Poimitut tiedot alkuperäisestä RSS-syötteestä</description>' >> "$output"

# Create <item>-elements
echo "$events" >> "$output"

# End RSS feed
echo '  </channel>' >> "$output"
echo '</rss>' >> "$output"

