#/bin/sh

# export DEVELOPER_DIR=/Applications/Xcode-11.7.app/Contents/Developer
# make clean
# make package FINALPACKAGE=1

# unset DEVELOPER_DIR
export DEVELOPER_DIR="/Applications/Xcode-14.3.0.app/Contents/Developer"
make clean
make package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless