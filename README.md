# ellipsis.nvim

[Neovim](https://neovim.io/) plugin to convert gaps in text into a sequence of
horizontal ellipsis. Any sequence of three or more consecutive spaces between
non-space characters is considered a gap. For example, the plugin converts
this:

```
foo        foo
bar        bar
quux       quux
```

into this:

```
foo ……………… foo
bar ……………… bar
quux …………… quux
```

Note that this plugin is designed for Neovim's visual line mode only, and will
modify complete lines.

## Installation

### Via package managers

Neovim 0.12 introduced the [vim.pack](https://neovim.io/doc/user/pack/)
integrated package manager. Here is a matching configuration snippet:

```lua
vim.pack.add({ "https://github.com/rseichter/ellipsis.nvim", })
vim.keymap.set("v", "<leader>e", function() require("ellipsis").convert() end)
```

When using [lazy.nvim](https://lazy.folke.io/), the following snippet suffices:

```lua
{ "rseichter/ellipsis.nvim", opts = { bindto = "<leader>e" }, }
```

Defining a custom key binding is convenient, but optional.

### Via manual installation

The procedure for manual plugin installation is described in the Neovim
documentation. Use the command `:help packages` to access it.

## Usage

Select lines in Neovim visual mode, then use either your custom key binding or
the command `:lua Ellipsis.convert()` to process the lines currently selected
in visual mode. There is no default keymap binding.

## License

Copyright © 2024,2026 Ralph Seichter.

ellipsis.nvim is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

ellipsis.nvim is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see [https://www.gnu.org/licenses/](https://www.gnu.org/licenses/).
