#!/bin/bash

test -e /etc/kolla/passwords.yml || cp ./etc/kolla/passwords.yml /etc/kolla/passwords.yml && python ./tools/generate_passwords.py
test -e /etc/kolla/globals.yml || cp ./etc/kolla/globals.yml /etc/kolla/globals.yml
test -e /etc/kolla/multinode || cp ./ansible/inventory/multinode /etc/kolla/multinode
./tools/kolla-ansible bootstrap-servers -i /etc/kolla/multinode
./tools/kolla-ansible prechecks -i /etc/kolla/multinode
./tools/kolla-ansible deploy -i /etc/kolla/multinode

