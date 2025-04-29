@echo off
doskey alias=if ".$*." == ".." ( doskey /MACROS ) else ( doskey $* )
doskey ls=dir /b $*
doskey update=cmd /S /C "echo Updating Rust && rustup update && echo Updating Cargo packages && cargo install-update --all && echo Updating Scoop packages && scoop update * && echo Updating Winget packages && winget upgrade --all && echo Updating Go packages && go-global-update && echo Updated everything!"
doskey diskspace=powershell "Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name='Used(GB)';Expression={($_.Used/1GB).ToString('F2')}}, @{Name='Free(GB)';Expression={($_.Free/1GB).ToString('F2')}}, @{Name='Total(GB)';Expression={($_.Used + $_.Free)/1GB}}"

