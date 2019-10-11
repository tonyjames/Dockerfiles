#!/bin/sh

VOLUME=$HOME/Downloads/Supermicro/IPMIView

xhost +
docker run --rm -v $VOLUME:/IPMIView ipmiview
xhost -
