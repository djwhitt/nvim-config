# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

AstroNvim v5 configuration using Lazy.nvim as the plugin manager. Multi-language setup with emphasis on Clojure, Lua, JavaScript/TypeScript, Nix, and Terraform.

## Architecture

**Bootstrap flow**: `init.lua` → bootstraps Lazy.nvim → `lua/lazy_setup.lua` → loads AstroNvim + `lua/plugins/*.lua` → `lua/polish.lua` (post-setup)

**Core AstroNvim plugins** (the main configuration files):
- `lua/plugins/astrocore.lua` — Keymaps, vim options, diagnostics, autocmds
- `lua/plugins/astrolsp.lua` — LSP servers, formatting rules, per-language formatter config
- `lua/plugins/none-ls.lua` — Non-LSP formatters/linters (prettier, stylua, selene)
- `lua/plugins/cmp.lua` — Completion via blink.cmp (Copilot > LSP > snippets > path)

**Custom modules**: `lua/user/utils/` contains custom utility functions (e.g., `e.lua` sends text under cursor to external `e` command).

## Formatting & Linting

- **Lua**: StyLua (formatter) + Selene (linter) — configs at `.stylua.toml` and `selene.toml`
- **JS/TS**: Biome (primary, via LSP) with Prettier fallback (via none-ls)
- **Auto-format on save** is enabled except for lua and markdown filetypes

Run StyLua manually: `stylua lua/`

## Conventions

- Each plugin gets its own file in `lua/plugins/` returning a Lazy.nvim plugin spec table
- AstroNvim's `astrocore`, `astrolsp`, and `astroui` handle centralized config — prefer extending these over ad-hoc `vim.api` calls
- Disabled plugins/features are commented out in-place rather than deleted, to preserve reference
- `.bak` files in `lua/plugins/` are disabled plugin configs kept for reference

## Key Design Decisions

- Delete/change operations (`d`, `c`, `x`, `s`) use the black hole register to prevent clipboard pollution (configured in `astrocore.lua` mappings)
- Copilot is enabled only for specific filetypes (clojure, javascript, lua, make, nix, sh, sql, typescript) — all others are disabled by default
- LSP formatting is disabled for `lua_ls` and `ts_ls` in favor of dedicated formatters
- Line numbers and tabline are disabled for a minimal UI
