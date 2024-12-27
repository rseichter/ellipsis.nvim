--[[ Copyright © 2024 Ralph Seichter.

This file is part of ellipsis.nvim.

ellipsis.nvim is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

ellipsis.nvim is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
ellipsis.nvim. If not, see <https://www.gnu.org/licenses/>. --]]

local M = {}

M.setup = function(opts)
  _G.Ellipsis = M
  if opts and opts.bindto and type(opts.bindto) == 'string' then
    vim.keymap.set('v', opts.bindto, function()
      _G.Ellipsis.convert()
    end, {
      desc = 'Convert gaps in text into horizontal ellipsis',
    })
  end
end

M.convert = function()
  local buffer, from_row, _ = unpack(vim.fn.getpos('v'))
  local _, to_row, _ = unpack(vim.fn.getpos('.'))
  if to_row < from_row then
    -- Ensure proper ordering. User may have selected
    -- the visual block "upwards".
    from_row, to_row = to_row, from_row
  end
  -- Adjust to how nvim_buf_get_lines() uses row indexes
  from_row = from_row - 1
  local lines = vim.api.nvim_buf_get_lines(buffer, from_row, to_row, false)
  local replacement = {}
  for _, line in ipairs(lines) do
    -- Example: "Johnny<space*3>Bravo" matches, but "Johnny<space>Bravo" does not.
    local r = string.gsub(line, '(%S+)%s(%s+)%s(%S+)', function(prefix, gap, suffix)
      return prefix .. ' ' .. string.rep('…', #gap) .. ' ' .. suffix
    end)
    table.insert(replacement, r)
  end
  vim.api.nvim_buf_set_lines(buffer, from_row, to_row, false, replacement)
  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'x', false)
end

return M

-- EOF --
