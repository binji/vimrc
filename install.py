#!/usr/bin/env python
import os
import shutil
import subprocess
import sys

if sys.platform == 'win32':
  HOME = os.path.join(os.environ['HOMEDRIVE'], os.environ['HOMEPATH'])
  use_shell = True
else:
  HOME = os.environ['HOME']
  use_shell = False

plug_vim = os.path.join(HOME, '.vim', 'autoload', 'plug.vim')
PLUG_VIM_URL = \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if not os.path.exists(plug_vim):
  subprocess.call(['curl', '-fLo', plug_vim, '--create-dirs', PLUG_VIM_URL],
                   shell=use_shell)

shutil.copy('.vimrc', os.path.join(HOME, '.vimrc'))
