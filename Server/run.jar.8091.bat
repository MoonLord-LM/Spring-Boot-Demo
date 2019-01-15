@echo off

set "server_port=8091"

set "jar_file=target\server-0.0.1-SNAPSHOT.jar"
if not exist "%jar_file%" (
    mkdir "target"
    call mvn install
)

copy /B "%jar_file%" "%jar_file%.%server_port%"
set "jar_file=%jar_file%.%server_port%"

echo java -jar "%jar_file%" --server.port=%server_port% ^>^>"%~n0.log" 2^>^>^&1
java -jar "%jar_file%" --server.port=%server_port% >>"%~n0.log" 2>>&1

exit
