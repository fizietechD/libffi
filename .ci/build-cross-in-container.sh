#!/bin/bash
set -x

cd /opt

echo $PATH
export PATH=/usr/local/bin:$PATH
echo $PATH

DEJAGNU=$(pwd)/.ci/site.exp
echo $(DEJAGNU)
ls -l $(DEJAGNU)
pwd
find .
./configure --host=${HOST} || cat */config.log
make
make dist
make check RUNTESTFLAGS="-a $RUNTESTFLAGS" || true
