#!/bin/sh

cd $(dirname "$0")

jekyll serve -w $*
