return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,

        header = [[
 oooooooooooo ooooo      ooo              o8o                    
d'""""""d888' `888b.     `8'              `"'                    
      .888P    8 `88b.    8  oooo    ooo oooo  ooo. .oo.  .oo.   
     d888'     8   `88b.  8   `88.  .8'  `888  `888P"Y88bP"Y88b  
   .888P       8     `88b.8    `88..8'    888   888   888   888  
  d888'    .P  8       `888     `888'     888   888   888   888  
.8888888888P  o8o        `8      `8'     o888o o888o o888o o888o 
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
      },
    },
  },
}
