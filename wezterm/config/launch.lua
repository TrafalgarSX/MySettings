local platform = require("utils.platform")()

local options = {
  default_prog = {},
  launch_menu = {},
}

if platform.is_win then
  options.default_prog = { "pwsh" }
  options.launch_menu = {
    { label = " PowerShell v1", args = { "powershell" } },
    { label = " PowerShell v7", args = { "pwsh" } },
    { label = " Cmd", args = { "cmd" } },
    { label = " wsl", args = { "wsl" } },
    {
      label = " archlinux",
      args = { "ssh", "trafalgar@192.168.1.5", "-p", "22" },
    },
  }
elseif platform.is_linux then
  options.default_prog = { "zsh", "--login" }
  options.launch_menu = {
    { label = " Bash", args = { "bash", "--login" } },
    { label = " Zsh", args = { "zsh", "--login" } },
  }
end

return options
