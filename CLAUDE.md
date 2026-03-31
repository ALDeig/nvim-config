# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using **lazy.nvim** as the plugin manager. The config is written in Lua and targets macOS. The primary development language is Python (with Ruff + Pyright), but LSP support is also configured for Lua, TypeScript, HTML, and Protobuf.

## Architecture

**Entry point:** `init.lua` loads modules in order: lazy (plugin manager) -> options -> lsp -> mappings -> color.

**Directory structure:**
- `lua/config/` — core configuration: options, LSP setup, keymaps, colorscheme
- `lua/config/mappings/` — keymaps split by concern (global in `init.lua`, plus per-plugin files)
- `lua/plugins/` — lazy.nvim plugin specs (each file returns a table or list of tables)
- `lua/config/lsp_configs.lua` — detailed Pyright and Ruff LSP settings

**Key design decisions:**
- LSP is configured via native `vim.lsp.enable()` / `vim.lsp.config()` (not lspconfig setup calls) — Mason installs servers, but activation is manual in `lua/config/lsp.lua`
- Completion is handled by **blink.cmp** (not nvim-cmp)
- Formatting is managed by **conform.nvim** with format-on-save (can be toggled with `:FormatDisable` / `:FormatEnable`)
- File explorer uses **snacks.nvim** explorer (not neo-tree, though neo-tree config file still exists)
- Colorscheme: **kanagawa-wave** with custom overrides in `lua/config/color.lua`
- Leader key is `<Space>`, local leader is `\`

## Conventions

- Plugin specs go in `lua/plugins/` — one file per plugin or logical group
- Lua files use 2-space indentation; Python uses 4-space (configured in options.lua)
- Comments in config files are written in Russian
- Formatter for Lua: **stylua** (via conform.nvim + Mason)
- `ruff.toml` at repo root mirrors the Ruff LSP settings from `lsp_configs.lua` — keep them in sync when changing lint rules

## Key Mappings Reference

- `,f` / `,g` / `,b` / `,s` — Telescope: files / grep / buffers / git status
- `<leader>e` — file explorer (Snacks)
- `<leader>tg` / `<leader>tv` — float / split terminal (Snacks)
- `H` / `L` — previous / next buffer (barbar)
- `<leader>x` — close buffer
- `<leader>ff` — format buffer (conform)
- `gd` / `gl` / `gq` — LSP: definition / diagnostics float / format

## Dependencies

System: `ripgrep`, `npm`. Mason-managed: `lua-language-server`, `pyright`, `ruff`, `stylua`, `ts_ls`, `html`, `protols`.
