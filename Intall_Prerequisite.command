# Created by u/colto1000
#  Thank you to...
#    tihmstar for libpartialzip
#    r/jailbreak for being awesome
#
# Enjoy!


#! /bin/bash


# prompt to user
echo " >> colto1000's script to install libpartialzip from Homebrew<<"
echo ""
echo "         Will also attempt to install"
echo "          Xcode command line tools, so"
echo "        follow instructions if prompted"
echo ""

# verifies user is okay to continue
read -n 1 -s -r -p "         >> Press ANY KEY to install. <<"
echo ""
echo ""


# ensures program is in user directory
cd


# attempts to install XCode tools
echo "==> Xcode Tools..."

xcode-select --install

echo  ""

# attempts to install Homebrew if not already installed
echo "==> Homebrew..."
which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi
echo ""

# adds stek29's idevice tap (https://github.com/stek29/homebrew-idevice)
brew tap stek29/idevice

# installs partial-zip
echo "==> partial-zip..."
brew install partial-zip

echo ""


echo ""
echo "Done! Hopefully everything installed correctly with no errors ;)"


# goodbye!
echo "Happy jailbreaking!"
echo ""


exit 0
