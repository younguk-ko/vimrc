:: 2022-10-15 doskey for anaconda prompt alias
:: git repo : https://github.com/younguk-ko/vimrc.git
@echo off
doskey vi=C:\"Program Files"\Vim\vim90\gvim.exe
:: commands
doskey alias   = doskey $*
doskey cat     = type $*
doskey clear   = cls
doskey grep    = find $*
doskey history = doskey /history
doskey man     = help $*
::
doskey kill    = taskkill /PID $*
doskey l      = dir $*
doskey ls      = dir $*
doskey ll      = dir $*
::
doskey cp      = copy $*
doskey cpr     = xcopy $*
doskey mv      = move $*
doskey rm      = del $*
doskey rmr     = deltree $*
::
doskey ps      = tasklist $*
doskey pwd     = cd
::
doskey sudo    = runas /user:administrator $*

