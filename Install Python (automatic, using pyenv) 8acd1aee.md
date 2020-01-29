The following instructions work only if your Linux distribution has Python 3 installed.  If it has Python 2 installed instead, don't worry:  it's easy to follow the instructions on Install Python (manual)

```
sudo apt update
sudo apt install build-essential checkinstall git vim openssl libssl-dev libreadline-dev zlib1g zlib1g-dev libbz2-dev curl libncursesw5-dev libsqlite3-dev tk-dev libgdbm-dev -y
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
```

The above statements will install the prerequisite development tools that are needed, and will then install pyenv and a related plugin needed for pyenv to manage virtual Python environments.

Now you need to edit the default bash shell

```
vim ~/.bashrc
```

In the editor, add the following lines to the end of the file

```
##pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
eval "$(pyenv init -)"
fi

##lib paths, esp for OpenSSL
export LDFLAGS="-L/usr/local/lib/ -L/usr/lib/ -L/usr/lib/x86_64-linux-gnu/"
export LD_LIBRARY_PATH="/usr/local/lib/;/usr/lib/;/usr/lib/x86_64-linux-gnu/"
export CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl -I/usr/include/ -I/usr/include/x86_64-linux-gnu/"
```

Save the changes.  Either open a new terminal window, or execute the following:

```
 source ~/.bashrc
```

You can now get a list of all the Python versions that are available for you to install:

```
pyenv install -l
```

You can pick one, and install it like this:

```
pyenv install 3.5.6
```

Now it is easy to set up a virtual Python environment for your project.  For example:

```
pyenv virtualenv 3.5.6 venv_someproject
```

This will create a virtual environment named venv_someproject.  (The folder will be stored in \~/.pyenv/versions/3.5.6/venv_someproject but you don't really need to know this.)

venv_someproject is just an arbitrary name:  you can name then environment whatever you want.

To use this virtual environment:

```
pyenv activate venv_someproject
```

Now if you execute `python -V` you will see 3.5.6 reported, because now that the virtual environment is active you will use that environment.  The same is true of `pip`:  modules you install using pip will be installed in this virtual environment.

Note that you can run the following up update pip and the list of packages in all of your virtual environments:

```
for v in $(pyenv versions --bare) ; do
    pyenv shell $v 
    pyenv which python
    python -m pip install --upgrade pip virtualenv wheel
done
```

[Pyenv - Install Multiple Python Versions for Specific Project](https://www.tecmint.com/pyenv-install-and-manage-multiple-python-versions-in-linux/)

[pyenv - managing multiple Python versions - DevOps & Python](http://devopspy.com/python/pyenv-setup/)

[pyenv/COMMANDS.md at master · pyenv/pyenv · GitHub](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md)