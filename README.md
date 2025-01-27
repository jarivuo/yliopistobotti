I have a project sending RSS feeds from universities to Mastodon. 
I'm using https://gitlab.com/chaica/feed2toot

It's not always easy to use an RSS feed automatically. 
Sometimes, you have a feed that is updated twice per year, and it only automatically removes some old stuff. 
It can also happend that you don't find an RSS feed for a page, or the quality of a feed is not good.
With some simple scripts (Python and Bash), I was able to solve my problems.

Had also some trouble with hashtags. There are many cases in the Finnish language.
I used {feedname} to create hashtags.
