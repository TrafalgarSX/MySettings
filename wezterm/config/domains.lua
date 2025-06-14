return {
  -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
  ssh_domains = {
    {
      -- The connection is an ssh connection, don't use any multiplexing.
      multiplexing = "None",

      -- The name of this specific domain. Must be unique amongst
      name = "arch-linux",

      -- identifies the host:port pair of the remote server
      -- Can be a DNS name or an IP address with an optional
      -- ":port" on the end.
      remote_address = "192.168.1.5:22",

      -- Whether agent auth should be disabled.
      -- Set to true to disable it.
      -- no_agent_auth = false,

      -- The username to use for authenticating with the remote host
      username = "trafalgar",

      -- Specify a SSH connection authentication file
      -- Default authentication file is "~/.ssh/id_rsa"
      ssh_option = {
        -- identityfile = "C:\\Users\\Fizz\\.ssh\\id_rsa",
      },
    },
  },

  -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
  unix_domains = {},

  -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
  wsl_domains = {
    {
      name = "WSL:Ubuntu-22.04",
      distribution = "Ubuntu-22.04",
      username = "trafalgar",
      default_cwd = "/home/trafalgar",
      default_prog = { "zsh" },
    },
  },
}
