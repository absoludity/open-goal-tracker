#! /usr/bin/env python
"""Simple server for dev environment."""
import os
from BaseHTTPServer import HTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler

print("Serving {0} on port 3000...".format(os.getcwd()))
httpd = HTTPServer(('', 3000), SimpleHTTPRequestHandler)
httpd.serve_forever()
