#!/bin/bash

rm -r jugfile.jugdata
sh ./parallel_jug.sh 1

rm -r jugfile.jugdata
sh ./parallel_jug.sh 2

rm -r jugfile.jugdata
sh ./parallel_jug.sh 4

rm -r jugfile.jugdata
sh ./parallel_jug.sh 8

rm -r jugfile.jugdata
sh ./parallel_jug.sh 16
