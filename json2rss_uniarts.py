import json
from xml.etree.ElementTree import Element, SubElement, tostring
import xml.dom.minidom

def json_to_rss(json_file, rss_file):
    with open(json_file, 'r') as file:
        data = json.load(file)
    rss = Element('rss')
    rss.set('version', '2.0')
    channel = SubElement(rss, 'channel')

    # Add channel information (modify this)
    title = SubElement(channel, 'title')
    title.text = "Taideyliopisto - Uutishuone, poiminnat"
    link = SubElement(channel, 'link')
    link.text = "https://uniarts.fi/uutishuone/"
    description = SubElement(channel, 'description')
    description.text = "Taideyliopiston uutishuoneen uusimmat uutiset."

    for item in data:
        item_element = SubElement(channel, 'item')

        title = SubElement(item_element, 'title')
        title.text = item.get('title', 'No title')

        link = SubElement(item_element, 'link')
        link.text = item.get('link', '#')

        description = SubElement(item_element, 'description')
        description.text = item.get('description', 'No description')

        pub_date = SubElement(item_element, 'pubDate')
        pub_date.text = item.get('pub_date', '')

    # Write RSS-file
    xml_str = xml.dom.minidom.parseString(tostring(rss)).toprettyxml(indent="   ")
    with open(rss_file, 'w') as output:
        output.write(xml_str)

# Filenames JSON-file and RSS-file (modify this)
json_to_rss('articles_uniarts.json', 'uniarts_feed.xml')

