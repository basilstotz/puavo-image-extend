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

## Quick Start

1) Clone this repo
2) Replace the public keys in *config/parts.d/gnupg/gnupg/images.yourdomain.tld/pks/* with the public keys form the identity you used for signing the packages.
3) Add the names of all your packes you want to use, as a space separated list in *config/parts.d/puavoconf/packages.lis*.
4) Run *make install* to install the binaries in *~/bin/*
5) Run *puavo-ing-patch config your_source_image.img*
6) Install the new image on a laptop (either directly or via your image/package server)
7) Set (on PuavoWeb) *puavo.images.servers* to your image server.
8) Set (on PuavoWeb) for each wanted package *puavo.pkg.package_name* to *latest*
9) Reboot client.

