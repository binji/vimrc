#!/usr/bin/env python
import os
import shutil
import subprocess
import sys

exists = os.path.exists
join = os.path.join
getenv = os.environ.get

if sys.platform == 'win32':
  HOME = join(getenv('HOMEDRIVE'), getenv('HOMEPATH'))
  use_shell = True
else:
  HOME = getenv('HOME')
  use_shell = False

VUNDLE_GITHUB_URL = 'https://github.com/gmarik/vundle.git'
VUNDLE_DIR = join(HOME, '.vim', 'bundle', 'vundle')

if not exists(VUNDLE_DIR):
  os.makedirs(VUNDLE_DIR)
  subprocess.call(['git', 'clone', VUNDLE_GITHUB_URL, VUNDLE_DIR],
                   shell=use_shell)
else:
  subprocess.call(['git', 'pull'], cwd=VUNDLE_DIR, shell=use_shell)
shutil.copy('.vimrc', join(HOME, '.vimrc'))
