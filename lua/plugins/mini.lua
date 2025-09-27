-- disable ]f or [f if is vscode
if vim.g.vscode then
  return {}
end

return {
  -- borrow from https://github.com/folke/dot/blob/master/nvim/lua/plugins/coding.lua
  {
    "nvim-mini/mini.ai",
    keys = { { "[f", desc = "Prev function" }, { "]f", desc = "Next function" } },

    opts = function()
      -- add treesitter jumping
      ---@param capture string
      ---@param start boolean
      ---@param down boolean
      local function jump(capture, start, down)
        local rhs = function()
          local ft = vim.bo.filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft

          -- safer: pass language explicitly
          local ok_parser, parser = pcall(vim.treesitter.get_parser, 0, lang)
          if not ok_parser or not parser then
            return vim.notify(("No treesitter parser for %s (lang=%s)"):format(ft, lang), vim.log.levels.ERROR)
          end

          -- IMPORTANT: use query.get for named queries
          local query = vim.treesitter.query.get(lang, "textobjects")
          if not query then
            return vim.notify(
              ("No 'textobjects' query for %s (lang=%s). Did you install nvim-treesitter-textobjects?"):format(ft, lang),
              vim.log.levels.ERROR
            )
          end

          local cursor = vim.api.nvim_win_get_cursor(0)
          local locs = {} ---@type {[1]:number, [2]:number}[]

          for _, tree in ipairs(parser:trees()) do
            for id, node in query:iter_captures(tree:root(), 0) do
              if query.captures[id] == capture then
                local r1, c1, r2, c2 = node:range()
                local row = (start and r1 or r2) + 1
                local col = (start and c1 or c2) + 1
                if (down and row > cursor[1]) or ((not down) and row < cursor[1]) then
                  table.insert(locs, { row, col })
                end
              end
            end
          end

          if #locs == 0 then
            return vim.notify("No matching textobject locations found", vim.log.levels.WARN)
          end
          return pcall(vim.api.nvim_win_set_cursor, 0, down and locs[1] or locs[#locs])
        end

        local c = capture:sub(1, 1):lower()
        local lhs = (down and "]" or "[") .. (start and c or c:upper())
        local desc = (down and "Next " or "Prev ") .. (start and "start" or "end") .. " of " .. capture:gsub("%..*", "")
        vim.keymap.set("n", lhs, rhs, { desc = desc })
      end

      for _, capture in ipairs({ "function.outer", "class.outer" }) do
        for _, start in ipairs({ true, false }) do
          for _, down in ipairs({ true, false }) do
            jump(capture, start, down)
          end
        end
      end
    end,
  },
}
