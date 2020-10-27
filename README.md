# setup-vim

Script to automatically setup and install vim editor along with plugin manager + plugins with further customistations

$PY_SITE_PKGS to be set (for this we recommend adding: export PY_SITE_PKGS=$(python -m site --user-site) to your .profile or shells startup rc file.

Bare in mind not all versions of python support this command, in which case: manually finding and exporting the path to your ~/.local/..../site-packages folder and setting in in $PY_SITE_PKGS will work. 

In all versions of python you can use the command 'python -m site' to find your users path to site-packages.

Requirements:

pypi package: powerline-status 

install with: pip3 install powerline-status --user

python 3
