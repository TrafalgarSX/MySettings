
#set encoding
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

# Import-Module DirColors
Import-Module posh-git
Import-Module PSReadLine
# Import-Module on-my-posh
#设置theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_classic.omp.json" | Invoke-Expression
# 放在前面不起作用, 应该适合DirColors冲突了
# 功能是给文件夹和文件加图标和上色
Import-Module -Name Terminal-Icons

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key Tab -Function Complete ## set Tab key to completion
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadlineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadlineKeyHandler -Key UpArrow  -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Set-PSReadlineKeyHandler -Key "Ctrl+a" -Function BeginningOfLine 
# Set-PSReadlineKeyHandler -Key "Ctrl+e" -Function EndOfLine 

Set-PSReadLineOption -EditMode Emacs
# vi模式不好用 没有光标转换
# Set-PSReadLineOption -EditMode Vi
# Set-PSReadlineOption -ViModeIndicator Cursor

#nvim中总是不支持 pysocks不知道为什么
$env:all_proxy="socks5://127.0.0.1:7890"
$env:NDK = "C:\Users\guoya\AppData\Local\Android\Sdk\ndk\25.1.8937393"
Set-Alias  vi nvim-qt

Set-Alias android_clang C:/Users/guoya/AppData/Local/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android29-clang
Set-Alias android_clang++ C:/Users/guoya/AppData/Local/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android29-clang++

Set-Alias rename Rename-Item

#设置socks5代理
function set_proxy {
  $env:http_proxy="" 
  $env:https_proxy=""   
  $env:all_proxy="socks5h://127.0.0.1:7890"
}
#unset proxy
function unset_proxy{
  $env:http_proxy="" 
  $env:https_proxy="" 
  $env:all_proxy=""
 }

 #设置http,https代理
 function set_httpproxy{
  $env:all_proxy=""
  $env:http_proxy="http://127.0.0.1:7890" 
  $env:https_proxy="https://127.0.0.1:7890" 

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

function msvc_run{
  $prefix="D:\workspace\dev\vcpkg\installed\x64-windows"
  $env:PATH+=";${prefix}\bin"
  $env:PATH+=";${prefix}\debug\bin"
}

function msvc_compile{
  $prefix="C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Launch-VsDevShell.ps1"
  &$prefix -Arch amd64 -HostArch amd64
  # &$prefix amd64 -vcvars_ver="14.35.32215" "10.0.22000.0"
}
