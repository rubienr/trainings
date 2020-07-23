#!/bin/bash

GXX="/opt/avibit64/gcc/gcc-6.2.0/bin/g++"
if [ ! -f $GXX ] ; then
  GXX="/usr/bin/g++"
fi

GXX_FLAGS="-Wall"

echo "$GXX $GXX_FLAGS main.cpp ..."
$GXX $GXX_FLAGS main.cpp

