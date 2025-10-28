return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      float = {
        transparent = false,
        solid = false,
      },
      kitty = false,
      color_overrides = {
        mocha = {
          base = "#1F2430",
          mantle = "#1F2430",
          crust = "#000000",
        },
      },
      highlight_overrides = {
        mocha = function(cp)
          local O = require("catppuccin").options

          return {
            ["@tag"] = { fg = cp.lavender },
            ["@tag.attribute.tsx"] = { fg = cp.mauve, style = { "italic" } },
            ["@tag.attribute.javascript"] = { fg = cp.mauve, style = { "italic" } },
            ["@_jsx_attribute.javascript"] = { fg = cp.mauve, style = { "italic" } },
            ["@tag.builtin"] = { fg = cp.mauve },
            -- Override new highlights
            ["@variable.member"] = { fg = cp.lavender }, -- For fields.
            ["@module"] = { fg = cp.lavender, style = O.styles.miscs or { "italic" } }, -- For identifiers referring to modules and namespaces.
            ["@string.special.url"] = { fg = cp.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
            ["@type.builtin"] = { fg = cp.yellow, style = O.styles.properties or { "italic" } }, -- For builtin types.
            ["@property"] = { fg = cp.lavender, style = O.styles.properties or {} }, -- Same as TSField.
            ["@constructor"] = { fg = cp.sapphire }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
            ["@keyword.operator"] = { link = "Operator" }, -- For new keyword operator
            ["@keyword.export"] = { fg = cp.sky, style = O.styles.keywords },
            ["@markup.strong"] = { fg = cp.maroon, style = { "bold" } }, -- bold
            ["@markup.italic"] = { fg = cp.maroon, style = { "italic" } }, -- italic
            ["@markup.heading"] = { fg = cp.blue, style = { "bold" } }, -- titles like: # Example
            ["@markup.quote"] = { fg = cp.maroon, style = { "bold" } }, -- block quotes
            ["@markup.link"] = { link = "Tag" }, -- text references, footnotes, citations, etc.
            ["@markup.link.label"] = { link = "Label" }, -- link, reference descriptions
            ["@markup.link.url"] = { fg = cp.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
            ["@markup.raw"] = { fg = cp.teal }, -- used for inline code in markdown and for doc in python (""")
            ["@markup.list"] = { link = "Special" },
            ["@tag.attribute"] = { fg = cp.teal, style = O.styles.miscs or { "italic" } }, -- Tags like html tag names.
            ["@tag.delimiter"] = { fg = cp.sky }, -- Tag delimiter like < > /
            ["@property.css"] = { fg = cp.lavender },
            ["@property.id.css"] = { fg = cp.blue },
            ["@type.tag.css"] = { fg = cp.mauve },
            ["@string.plain.css"] = { fg = cp.peach },
            ["@constructor.lua"] = { fg = cp.flamingo }, -- For constructor calls and definitions: = { } in Lua.
            -- typescript
            ["@property.typescript"] = { fg = cp.lavender, style = O.styles.properties or {} },
            ["@constructor.typescript"] = { fg = cp.lavender },
            -- TSX (Typescript React)
            ["@constructor.tsx"] = { fg = cp.lavender },
            ["@type.builtin.c"] = { fg = cp.yellow, style = {} },
            ["@type.builtin.cpp"] = { fg = cp.yellow, style = {} },
            -- JSON
            ["@property.json"] = { fg = cp.lavender }, -- For fields.
            -- Enum
            ["@lsp.type.enumMember"] = { link = "@constant" },
          }
        end,
      },
    })
  end,
}
