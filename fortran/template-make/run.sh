#!/bin/bash
make cleanall
make mod
make
./bin/test
make cleanall
