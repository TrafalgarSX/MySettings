#set encoding
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

# Import-Module DirColors
Import-Module posh-git
Import-Module PSReadLine
# Import-Module on-my-posh
#设置theme
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_classic.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression
# 放在前面不起作用, 应该适合DirColors冲突了
# 功能是给文件夹和文件加图标和上色
Import-Module -Name Terminal-Icons

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key Tab -Function Complete ## set Tab key to completion
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadlineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadlineKeyHandler -Key UpArrow  -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -EditMode Emacs
# vi模式不好用 没有光标转换
# Set-PSReadLineOption -EditMode Vi
# Set-PSReadlineOption -ViModeIndicator Cursor

#nvim中总是不支持 pysocks不知道为什么
# $env:all_proxy="socks5://127.0.0.1:7890"
$env:NDK = "C:\Users\guoya\AppData\Local\Android\Sdk\ndk\25.1.8937393"

# Invoke-Expression (& { (lua D:/workspace/lua/z.lua/z.lua --init powershell) -join "`n" })
# Set-Alias zb "z -b"
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias  vi nvim-qt
Set-Alias android_clang C:/Users/guoya/AppData/Local/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android29-clang
Set-Alias android_clang++ C:/Users/guoya/AppData/Local/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android29-clang++
Set-Alias msvc_cl "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.35.32215\bin\Hostx64\x64\cl.exe"
Set-Alias rename Rename-Item
Set-Alias nt nvim-qt


#设置socks5代理
function set_proxy {
  $env:http_proxy=""
  $env:https_proxy=""  
  $env:all_proxy="socks5h://127.0.0.1:7890"
  # print suc
  echo "set socks5h proxy success"
}
#unset proxy
function unset_proxy{
  $env:http_proxy=""
  $env:https_proxy=""
  $env:all_proxy=""
  echo "unset proxy success"
 }

 #设置http,https代理
 function set_httpproxy{
  $env:all_proxy=""
  $env:http_proxy="http://127.0.0.1:7890" 
  $env:https_proxy="http://127.0.0.1:7890" 
  echo "set http proxy success"
}

function set_pwsh{
 gvim $PROFILE
}

# push file to android and run
function android_prun($exec){
  write-host $exec
  adb push "$exec" /data/local/tmp/"$exec"
  adb shell chmod 777 /data/local/tmp/"$exec"
  adb shell /data/local/tmp/"$exec"
}

# run file in android
function android_run($exec){
  write-host $exec
  adb shell /data/local/tmp/"$exec"
}

$path_backup = $env:PATH

function path_backup{
  $env:PATH=$path_backup
}

function mingw_run{
  path_backup
  $env:PATH+=";D:\workspace\dev\unixlib"
}

# 添加环境变量可以让执行程序时自动检测DLL
function msvc_run{
  path_backup
  $prefix="D:\workspace\dev\vcpkg\installed\x64-windows"
  $env:PATH+=";${prefix}\bin"
  $env:PATH+=";${prefix}\debug\bin"
}

# 静态库版本路径, 这样设置,当编译其他库自动检测依赖就可以选择vcpkg使用静态库还是动态库了
function msvc_runs{
  path_backup
  $env:PATH+=";D:\workspace\dev\msvclib" # 这里面放的是我自己编译的msvc静态库
  $prefix="D:\workspace\dev\vcpkg\installed\x64-windows-static"
  $env:PATH+=";${prefix}\lib"
  $env:PATH+=";${prefix}\debug\lib"
}

function msvc_compile{
  $prefix="C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Launch-VsDevShell.ps1"
  &$prefix -Arch amd64 -HostArch amd64
  # &$prefix amd64 -vcvars_ver="14.35.32215" "10.0.22000.0"
}

function gdbtool($exec)
{ 
  write-host $exec
  emacs --eval "(gdb `"gdb  -i=mi $exec`")"
}

function gdbtoolnw($exec)
{ 
  write-host $exec
  emacs -nw --eval "(gdb `"gdb  -i=mi $exec`")"
}

function shit
{
  inshellisense --shell powershell
}

function Invoke-Combine { [System.IO.FileInfo] [System.IO.Path]::Combine.Invoke($args) }

function ghelp{
  write-host "set_proxy"
  write-host "unset_proxy"
  write-host "set_httpproxy"
  write-host "set_pwsh"
  write-host "android_prun"
  write-host "android_run"
  write-host "path_backup"
  write-host "mingw_run"
  write-host "msvc_run"
  write-host "msvc_runs"
  write-host "msvc_compile"
  write-host "gdbtool"
  write-host "gdbtoolnw"
  write-host "shit (inshellisense)"
  write-host "ghcs"
}

# msvc_run
set_httpproxy
. "C:\Users\guoya\Documents\PowerShell\gh-copilot.ps1"
