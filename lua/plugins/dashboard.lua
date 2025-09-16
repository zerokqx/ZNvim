return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,

        header = [[
                                        `888                               
  oooooooo  .ooooo.  oooo d8b  .ooooo.   888  oooo   .ooooo oo oooo    ooo 
 d'""7d8P  d88' `88b `888""8P d88' `88b  888 .8P'   d88' `888   `88b..8P'  
   .d8P'   888ooo888  888     888   888  888888.    888   888     Y888'    
 .d8P'  .P 888    .o  888     888   888  888 `88b.  888   888   .o8"'88b   
d8888888P  `Y8bod8P' d888b    `Y8bod8P' o888o o888o `V8bod888  o88'   888o 
                                                          888.             
                                                          8P'              
                                                          "
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
