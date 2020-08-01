@echo off

REM Copyright (C) 2020. Nicolas Morales Escobar. All rights reserved.

REM This is the folder where the project and the build will be created
set /p basePath="Path to main folder: "

REM This is the folder where the RunUAT.bat is.
set /p enginePath="Path to UE Batch Files: "

cd %basePath%

echo Creating Project folder.
mkdir Project

echo Creating Build folder.
mkdir Build

REM You've got to change the branch and the HTTPS/SSH of your specific repository.
git clone -b develop https://github.com/Nicolas4677/UE4_BuildAutomation.git %basePath%\Project

PAUSE
cd %enginePath%

REM You also have to change the name of the UE project to your specific project.
RunUAT BuildCookRun -project="%basePath%\Project\BuildAutomationTest\BuildAutomationTest.uproject" -noP4 -platform=Win64 -clientconfig=Development -serverconfig=Development -cook -allmaps -build -stage -pak -archive -archivedirectory="%basePath%\Build"

echo Deleting Project folder which is no longer needed.
rd /s /q "%basePath%\Project"

echo Build is located in: %basePath%\Build

PAUSE