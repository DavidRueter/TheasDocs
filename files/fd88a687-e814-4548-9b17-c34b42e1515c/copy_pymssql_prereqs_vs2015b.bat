REM Run this batch file AFTER building opensll and freetds.  It will copy the binaries to pymssql
pause

mkdir \Prog\pymssql\freetds\vs2015_64\lib
mkdir \Prog\pymssql\freetds\vs2015_64\include
copy \Prog\freetds_binx64\src\dblib\Release\db-lib.lib \Prog\pymssql\freetds\vs2015_64\lib
copy \Prog\freetds_binx64\src\tds\Release\tds.lib \Prog\pymssql\freetds\vs2015_64\lib
copy \Prog\freetds_binx64\include\tds_sysdep_public.h C:\Prog\pymssql\freetds\vs2015_64\include

copy \Prog\freetds_binx64\src\dblib\Release\*.lib C:\Prog\pymssql\freetds\vs2015_64\lib
copy \Prog\freetds_binx64\src\ctlib\Release\*.lib C:\Prog\pymssql\freetds\vs2015_64\lib

copy \Prog\freetds\include\sqlfront.h C:\Prog\pymssql\freetds\vs2015_64\include
copy \Prog\freetds\include\sybdb.h C:\Prog\pymssql\freetds\vs2015_64\include
copy \Prog\freetds\include\sqlfront.h C:\Prog\pymssql\freetds\vs2015_64\include
copy \Prog\freetds\include\sybfront.h C:\Prog\pymssql\freetds\vs2015_64\include

REM copy \Prog\openssl-bin-VC-64.dynamic\lib\libeay32MD.lib C:\Prog\pymssql\libeay32MD.lib
copy \Prog\openssl-bin-VC-64.dynamic\lib\libcrypto.lib C:\Prog\pymssql\libeay32MD.lib
REM openssl 1.02: copy \Prog\openssl-bin-VC-64.dynamic\lib\libeay32.lib C:\Prog\pymssql\libeay32MD.lib
REM may be called libeay32MD.lib if pre-built binary was downloaded

REM copy \Prog\openssl-bin-VC-64.dynamic\lib\ssleay32MD.lib C:\Prog\pymssql\ssleay32MD.lib
copy \Prog\openssl-bin-VC-64.dynamic\lib\libssl.lib C:\Prog\pymssql\ssleay32MD.lib
REM openssl 1.02:copy \Prog\openssl-bin-VC-64.dynamic\lib\ssleay32.lib C:\Prog\pymssql\ssleay32MD.lib
REM may be called ssleay32MD.lib if pre-built binary was downloaded

REM copy \Prog\openssl-bin-VC-64.dynamic\bin\libeay32MD.dll C:\Prog\pymssql\libeay32MD.dll
copy \Prog\openssl-bin-VC-64.dynamic\bin\libcrypto-1_1-x64.dll C:\Prog\pymssql\libeay32.dll
REM openssl 1.02:copy \Prog\openssl-bin-VC-64.dynamic\bin\libeay32.dll C:\Prog\pymssql\libeay32.dll

REM copy \Prog\openssl-bin-VC-64.dynamic\bin\ssleay32MD.dll C:\Prog\pymssql\ssleay32MD.dll
copy \Prog\openssl-bin-VC-64.dynamic\bin\libssl-1_1-x64.dll C:\Prog\pymssql\ssleay32.dll
REM openssl 1.02copy \Prog\openssl-bin-VC-64.dynamic\bin\ssleay32.dll C:\Prog\pymssql\ssleay32.dll

REM Setup doesn't seem to include vs2015_64\lib ... so copy the files to build\lib
copy \Prog\pymssql\freetds\vs2015_64\lib\* \Prog\pymssql\build\lib

REM *** Don't forget to copy sybdb.dll after pymssql is built:
REM copy C:\Prog\freetds_binx64\src\dblib\Release\sybdb.dll C:\Projects\TheasServer

pause
