# Created by u/colto1000
#
#  Thank you to...
#    u/01110101_00101111 for helping with MAJOR improvements in v2!
#    u/s0uthwes (s0uthwest) for fork of tsschecker
#    tihmstar for tsschecker and libpartialzip
#    r/jailbreak for being awesome
#
# Enjoy!


#! /user/bin/env bash


# prompt to user
echo ""
echo " >> colto1000's iOS 12.1.1 beta 3 Signed Checker v2.1! <<"
echo ""
echo "       Uses iOS BuildManifest.plist from XS Max,"
echo "      but this should still apply to all devices."
echo ""
echo "      Thank you to s0uthwest for fork of tsschecker!"
echo ""
echo "      Make sure this script is placed in an *EMPTY*"
echo "                       directory."
echo ""
echo "         This script will also check/install the"
echo "                  prerequisites needed."
echo "       (libpartialzip and Xcode Command-Line Tools)"
echo ""

# verifies user is okay to continue
read -n 1 -s -r -p "            >> Press ANY KEY to continue. <<"
echo ""
echo ""


# cd's program into user directory
cd


# checks for Xcode command line tools
#  installs if not found
echo "==> Checking for Xcode Command-Line Tools"

xcode-select -p > /dev/null 2>&1

if [[ $? != 0 ]]
then
    echo "Xcode Command-Line Tools not found. Installing..."
    xcode-select --install
else
    echo "Xcode Command-Line Tools is installed."
fi

echo ""


# checks for "libpartialzip" folder in ~
#  installs if not found
echo "==> Checking for libpartialzip"

if [ -d libpartialzip ]
then
    echo "libpartialzip seems to be installed."
else
    echo "libpartialzip not found. Installing..."
    git clone https://github.com/tihmstar/libpartialzip && cd ./libpartialzip && bash autogen.sh && sudo make install
fi

echo ""


# cd's into the directory of the script
cd "$(dirname "$BASH_SOURCE")" || {
echo "Error getting script directory" >&2
exit 1
}


# cleanup of files used later in the program
#  ...and hides output of "rm"
echo "==> File cleanup"
rm runtime/BuildManifest.plist > /dev/null 2>&1
rm runtime/tsschecker-s0.zip > /dev/null 2>&1
rm runtime/tsschecker > /dev/null 2>&1
rm -rf runtime > /dev/null 2>&1

echo ""


# adds runtime directory
mkdir runtime


# downloads s0uthwest's fork of tsschecker
echo "==> Installing s0uthwest/tsschecker v336"

curl -o runtime/tsschecker-s0.zip https://github.com/s0uthwest/tsschecker/releases/download/336/tsschecker_macOS_v336.zip -\# -O -J -L

echo ""


# un-zips file using "unzip" command
echo "==> Unzipping tsschecker-s0.zip"

unzip -q -o runtime/tsschecker-s0.zip -d runtime

echo ""


# downloads BuildManifest.plist from
#  12.1.1 beta 3 IPSW for iPhone11,6
echo "==> Downloading BuildManifest.plist (may take some time)"

partialzip http://updates-http.cdn-apple.com/2018FallSeed/fullrestores/041-24857/D0D25388-E786-11E8-B39F-0A9D55D8F596/iPhone11,6_12.1.1_16C5050a_Restore.ipsw BuildManifest.plist runtime/BuildManifest.plist

echo ""


# using tsschecker to check sign status
#  with iPhone11,6 BuildManifest.plist
echo "==> Running check"

./runtime/tsschecker -m runtime/BuildManifest.plist -d iPhone11,6 --beta -i 12.1.1 --buildid 165050a

echo "    ^^^  RESULT   ^^^"

echo ""


# cleans up files that were created
echo "==> File cleanup"

rm runtime/BuildManifest.plist > /dev/null 2>&1
rm runtime/tsschecker-s0.zip > /dev/null 2>&1
rm runtime/tsschecker > /dev/null 2>&1
rm -rf runtime > /dev/null 2>&1

echo ""


# goodbye!
echo "Happy jailbreaking!"
echo ""
echo ""


exit 0
