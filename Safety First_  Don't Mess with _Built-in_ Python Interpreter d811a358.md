The first thing to know is that you CANNOT merely upgrade, downgrade or remove the Python installation that comes with your Linux distribution.

You should consider this "built-in" installation of Python as part of the operating system.  Sure, if you want to write a script that uses this "built-in" Python interpreter, that is fine.

But if you are doing development of Python applications, you really do NOT want to use this "built-in" Python interpreter.  You instead want to manage your own Python installations so that you can be free to install and remove modules, and to upgrade or downgrade to different versions of Python as your project dictates.

Do this to protect yourself:

create a file \~/.pip/pip.conf that contains the following:

```
[global]
require-virtualenv = true
```

This will prevent you from accidentally running pip to install something outside of a virtual environment.

Before you do a `sudo apt-get upgrade python` or even a `pip install somepackage` think twice:  do you really want to do that in your operating system's Python installation?  Or do you want to do that in your own dedicated Python installation?  If you are a Python developer, you almost certainly do NOT want to mess with the "built-in" Python interpreter.