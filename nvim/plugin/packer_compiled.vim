" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/editor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/editor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/editor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/editor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/editor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/editor/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
