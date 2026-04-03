@ECHO OFF
set ROPTS=-np all --parallel-authenticate localonly --machines-file nodes
set COPTS=
set FEKO_SCRIPT_FILE=E:/Important Docs/IoT/Aufgabe 1/Task 2/parameter_sweep/CadFeko Aufgabe 1 Task 2_01.bof

if "%FEKO_HOME%"=="" (
echo           INFO: Parameter Sweep Solve 
echo ************************************************ 
echo *         FEKO_HOME variable is not set.       * 
echo ************************************************ 
echo  Please run initfeko, or set the environment variable FEKO_HOME to point to the FEKO installation.
echo  This script will now exit.
exit /B
) else (
call "%FEKO_HOME%/bin/initfeko.bat"
)
"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_01" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_01" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_02" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_02" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_03" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_03" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_04" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_04" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_05" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_05" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_06" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_06" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_07" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_07" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_08" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_08" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_09" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_09" %ROPTS%

"C:\Program Files\Altair\2024\feko/bin/cadfeko_batch" "CadFeko Aufgabe 1 Task 2_10" %COPTS%
runfeko "CadFeko Aufgabe 1 Task 2_10" %ROPTS%

echo           DONE: Parameter Sweep Solve
echo ************************************************
echo * Launch POSTFEKO and merge the results.       *
echo ************************************************
choice /N /M "Do you want to run POSTFEKO now (y/n):"

if not errorlevel 2 (
    if exist "%FEKO_SCRIPT_FILE%" (
        start postfeko "%FEKO_SCRIPT_FILE%" --run-script "%FEKO_SHARED_HOME%/installedapplicationmacrolibrary/Shared/ParameterSweep/combine_parameter_sweep_results.lua"
    ) else (
        start postfeko --run-script "%FEKO_SHARED_HOME%/installedapplicationmacrolibrary/Shared/ParameterSweep/combine_parameter_sweep_results.lua"
    )
)
exit
