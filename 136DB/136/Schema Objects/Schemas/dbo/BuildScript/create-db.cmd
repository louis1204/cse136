@ECHO OFF

MKDIR C:\MSSQL 1>NUL 2>&1
MKDIR C:\MSSQL\Data 1>NUL 2>&1
MKDIR C:\MSSQL\Log 1>NUL 2>&1

ECHO.

DEL *.SQL 1>NUL 2>&1
DEL *.LOG 1>NUL 2>&1

IF "%1"=="" GOTO SET_DEFAULT_DB
SET _db=%1

ECHO ----------------------
ECHO Building %_db% Database
ECHO ----------------------

:EXECUTE
ECHO -----------------
ECHO Creating Database
ECHO -----------------
cmd /c sqlcmd -b -i ..\Database\CreateDatabase.sql -S localhost -d master -v testvar="%_db%"
IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR

ECHO ---------------
ECHO Creating Tables
ECHO ---------------

SET SQLCMD=cmd /c sqlcmd -b -S localhost -d "%_db%"
for %%d in (..\Tables\*.sql) do %SQLCMD% -i%%d

ECHO -----------------
ECHO Creating Triggers
ECHO -----------------
SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
for %%d in (..\Triggers\*.sql) do %SQLCMD% -i%%d

IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR

ECHO ------------------
ECHO Creating Functions
ECHO ------------------
SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
for %%d in (..\Programmability\Functions\*.sql) do %SQLCMD% -i%%d
IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR

ECHO --------------
ECHO Creating Views
ECHO --------------
SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
for %%d in (..\Views\*.sql) do %SQLCMD% -i%%d

REM IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR

ECHO ---------------------------
ECHO Creating Indexes and Keys
ECHO ---------------------------
SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
for %%d in (..\Tables\Indexes\*.sql) do %SQLCMD% -i%%d

SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
for %%d in (..\Tables\Keys\PK*.sql) do %SQLCMD% -i%%d

SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
for %%d in (..\Tables\Keys\FK*.sql) do %SQLCMD% -i%%d

IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR

ECHO ---------------------------
ECHO Creating Constraints
ECHO ---------------------------
SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
for %%d in (..\Tables\Constraints\*.sql) do %SQLCMD% -i%%d

IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR

ECHO -------------------------------
ECHO Creating %_db% Stored Procedures
ECHO -------------------------------
SET SQLCMD=cmd /c sqlcmd -b -S localhost -d %_db%
SET ScriptsPath=..\Programmability\Stored Procedures\
FOR /R "%ScriptsPath%" %%G IN (*.sql) DO %SQLCMD% -i "%%G"


ECHO -----------------
ECHO Grant permissions
ECHO -----------------
cmd /c sqlcmd -b -i ..\Database\GrantExecution.sql -S localhost -d %_db%
IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR


IF [%ERRORLEVEL%] NEQ [0] GOTO ERROR

GOTO SUCCESS

:ERROR
ECHO --------------------------------------
ECHO ERROR OCCURRED WHILE BUILDING DATABASE
ECHO --------------------------------------
IF "%_db%" EQU "Quiet" GOTO END
PAUSE
GOTO END

:SUCCESS
ECHO Database built successfully
DEL *.SQL 1>NUL 2>&1
DEL *.LOG 1>NUL 2>&1
IF "%_db%" EQU "Quiet" GOTO END

GOTO END

:SET_DEFAULT_DB
SET _db=136dbtest
GOTO EXECUTE

:END
PAUSE
ECHO %date% %time%
