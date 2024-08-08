!include "MUI.nsh"

Name "StabIV"
InstallDir "$PROGRAMFILES\Steam\steamapps\common\Grand Theft Auto IV\GTAIV"
OutFile "StabIV_Installer.exe"
BrandingText "StabIV v1.0 Installer"

!define MUI_ICON "setup.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "header.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "wizard.bmp"
!define MUI_WELCOMEPAGE_TEXT "Setup will guide you through the installation process of StabIV.\n\nYou should close all other application before continuing.\n\nClick Next to continue and Cancel to exit the Setup Wizard."

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "Install"

  ; Define the destination path
  SetOutPath $INSTDIR

  ; Copy individual DLL files
  File /oname=$INSTDIR\d3d9.dll "binaries\dxvk\d3d9.dll"
  File /oname=$INSTDIR\dxgi.dll "binaries\dxvk\dxgi.dll"
  File /oname=$INSTDIR\dinput8.dll "binaries\GTAIV.EFLC.FusionFix\dinput8.dll"

  ; Create and copy the content of the 'plugins' folder
  CreateDirectory "$INSTDIR\plugins"
  SetOutPath "$INSTDIR\plugins"
  File /nonfatal /a /r "binaries\GTAIV.EFLC.FusionFix\plugins\*.*"

  ; Create and copy the content of the 'update' folder
  CreateDirectory "$INSTDIR\update"
  SetOutPath "$INSTDIR\update"
  File /nonfatal /a /r "binaries\GTAIV.EFLC.FusionFix\update\*.*"

SectionEnd
