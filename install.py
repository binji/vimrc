#!/usr/bin/env python
import os
import shutil
import subprocess

exists = os.path.exists
join = os.path.join
HOME = os.environ.get('HOME')
VUNDLE_GITHUB_URL = 'https://github.com/gmarik/vundle.git'
VUNDLE_DIR = join(HOME, '.vim', 'bundle', 'vundle')
if not exists(VUNDLE_DIR):
  subprocess.call(['git', 'clone', VUNDLE_GITHUB_URL, VUNDLE_DIR])
else:
  subprocess.call(['git', 'pull'], cwd=VUNDLE_DIR)
shutil.copy('.vimrc', join(os.environ.get('HOME'), '.vimrc'))
