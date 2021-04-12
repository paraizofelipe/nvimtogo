local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#3c3836',
  fg = '#504945',
  yellow = '#fabd2f',
  cyan = '#83a598',
  darkblue = '#076678',
  green = '#b8bb26',
  orange = '#fe8019',
  purple = '#d3869b',
  magenta = '#8f3f71',
  blue = '#458588',
  red = '#cc241d',

  gui00 = "#1d2021",
  gui01 = "#3c3836",
  gui02 = "#504945",
  gui03 = "#665c54",
  gui04 = "#bdae93",
  gui05 = "#d5c4a1",
  gui06 = "#ebdbb2",
  gui07 = "#fbf1c7",
  gui08 = "#fb4934",
  gui09 = "#fe8019",
  gui0A = "#fabd2f",
  gui0B = "#b8bb26",
  gui0C = "#8ec07c",
  gui0D = "#83a598",
  gui0E = "#d3869b",
  gui0F = "#d65d0e",
  grey = '#928374',
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = {colors.gui02,colors.gui02}
  },
}

gls.left[2] = {
    BufferNumber = {
        -- provider = 'BufferNumber',
        provider = function()
            current_win = vim.api.nvim_get_current_win()
            return vim.api.nvim_win_get_number(current_win)..' '
        end,
        separator = '',
        separator_highlight = {colors.gui02,colors.gui04},
        highlight = {colors.gui04,colors.gui02},
    }
}
gls.left[3] = {
  ViMode = {
    provider = function()
      local alias = {n = ' NORMAL ',i = ' INSERT ',c= ' COMMAND ',v= ' VISUAL ',V= ' VISUAL LINE ', [''] = ' VISUAL BLOCK '}
      return alias[vim.fn.mode()]
    end,
    separator = '',
    separator_highlight = {colors.gui04,function()
      if not buffer_not_empty() then
        return colors.gui0F
      end
      return colors.bg
    end},
    -- highlight = {colors.gui00,colors.gui04,'bold'},
    highlight = {colors.gui00,colors.gui04,'bold'},
  },
}

gls.left[4] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty,
    highlight = {colors.orange,colors.bg},
  }
}
gls.left[5] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    condition = buffer_not_empty,
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
    separator_highlight = {colors.bg,colors.gui02},
    highlight = {colors.bg,colors.bg}
  }
}
gls.left[10] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.gui02},
  },
}
gls.left[10] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.gui02,colors.bg},
    highlight = {colors.gui04,colors.gui02}
  }
}
gls.left[12] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
-- gls.left[12] = {
--   Space = {
--     provider = function () return ' ' end
--   }
-- }
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.right[1]= {
  FileEncode = {
    provider = 'FileEncode',
    separator = '',
    separator_highlight = {colors.gui04,colors.bg},
    highlight = {colors.gui00,colors.gui04},
  }
}
gls.right[2]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {colors.gui00,colors.gui04},
    highlight = {colors.gui00,colors.gui04},
  }
}
gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.gui04},
    highlight = {colors.gui00,colors.gui04},
  },
}
gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.gui02,colors.gui04},
    highlight = {colors.gui04,colors.gui02},
  }
}
gls.right[5] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.gui02},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}
