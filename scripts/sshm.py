# -*- coding: utf-8 -*-
# Created by zhwei on 2016-10-20 22:24:49
# Simple SSH Manager

import os
import sys
import json

config_path = os.path.expanduser('~/.ssh/sshm.json')

with open(config_path) as config:
    servers = json.load(config)

def help_text():
    print('Simple SSH Manager\n')
    print('  usage: sshm [name]\n')
    for name, command in servers.items():
        print("    {}\t{}".format(name, command))


if len(sys.argv) >= 2 and servers.get(sys.argv[1]):
    command = servers.get(sys.argv[1])

    assert(command.startswith('ssh '))

    print('Run: ' + command)
    os.system(command)

else:
    help_text()
