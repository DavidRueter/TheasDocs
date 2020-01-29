When installing some versions of Python--whether via pyenv (preferred) or manually--you may run into an error pertaining to OpenSSL while building pip.  This problem must be resolved in order for pip to work properly.

For example, in testing on Ubuntu 18.04 LTS, following the instructions "Install Python (automatic, using pyenv)", Python 3.5.6 and 3.6.6 installed just fine.  However installing 3.4.9 failed.  (See bottom of this page for the error message.)  Installing and building OpenSSL as follows resolved the problem.

In order for PIP to work, we need to have OpenSSL libraries available.  The OpenSSL libraries installed by the Linux distribution may not be compatible with the version of Python you downloaded, so it is probably best to download and manage OpenSSL yourself.

For example:

```
cd ~/Downloads
wget https://www.openssl.org/source/openssl-1.0.2g.tar.gz
mkdir ~/src
tar -zxf openssl-1.0.2g.tar.gz  -C ~/src

cd ~/src/openssl-1.0.2g
./config shared --prefix=/usr/local
make
sudo make install
```

We should also set some paths.  At a minimum you need to do this in the current terminal window.  It would be better to add these statements to your bash profile (in  \~/.bashrc)

```
##lib paths, esp for OpenSSL
export LDFLAGS="-L/usr/local/lib/ -L/usr/lib/ -L/usr/lib/x86_64-linux-gnu/"
export LD_LIBRARY_PATH="/usr/local/lib/;/usr/lib/;/usr/lib/x86_64-linux-gnu/"
export CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl -I/usr/include/ -I/usr/include/x86_64-linux-gnu/"
```

You can edit your bash profile to add these lines to the end of \~/.bashrc

```
vim ~/.bashrc
```

After editing and saving the file, either open a new terminal window or execute the following:

```
source ~/.bashrc
```

Here is the error message you may see if you need to install OpenSSL as described above:

```
Installing Python-3.4.9...
ERROR: The Python ssl extension was not compiled. Missing the OpenSSL lib?

Please consult to the Wiki page to fix the problem.
https://github.com/pyenv/pyenv/wiki/Common-build-problems


BUILD FAILED (Ubuntu 18.04 using python-build 1.2.9-4-g6b041822)

Inspect or clean up the working tree at /tmp/python-build.20190215121428.46562
Results logged to /tmp/python-build.20190215121428.46562.log

Last 10 log lines:
(cd /home/devtest/.pyenv/versions/3.4.9/share/man/man1; ln -s python3.4.1 python3.1)
if test "xupgrade" != "xno"  ; then \
	case upgrade in \
		upgrade) ensurepip="--upgrade" ;; \
		install|*) ensurepip="" ;; \
	esac; \
	 ./python -E -m ensurepip \
		$ensurepip --root=/ ; \
fi
Ignoring ensurepip failure: pip 9.0.1 requires SSL/TLS
```