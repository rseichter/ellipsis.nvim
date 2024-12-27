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

When using [lazy.nvim](https://lazy.folke.io/), the following snippet suffices:

```lua
{
  'https://gitea.horus-it.com/rseichter/ellipsis.nvim.git',
  opts = { bindto = '<leader>ell' },
}
```

There is no default value for `bindto`.

## License

Copyright © 2024 Ralph Seichter.

ellipsis.nvim is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

ellipsis.nvim is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see [https://www.gnu.org/licenses/](https://www.gnu.org/licenses/).
