#!/bin/bash

echo "************************************"
echo "Provisioning your MacBook with Magic"
echo "************************************"

sudo easy_install pip
sudo easy_install ansible

installdir="/tmp/ansiblemac-$RANDOM"
mkdir $installdir

git clone https://github.com/johnhunterkennedy/macbook-ansible.git $installdir # repo URL
if [ ! -d $installdir ]; then
    echo "Failed to find ansiblemac."
    echo "git cloned failed"
    exit 1
else
    cd $installdir
    ansible-playbook -i ./hosts playbook.yml --verbose
fi

echo "Completing setup..."

rm -Rfv /tmp/$installdir

echo "Setup complete!"

exit 0
