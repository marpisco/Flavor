!macro NSIS_HOOK_PREINSTALL
  nsExec::Exec 'taskkill /F /IM flavord.exe'
!macroend

!macro NSIS_HOOK_POSTINSTALL
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "Flavor daemon" '"$INSTDIR\flavord.exe"'
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "Flavor" '"$INSTDIR\${MAINBINARYNAME}.exe" --hidden'
  Exec '"$INSTDIR\flavord.exe"'
  DeleteRegKey HKCU "Software\lunarlabs\Flavor\"
  DeleteRegKey /ifempty HKCU "Software\lunarlabs\"
!macroend

!macro NSIS_HOOK_PREUNINSTALL
  nsExec::Exec 'taskkill /F /IM flavord.exe'
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "Flavor daemon"
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "Flavor"
!macroend
