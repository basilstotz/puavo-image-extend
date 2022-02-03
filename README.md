# Using PuavoOS with Custom PuavoOS-Packages

This document describes the steps for using PuavoOS (https://puavo.org) with (self built) PuavoOS packages.

Ideally this should work out of the box with a vanilla PuavoOS image. Hopefully this will be case in the future (maybe using a puavo.org package store or a similar solutions ...)

At the moment tiny patch is needed 

## What is needed to use custom packages?

Of course we need an instance of a webserver to publicly offer our packages/images to the clients. 

On the client side we need the following: 

In order to
- download packages (and images) from the package/image repository a small patch is needed (done with the progs in config/bin.d).
- verify the downloaded packages, the client needs the public GnuPG public keys of the repostory (done with the content of config/parts.d/gnupg)
- install the packages the client needs a puavo-conf variable for each used package (done with the content of config/parts.d/puavocoonf)

These things are achieved by patching the original PuavoOS image using this software here.

### 
