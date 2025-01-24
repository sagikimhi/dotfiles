#!/bin/bash

bender update
bender vendor init
bender script vcs | tee vcs.args
