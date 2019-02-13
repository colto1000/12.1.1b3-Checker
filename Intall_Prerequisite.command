# Created by u/colto1000
#  Thank you to...
#    tihmstar for libpartialzip
#    r/jailbreak for being awesome
#
# Enjoy!


#! /bin/bash


# prompt to user
echo " >> colto1000's script to install libpartialzip <<"
echo ""
echo "        You can check your /Users/<user>"
echo "       to see if you have a libpartialzip"
echo "                 folder already."
echo ""
echo "         Will also attempt to install"
echo "          XCode command line tools, so"
echo "        follow instructions if prompted"
echo ""

# verifies user is okay to continue
read -n 1 -s -r -p "         >> Press ANY KEY to install. <<"
echo ""
echo ""


# ensures program is in user directory
cd


# attempts to install XCode tools
echo "==> XCode Tools..."

xcode-select --install

echo  ""


# downloads libpartialzip from github, makes, and installs
echo "==> libpartialzip..."
git clone https://github.com/tihmstar/libpartialzip && cd ./libpartialzip && bash autogen.sh && sudo make install

echo ""


echo ""
echo "Done! Hopefully everything installed correctly with no errors ;)"


# goodbye!
echo "Happy jailbreaking!"
echo ""


exit 0
