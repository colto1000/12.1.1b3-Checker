# Created by u/colto1000
#  Thank you to...
#    s0uthwest for fork of tsschecker
#    tihmstar for tsschecker and libpartialzip
#    r/jailbreak for being awesome
#
# Enjoy!


#!/usr/bin/env bash

# cd into the directory of the script
cd "$(dirname "$BASH_SOURCE")" || {
echo "Error getting script directory" >&2
exit 1
}


# prompt to user
echo " >> colto1000's iOS 12.1.1 beta 3 Signed Checker v1 <<"
echo ""
echo "       Uses iOS BuildManifest.plist from XS Max,"
echo "      but this should still apply to all devices."
echo ""
echo "      Thank you to s0uthwest for fork of tsschecker!"
echo ""
echo "      Make sure this script is placed in an *EMPTY*"
echo "                       directory."
echo ""

# verify user is okay to continue
read -n 1 -s -r -p "            >> Press ANY KEY to continue. <<"
echo ""
echo ""


# cleanup files used later in the program
#  ...and hides output of "rm"
echo "==> File cleanup"
rm BuildManifest.plist > /dev/null 2>&1

echo ""

# check for Xcode command line tools
echo "==> Checking for Xcode command line tools"
xcode-select -p > /dev/null 2>&1
if [[ $? != 0 ]] ; then
    echo "Xcode command line tools not found; installing now..."
    xcode-select --install
fi
echo ""

# check for Homebrew
echo "==> Checking for Homebrew"
command -v brew > /dev/null 2>&1
if [[ $? != 0 ]] ; then
    echo "Homebrew not found; installing now..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo ""

# check for partialzip
echo "==> Checking for partialzip"
command -v partialzip > /dev/null 2>&1
if [[ $? != 0 ]] ; then
    echo "partialzip not found; installing now..."
    brew install stek29/idevice/partial-zip
fi


# install s0uthwest's fork of tsschecker
echo "==> Installing tsschecker-s0uthwest"
brew install stek29/idevice/tsschecker-s0uthwest
echo ""


# downloads BuildManifest.plist from
#  12.1.1 beta 3 IPSW for iPhone11,6
echo "==> Downloading BuildManifest.plist (may take some time)"
partialzip http://updates-http.cdn-apple.com/2018FallSeed/fullrestores/041-24857/D0D25388-E786-11E8-B39F-0A9D55D8F596/iPhone11,6_12.1.1_16C5050a_Restore.ipsw BuildManifest.plist BuildManifest.plist
echo ""


# using tsschecker to check sign status
#  with iPhone11,6 BuildManifest.plist
echo "==> Running check"

tsschecker -m BuildManifest.plist -d iPhone11,6 --beta -i 12.1.1 --buildid 165050a

echo "    ^^^  RESULT   ^^^"

echo ""


# cleans up files that were created
echo "==> File cleanup"

rm BuildManifest.plist > /dev/null 2>&1

echo ""


# goodbye!
echo "Happy jailbreaking!"
echo ""
echo ""


exit 0
