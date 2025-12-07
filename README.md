# pax - the most suckless nvim plugin manager
The pax plugin manager is made for people who do not like bloat nor unnecessary features. It is all a plugin manager should be. It installs plugins and gets the job done.

## Installation

```bash
curl -fLosS ~/.config/nvim/lua/pax.lua --create-dirs \
    https://raw.githubusercontent.com/daym0ns/pax/refs/heads/main/pax.lua
```

## Usage
For a single plugin:
```lua
-- init.lua
local pax = require("pax")

pax.ensure('vague-theme/vague.nvim')
```

OR for multiple plugins:

```lua
-- init.lua
local pax = require("pax")
local plugins = {
  'vague-theme/vague.nvim',
  'nvim-mini/mini.pick',
  ...
}

pax.ensureTable(plugins)
