import urllib.request
import os

url="https://github.com"
req=urllib.request.Request(url)
resp=urllib.request.urlopen(req)
html=resp.read()
print(html)
