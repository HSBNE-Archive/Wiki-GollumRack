# HSBNE Wiki Application

## Overview

This application is a super customised implementation of
[Gollum](https://github.com/gollum/gollum).

It's set up to run on our Ansible managed Digital Ocean droplet, and it exposes a
secondary api through the [Sinatra](http://www.sinatrarb.com/) middleware
utilised by Gollum. *Buzzwords*.

Essentially, its a super lightweight wiki application that stores its data as
flat files. Extremely portable and hackable. It's deployed via ansible to a 
Digital Ocean droplet. This repo is purely the gollum application customised
with plugins and running with rack middleware ( in this case, passenger )

## Implementation Notes

### Concern Separation

This setup has split the Gollum repository into two. Theres the application
repository, or 'how', and the separate data repository, or the 'what'. This
means the data gollum utilises is clean, and the application doesn't have a git
history cluttered with wiki edits.

### OmniGollum

Not set up just yet, the goal is to have it auth via at least google to have
restricted 'member only' pages etc.

### API Application

Theres a light api application in `api.rb`, it exposes some endpoints which may
be useful for manipulating the application. Current uses are limited to exposing
some scripts for quick development setup. Future services may be allowing
endpoints for github hooks to allow syncronisation etc.
