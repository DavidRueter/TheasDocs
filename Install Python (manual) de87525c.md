Download the desired Python tarball (.tgz) file from [https://www.python.org/ftp/python](https://www.python.org/ftp/python) You can do either using a browser, or with the following commands in a terminal window:

`cd \~/Downloads
curl -O `[`https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz`](https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz)

Unzip the file.  Since you are installing Python for your use as a developer, and not part of the operating system, I'd suggest you put the source somewhere in your home folder.  For example:

`mkdir \~/src cd \~/Downloads\
tar -zxf Python-3.4.3.tgz -C \~/src`

Then you can navigate to look at the newly-unzipped folder:

`cd /\~src\
ls`

You will see a folder Python-3.4.3 listed

Note that you can repeat the above steps as many times as you want for different versions of Python.

You are free to clean up after yourself by deleting the .tgz file from the \~/Downloads folder.

Though we have downloaded and unzipped the source file, we have not yet built the source or installed the binaries.

To get ready to build things, we should make sure that we have the latest tools installed:

```
sudo apt update
sudo apt install build-essential checkinstall zlib1g zlib1g-dev openssl -y
sudo apt install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
sudo apt build-dep
```

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

We should also set some paths:

```
export LDFLAGS="-L/usr/local/lib/"
export LD_LIBRARY_PATH="/usr/local/lib/"
export CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
```

You should add those path statements to your profile

Now we are ready to build and install Python:

```
export LDFLAGS="-L/usr/local/lib/"
export LD_LIBRARY_PATH="/usr/local/lib/"
export CFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
cd ~/src/Python-3.4.3
./configure --prefix=/usr/local/
sudo -H make altinstall
```

You can now inspect the results of your work:

`/usr/local/bin/python3.4 -V`

You should see a message:  Python 3.4.3

If you need to control which version of Python runs by default, you can use `update-alternatives`

```
update-alternatives --config python
```

If you just want to list the versions that are installed, you can:

```
update-alternatives --list python
```

If you don't see a version of Python that is installed (such as the one you just installed above), do this:

```
update-alternatives --install /usr/bin/python python /usr/bin/python3.4.3 10
update-alternatives --config python
```

The "10" in the above example is the priority of this version of Python.  (The highest priority number will determine which version of Python is run by default / in "auto mode".)

> In "auto mode", `update-alternatives` will always select the alternative with the highest priority. If a new or upgraded package is installed which has a higher priority than any other alternative, it will be chosen as the auto alternative.
>
> In "manual mode", `update-alternatives` will never override the sysadmin's choice, no matter what the relative priorities of the alternatives. The operator has made a choice and the system is going to stick with it until and unless the operator makes a different choice (including choosing to go back to "auto mode").
>
> "auto mode" is the default mode until the operator makes a manual choice.
>
> Each set of alternatives (e.g. `editor`, `awk`, `vi`, `pager`, etc) has its own individual mode setting...in other words, making a manual choice for `editor` wont affect the mode of the `vi` or `pager` alternatives.

[gcc - How do I compile Python 3.4 with custom OpenSSL? - Stack Overflow](https://stackoverflow.com/questions/23548188/how-do-i-compile-python-3-4-with-custom-openssl)

[Upgrade to Latest Version of OpenSSL on Ubuntu](https://sandilands.info/sgordon/upgrade-latest-version-openssl-on-ubuntu)

[c++ - How do I install and build against OpenSSL 1.0.0 on...](https://stackoverflow.com/questions/3153114/how-do-i-install-and-build-against-openssl-1-0-0-on-ubuntu)

[linux mint - Difference between auto mode and manual mode...](https://unix.stackexchange.com/questions/288808/difference-between-auto-mode-and-manual-mode-in-update-alternatives)

[update-alternatives(8) - Linux man page](https://linux.die.net/man/8/update-alternatives)

[How to change from default to alternative Python version on...](https://linuxconfig.org/how-to-change-from-default-to-alternative-python-version-on-debian-linux)