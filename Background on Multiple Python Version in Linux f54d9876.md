Most Linux distributions come with Python installed.  That's a good thing:  Python is widely available and is widely used.

However Python's long, vibrant history causes some problems too.  Python 2 is different from (and not compatible with) Python 3.  Until fairly recently, most Linux distributions came with Python 2 installed.  At the same time, many (if not most) developers developing Python applications have been doing so on Python 3.

As Python 3 has evolved, the language has continued to mature.  Many nice new features have been added.  So it is entirely possible that an an application written for Python 3.6 makes use of features in the language that are not available in Python 3.3.

There are modules to back-port new features into old versions of Python.  Developers can use these to try to make their new applications more compatible with a wider range of older Python versions...but regardless, planning for version compatibility is something that must be done intentionally.

It's great that Linux comes with (and often depends upon Python.  But the Python that comes with Linux may not be (is probably not) the version you need or want for your developing your modern application.

Furthermore, it's not enough to simply keep up with the "latest" version of Python:  there are always development versions of Python that may not be stable for production use.  You wouldn't want your operating system to have problems because it prematurely had a new version of Python installed.  Similarly, you may need to work with a particular Python project that requires a specific version of Python.  (For example, if py2exe is used to package your application as a WIndows .exe file, Python 3.5 and later cannot be used.)

All of this has shown that the specific version of Python matters.

Furthermore, Python modules are retrieved and installed for use in Python applications by the pip utility, which stores and registers these for a particular Python installation.   For example, if you have two different versions of Python installed, you have two different independent sets of modules installed.  So not only does the specific version of Python matter, but sometimes it is nice to have multiple installations of the same version of Python, to accommodate module requirements of multiple applications.

So the challenge is this:  how can you have flexibility to install and use multiple versions and/or multiple installations of Python in Linux without messing up your operating system (which depends upon a particular version of Python)?

The good news is that there is an answer to this question:  there is a way to safely work with multiple versions and multiple installations of Python.  The bad news is that there is a lot of confusion about how to do this.