#! /bin/sh

#  this is for using snap server 1.0, which isn't on hackage yet
mkdir deps
# cabal sandbox init
git clone git@github.com:snapframework/io-streams-haproxy.git deps/io-streams-haproxy
git clone git@github.com:snapframework/snap-core.git deps/snap-core
git clone git@github.com:snapframework/snap-server.git deps/snap-server

cabal install  deps/io-streams-haproxy deps/snap-core deps/snap-server