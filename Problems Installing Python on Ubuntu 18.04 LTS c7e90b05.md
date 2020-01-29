If you simply install pyenv (see "Install Python (automatic, using pyenv), when you attempt to use pyenv to install Python you encounter this error:

```
devtest@ubuntu:~$ pyenv install 3.4.9
Downloading Python-3.4.9.tar.xz...
-> https://www.python.org/ftp/python/3.4.9/Python-3.4.9.tar.xz
Installing Python-3.4.9...
ERROR: The Python ssl extension was not compiled. Missing the OpenSSL lib?

Please consult to the Wiki page to fix the problem.
https://github.com/pyenv/pyenv/wiki/Common-build-problems


BUILD FAILED (Ubuntu 18.04 using python-build 1.2.9-4-g6b041822)

Inspect or clean up the working tree at /tmp/python-build.20190213224306.9758
Results logged to /tmp/python-build.20190213224306.9758.log

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

What happens is that the installation of Python itself succeeds, but the installation of PIP fails, because of missing OpenSSL.

The strange thing is this:  OpenSSL is already installed:

```
devtest@ubuntu:~$ sudo apt install openssl -y
Reading package lists... Done
Building dependency tree       
Reading state information... Done
openssl is already the newest version (1.1.0g-2ubuntu4.3).
0 upgraded, 0 newly installed, 0 to remove and 4 not upgraded.
```

How about libssl-dev?  Yes, it is already installed too:

```
devtest@ubuntu:~$ sudo apt install libssl-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libssl-dev is already the newest version (1.1.0g-2ubuntu4.3).
0 upgraded, 0 newly installed, 0 to remove and 4 not upgraded.
```

```
devtest@ubuntu:~$ apt show openssl
Package: openssl
Version: 1.1.0g-2ubuntu4.3
Priority: important
Section: utils
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian OpenSSL Team <pkg-openssl-devel@lists.alioth.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 1,125 kB
Depends: libc6 (>= 2.15), libssl1.1 (>= 1.1.0)
Suggests: ca-certificates
Homepage: https://www.openssl.org/
Task: minimal
Supported: 5y
Download-Size: 532 kB
APT-Manual-Installed: yes
APT-Sources: http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages
Description: Secure Sockets Layer toolkit - cryptographic utility
 This package is part of the OpenSSL project's implementation of the SSL
 and TLS cryptographic protocols for secure communication over the
 Internet.
 .
 It contains the general-purpose command line binary /usr/bin/openssl,
 useful for cryptographic operations such as:
  * creating RSA, DH, and DSA key parameters;
  * creating X.509 certificates, CSRs, and CRLs;
  * calculating message digests;
  * encrypting and decrypting with ciphers;
  * testing SSL/TLS clients and servers;
  * handling S/MIME signed or encrypted mail.

N: There is 1 additional record. Please use the '-a' switch to see it
```

```
devtest@ubuntu:~$ apt show libssl-dev
Package: libssl-dev
Version: 1.1.0g-2ubuntu4.3
Priority: optional
Section: libdevel
Source: openssl
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian OpenSSL Team <pkg-openssl-devel@lists.alioth.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 6,870 kB
Depends: libssl1.1 (= 1.1.0g-2ubuntu4.3)
Recommends: libssl-doc
Conflicts: libssl1.0-dev
Homepage: https://www.openssl.org/
Supported: 5y
Download-Size: 1,374 kB
APT-Manual-Installed: yes
APT-Sources: http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages
Description: Secure Sockets Layer toolkit - development files
 This package is part of the OpenSSL project's implementation of the SSL
 and TLS cryptographic protocols for secure communication over the
 Internet.
 .
 It contains development libraries, header files, and manpages for libssl
 and libcrypto.

N: There is 1 additional record. Please use the '-a' switch to see it
```

```
/home/devtest/src/openssl-1.0.2g/libssl.so
/usr/local/lib/libssl.so
/usr/lib/x86_64-linux-gnu/libssl.so
```