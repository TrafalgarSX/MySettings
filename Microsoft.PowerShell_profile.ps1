Import-Module DirColors
Import-Module posh-git
Import-Module PSReadLine
# Import-Module on-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_classic.omp.json" | Invoke-Expression

Set-PSReadlineKeyHandler -Key Tab -Function Complete ## set Tab key to completion
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadlineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadlineKeyHandler -Key UpArrow  -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# $env:HTTP_PROXY="http://127.0.0.1:7890"
# $env:HTTPS_PROXY="https://127.0.0.1:7890"
#nvim中总是不支持 pysocks不知道为什么
$env:all_proxy="socks5://127.0.0.1:7890"
Set-Alias  vi nvim-qt

#设置socks5代理
function set-proxy {
  $env:http_proxy="" 
  $env:https_proxy=""   
  $env:all_proxy="socks5://127.0.0.1:7890"
}
#unset proxy
function unset-proxy{
  $env:http_proxy="" 
  $env:https_proxy="" 
  $env:all_proxy=""
 }

 #设置http,https代理
 function set-httpproxy{
  $env:all_proxy=""
  $env:http_proxy="http://127.0.0.1:7890" 
  $env:https_proxy="https://127.0.0.1:7890" 

}
