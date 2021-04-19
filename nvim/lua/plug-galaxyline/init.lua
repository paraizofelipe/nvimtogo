local gl = require('galaxyline')
local condition = require('galaxyline.condition')

local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#3c3836',
  bg02 = "#504945",
  dark = '#1d2021',
  
  red = '#cc241d',
  green = '#98971a',
  yellow = '#d79921',
  blue = '#458588',
  purple = '#b16286',
  aqua = '#689d6a',
  gray = '#a89984',
  orange = '#d65d0e',

  -- Light mode --
  -- red = '#fb4934',
  -- green = '#b8bb26',
  -- yellow = '#fabd2f',
  -- blue = '#83a598',
  -- purple = '#d3869b',
  -- aqua = '#8ec07c',
  -- gray = '#ebdbb2',
  -- orange = '#fe8019',
}

local icons = {
    locker = ' ',
    unsaved = ' ',
    dos = ' ',
    unix = '',
    mac = '',
    lsp_error = ' ',
    lsp_warn = ' ',
}

gls.left[1] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = {colors.bg02,colors.bg02}
  },
}

gls.left[2] = {
    BufferNumber = {
        provider = function()
            current_win = vim.api.nvim_get_current_win()
            return vim.api.nvim_win_get_number(current_win)..' '
        end,
        separator = '',
        separator_highlight = 'GalaxyViMode',
        highlight = {colors.gray,colors.bg02},
    }
}

gls.left[3] = {
  ViMode = {
    provider = function()
        local alias = {
            n = { mode = ' NORMAL ', color = colors.bg, bg_color = colors.gray },
            i = { mode = ' INSERT ', color = colors.bg, bg_color = colors.aqua },
            c = { mode = ' COMMAND ', color = colors.bg, bg_color = colors.yellow },
            r = { mode = ' PROMPT ', color = colors.bg, bg_color = colors.purple },
            v = { mode = ' VISUAL ', color = colors.bg, bg_color = colors.orange },
            V = { mode = ' VISUAL LINE ', color = colors.bg, bg_color = colors.orange },
            [''] = {mode = ' VISUAL BLOCK ', color = colors.bg, bg_color = colors.orange },

            no = { mode = ' NORMAL-PENDING ', color = colors.bg, bg_color = colors.red },
            s = { mode = ' SELECT ', color = colors.bg, bg_color = colors.red },
            S = { mode = ' S-LINE ', color = colors.bg, bg_color = colors.red },
            ['^S'] = { mode = ' S-BLOCK ', color = colors.bg, bg_color = colors.red },
            R = { mode = ' REPLACE ', color = colors.bg, bg_color = colors.red },
            Rv = { mode = ' V-REPLACE ', color = colors.bg, bg_color = colors.red },
            cv = { mode = ' VIM EX ', color = colors.bg, bg_color = colors.red },
            ce = { mode = ' EX ', color = colors.bg, bg_color = colors.red },
            rm = { mode = ' MORE ', color = colors.bg, bg_color = colors.red },
            ['r?'] = { mode = ' CONFIRM ', color = colors.bg, bg_color = colors.red },
            ['!'] = { mode = ' SHELL ', color = colors.bg, bg_color = colors.red },
            t = { mode = ' TERMINAL ', color = colors.bg, bg_color = colors.red },
        }
        vim.api.nvim_command('hi GalaxyViMode guifg=' .. alias[vim.fn.mode()].color .. ' guibg=' .. alias[vim.fn.mode()].bg_color)
        vim.api.nvim_command('hi ViModeSeparator guifg=' .. alias[vim.fn.mode()].bg_color .. ' guibg=' .. alias[vim.fn.mode()].color)
        vim.api.nvim_command('hi BufferNumberSeparator guifg=' .. colors.bg02 .. ' guibg=' .. alias[vim.fn.mode()].bg_color)
        return alias[vim.fn.mode()].mode
    end,
    separator = '',
    separator_highlight = 'GalaxyViMode',
    highlight = {colors.dark,colors.gray,'bold'},
  },
}

gls.left[4] = {
    GitIcon = {
        provider = function() 
            return '   ' 
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[5] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = '  ',
    separator_highlight = {colors.gray,colors.bg},
    condition = condition.buffer_not_empty,
    highlight = {colors.grey,colors.bg},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[6] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.bg},
  }
}
gls.left[7] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.bg},
  }
}
gls.left[8] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.bg},
  }
}

gls.left[9] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.bg,colors.bg02},
    highlight = {colors.bg,colors.bg},
    condition = condition.buffer_not_empty,
  }
}

gls.left[10] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg02},
  },
}

gls.left[11] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = condition.buffer_not_empty,
    separator = '',
    separator_highlight = {colors.bg02,colors.bg},
    highlight = {colors.gray,colors.bg02}
  }
}

gls.left[12] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg},
    condition = condition.check_active_lsp,
  }
}

gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
    condition = condition.check_active_lsp,
  }
}

gls.right[1]= {
  FileEncode = {
    provider = 'FileEncode',
    separator = '',
    separator_highlight = {colors.gray,colors.bg},
    highlight = {colors.dark,colors.gray},
  }
}

gls.right[2]= {
 FileFormat = {
    provider = function()
        if not condition.buffer_not_empty() then return '' end
        local icon = icons[vim.bo.fileformat] or ''
        return string.format('%s ', icon)
    end,
    separator = ' ',
    separator_highlight = {colors.dark,colors.gray},
    highlight = {colors.dark,colors.gray},
  }
}

gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '  ',
    separator_highlight = {colors.bg,colors.gray},
    highlight = {colors.dark,colors.gray},
  },
}
gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.bg02,colors.gray},
    highlight = {colors.gray,colors.bg02},
  }
}
gls.right[5] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.bg02},
  }
}


gls.short_line_left[1] = {
  NoFocuFirstElement = {
    provider = function() return '▋' end,
    highlight = {colors.bg,colors.bg}
  },
}

gls.short_line_left[2] = {
  NoFocuBufferNumber = {
    provider = function()
        current_win = vim.api.nvim_get_current_win()
        return vim.api.nvim_win_get_number(current_win)..' '
    end,
    separator = ' ',
    separator_highlight = {colors.gray,colors.bg},
    highlight = {colors.gray,colors.bg}
  }
}

gls.short_line_left[3] = {
  NoFocuBufferType = {
    provider = 'FileName',
    separator = '  ',
    separator_highlight = {colors.gray,colors.bg},
    highlight = {colors.gray,colors.bg}
  }
}
