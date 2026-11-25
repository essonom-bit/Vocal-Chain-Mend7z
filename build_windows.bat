@echo off
REM ---- Compilation locale sur Windows ----
REM Prerequis : Visual Studio 2022 Community (charge de travail "Developpement Desktop en C++") + CMake + Git
cmake -B build -DCMAKE_BUILD_TYPE=Release || goto :error
cmake --build build --config Release --target VocalChain_VST3 --parallel || goto :error
echo.
echo Plugin compile ! Dossier : build\VocalChain_artefacts\Release\VST3\
echo Copie dans le dossier VST3 de Windows (lance ce .bat en administrateur)...
xcopy /E /I /Y "build\VocalChain_artefacts\Release\VST3\Vocal Chain.vst3" "%CommonProgramFiles%\VST3\Vocal Chain.vst3"
pause
exit /b 0
:error
echo ERREUR pendant la compilation.
pause
exit /b 1
