# Created by u/colto1000
#  Thank you to...
#    s0uthwest for fork of tsschecker
#    tihmstar for tsschecker and libpartialzip
#    r/jailbreak for being awesome
#
# Enjoy!


#!/usr/bin/env bash

# cd's into the directory of the script
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
echo "         Also make sure that you have partialzip"
echo "                       installed."
echo ""

# verifies user is okay to continue
read -n 1 -s -r -p "            >> Press ANY KEY to continue. <<"
echo ""
echo ""


# cleanup of files used later in the program
#  ...and hides output of "rm"
echo "==> File cleanup"
rm BuildManifest.plist > /dev/null 2>&1

echo ""


# downloads s0uthwest's fork of tsschecker
echo "==> Installing tsschecker-s0uthwest"

brew install tsschecker-s0uthwest

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
