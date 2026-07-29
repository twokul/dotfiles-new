-- Follow the macOS system appearance: Tokyo Night Moon (dark) / Day (light).
-- ghostty/config carries the matching pair, so the terminal and the editor
-- switch together.

local function is_dark_mode()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if not handle then
    return true
  end
  local result = handle:read("*a")
  handle:close()
  return result:match("Dark") ~= nil
end

local function apply_theme()
  if is_dark_mode() then
    vim.o.background = "dark"
    vim.cmd.colorscheme("tokyonight-moon")
  else
    vim.o.background = "light"
    vim.cmd.colorscheme("tokyonight-day")
  end
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("tokyonight").setup(opts)

      vim.o.termguicolors = true
      apply_theme()

      -- Re-check on focus so a system light/dark flip is picked up without
      -- restarting nvim.
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = apply_theme,
      })
    end,
  },

  -- Superseded by tokyonight above.
  { "tinted-theming/tinted-vim", enabled = false },

  -- apply_theme() owns the colorscheme; stop LazyVim setting its own.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function() end,
    },
  },
}
