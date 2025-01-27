#!/bin/bash

# Read the original RSS feed and pick 8 first items (modify this)
events=$(curl -s "https://www.lut.fi/fi/events/all/fi/rss.xml" | xmllint --xpath '//item[position() <= 8]' - 2>/dev/null || echo "")

# A new RSS feed (modify this)
output="LUT.xml"

# Begin RSS feed
echo '<?xml version="1.0" encoding="UTF-8"?>' > "$output"
echo '<rss xmlns:dc="http://purl.org/dc/elements/1.1/" version="2.0" xml:base="https://www.lut.fi/fi">' >> "$output" # Modify this if you read some othe page
echo '  <channel>' >> "$output"
echo '    <title>LUT yliopisto RSS</title>' >> "$output"
echo '    <link>https://lut.fi</link>' >> "$output"
echo '    <description>Poimitut tiedot alkuperäisestä RSS-syötteestä</description>' >> "$output"

# Create <item>-elements
echo "$events" >> "$output"

# End RSS feed
echo '  </channel>' >> "$output"
echo '</rss>' >> "$output"

