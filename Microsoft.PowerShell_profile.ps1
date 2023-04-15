
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

Set-PSReadlineKeyHandler -Key "Ctrl+a" -Function BeginningOfLine 
Set-PSReadlineKeyHandler -Key "Ctrl+e" -Function EndOfLine 

# 不好用
# Set-PSReadLineOption -EditMode Vi
# Set-PSReadlineOption -ViModeIndicator Cursor

#nvim中总是不支持 pysocks不知道为什么
$env:all_proxy="socks5://127.0.0.1:7890"
$env:NDK = "C:\Users\guoya\AppData\Local\Android\Sdk\ndk\25.1.8937393"
Set-Alias  vi nvim-qt

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
