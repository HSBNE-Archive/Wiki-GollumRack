# HSBNE Wiki Application

## Overview

This application is a super customised implementation of
[Gollum](https://github.com/gollum/gollum).

It's set up to run on [OpenShift](https://www.openshift.com/), and it exposes a
secondary api through the [Sinatra](http://www.sinatrarb.com/) middleware
utilised by Gollum. *Buzzwords*.

Essentially, its a super lightweight wiki application that stores its data as
flat files. Extremely portable and hackable. It's running on a PaaS known as
OpenShift, which is run by Red Hat. This means we don't have to do any sort of
system administration.

## Implementation Notes

### Concern Separation

This setup has split the Gollum repository into two. Theres the application
repository, or 'how', and the separate data repository, or the 'what'. This
means the data gollum utilises is clean, and the application doesn't have a git
history cluttered with wiki edits.

This data repository is created by the `./.openshift/action_hooks/build` script.

When running the gollum application locally, it will look for the data dir at
`../gollum-data`.

### OmniGollum

Not set up just yet, the goal is to have it auth via at least google to have
restricted 'member only' pages etc.

### API Application

Theres a light api application in `api.rb`, it exposes some endpoints which may
be useful for manipulating the application. Current uses are limited to exposing
some scripts for quick development setup. Future services may be allowing
endpoints for github hooks to allow syncronisation etc.

## Openshift Application Specifics

### DEBUG ENV

`./.openshift/action_hooks/config` specifies `DEBUG`, set this to `true` to have
OpenShift expose ENV vars when you push repository changes.

`touch ./.openshift/markers/force_clean_build` and commit and push in order to
rebuild all the gems etc.  Only needed when you update the versions of software.

## Openshift Vendor Information

### Repo layout

 - `tmp/` - Temporary storage
 - `public/` - Content (images, css, etc. available to the public)
 - `config.ru` - This file is used by Rack-based servers to start the
   application.
 - `.openshift/action_hooks/pre_build` - Script that gets run every git push
   before the build
 - `.openshift/action_hooks/build` - Script that gets run every git push as part
   of the build process (on the CI system if available)
 - `.openshift/action_hooks/deploy` - Script that gets run every git push after
   build but before the app is restarted
 - `.openshift/action_hooks/post_deploy` - Script that gets run every git push
   after the app is restarted

### Notes about layout

Every time you push, everything in your remote repo dir gets recreated, please
store long term items (like an sqlite database) in the OpenShift data directory,
which will persist between pushes of your repo. The OpenShift data directory is
accessible relative to the remote repo directory (../data) or via an environment
variable OPENSHIFT_DATA_DIR.

### Ruby Mirror

OpenShift is mirroring `rubygems.org` at
`http://mirror1.ops.rhcloud.com/mirror/ruby/` This mirror is on the same network
as your application, and your gem download should be faster. To use the
OpenShift mirror:

Edit your Gemfile and replace

    source 'http://rubygems.org'

with

    source 'http://mirror1.ops.rhcloud.com/mirror/ruby/'

Edit your Gemfile.lock and replace

    remote: http://rubygems.org/

with

    remote: http://mirror1.ops.rhcloud.com/mirror/ruby/


### Environment Variables

OpenShift provides several environment variables to reference for ease
of use.  The following list are some common variables but far from exhaustive:

    ENV['OPENSHIFT_APP_NAME']  - Application name

When embedding a database using 'rhc cartridge add', you can reference
environment variables for username, host and password. Example for mysql:

    ENV['OPENSHIFT_MYSQL_DB_HOST']      - DB host
    ENV['OPENSHIFT_MYSQL_DB_PORT']      - DB Port
    ENV['OPENSHIFT_MYSQL_DB_USERNAME']  - DB Username
    ENV['OPENSHIFT_MYSQL_DB_PASSWORD']  - DB Password

When embedding a NoSQL database using 'rhc cartridge add', you can
reference environment variables for username, host and password.
Example for MongoDB:

    ENV['OPENSHIFT_MONGODB_DB_HOST']      - NoSQL DB Host
    ENV['OPENSHIFT_MONGODB_DB_PORT']      - NoSQL DB Port
    ENV['OPENSHIFT_MONGODB_DB_USERNAME']  - NoSQL DB Username
    ENV['OPENSHIFT_MONGODB_DB_PASSWORD']  - NoSQL DB Password

To get a full list of environment variables, simply add a line in your
.openshift/action_hooks/build script that says "export" and push.


### Notes about layout

Every time you push, everything in your remote application path gets recreated
please store long term items (like an sqlite database) in ../data which will
persist between pushes of your repo.


### Rails 3.0

Option 1) (Recommended) Git push your application Gemfile/Gemfile.lock.  
This will cause the remote OpenShift node to run bundle install --deployment to 
download and install your dependencies.  Each subsequent git push will use the 
previously downloaded dependencies as a starting point, so additional downloads 
will be a delta.

Option 2) Git add your .bundle and vendor/bundle directories after running
'bundle install --deployment' locally.  Be sure to exclude any gems that have 
native code or ensure they can run on RHEL x86_64.

*[PaaS]: Platform as a Service
