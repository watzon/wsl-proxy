@echo off
pushd %~dp0

rem Unfortunately the following won't work because
rem it runs into a length limit in CMD and only processes
rem about half of /usr/bin
rem
rem mkdir autogen
rem for /f %%x in ('wsl ls /usr/bin') do echo @echo off ^
rem
rem bash.exe -c "%%x %%*" > autogen/%xx.bat

rem So we'll use a bash script instead
bash -c "./proxygen.sh %*"

popd
