function showhiddenui
    if test $argv = 'on'
        cmd.exe /c 'reg add HKCU\Software\Logos4 /v ShowHiddenUI /t REG_DWORD /d 1 /f'
        return
    end

    if test $argv = 'off'
        cmd.exe /c 'reg delete HKCU\Software\Logos4 /v ShowHiddenUI /f'
        return
    end

    false
end
