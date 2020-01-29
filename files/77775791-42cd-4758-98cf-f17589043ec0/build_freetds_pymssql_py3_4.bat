REM Make sure you have OpenSSL built with binaries in C:\Prog\openssl-bin-VC-64.dynamic
REM Make sure you have environment variables OPENSSL_ROOT_DIR=C:\Prog\openssl-bin-VC-64.dynamic and OPENSSL_INCLUDE_DIR=C:\Prog\openssl-bin-VC-64.dynamic\include

REM Make sure there is no existing C:\Prog\freetds.bak or C:\Prog\pymssql.bak folders
pause

cd \Prog
REM ren freetds freetds.bak
REM ren pymssql pymssql.bak

REM Getting FreeTDS and pymssql source from GitHub

REM git clone https://github.com/FreeTDS/freetds.git
REM git clone https://github.com/pymssql/pymssql.git

REM Run CMake, select C:\Prog\freetds as the source code, click Configure, review settings, click Configure again, click Generate
pause

REM Open C:\Prog\freetds_binx64\FreeTDS.sln in Visual Studio 2010, select Release, and Build Solution
pause

REM Run this batch file AFTER building opensll and freetds.  It will copy the binaries to pymssql
pause

mkdir \Prog\pymssql\freetds\vs2010_64\lib
mkdir \Prog\pymssql\freetds\vs2010_64\include

copy \Prog\freetds_binx64\src\tds\Release\tds.lib \Prog\pymssql\freetds\vs2015_64\lib
copy \Prog\freetds_binx64\src\ctlib\Release\ct.lib \Prog\pymssql\freetds\vs2015_64\lib

REM copy \Prog\freetds_binx64\src\replacements\Release\replacements.lib \Prog\pymssql\freetds\vs2015_64\lib
REM copy \Prog\freetds_binx64\src\dblib\Release\*.lib \Prog\pymssql\freetds\vs2015_64\lib
REM copy \Prog\freetds_binx64\src\ctlib\Release\*.lib \Prog\pymssql\freetds\vs2015_64\lib

copy \Prog\freetds_binx64\include\tds_sysdep_public.h \Prog\pymssql\freetds\vs2015_64\include

copy \Prog\freetds\include\sqlfront.h \Prog\pymssql\freetds\vs2015_64\include
copy \Prog\freetds\include\sybdb.h \Prog\pymssql\freetds\vs2015_64\include
copy \Prog\freetds\include\sqlfront.h \Prog\pymssql\freetds\vs2015_64\include
copy \Prog\freetds\include\sybfront.h \Prog\pymssql\freetds\vs2015_64\include


copy \Prog\openssl-bin-VC-64.dynamic\bin\libeay32.dll \Prog\pymssql\freetds\vs2010_64\lib\libeay64MD.dll
copy \Prog\openssl-bin-VC-64.dynamic\bin\ssleay32.dll \Prog\pymssql\freetds\vs2010_64\lib\ssleay64MD.dll

copy \Prog\openssl-bin-VC-64.dynamic\bin\libcrypto-1_1-x64.dll \Prog\pymssql\freetds\vs2010_64\lib\libeay64MD.dll
copy \Prog\openssl-bin-VC-64.dynamic\bin\libssl-1_1-x64.dll \Prog\pymssql\freetds\vs2010_64\lib\ssleay64MD.dll



