return {
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
	    return
      end

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
	    return
      end

      local cmp = require("cmp")      
      --   פּ ﯟ   some other good icons
      local kind_icons = {
      	Text = "",
      	Method = "m",
      	Function = "",
      	Constructor = "",
      	Field = "",
      	Variable = "",
      	Class = "",
      	Interface = "",
      	Module = "",
      	Property = "",
      	Unit = "",
      	Value = "",
      	Enum = "",
      	Keyword = "",
      	Snippet = "",
      	Color = "",
      	File = "",
      	Reference = "",
      	Folder = "",
      	EnumMember = "",
      	Constant = "",
      	Struct = "",
      	Event = "",
      	Operator = "",
      	TypeParameter = "",
      	Copilot = "",
      }
      -- find more here: https://www.nerdfonts.com/cheat-sheet
      cmp.setup({
        window = {
          documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		  },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
     	formatting = {
	      fields = { "kind", "abbr", "menu" },
		  format = function(entry, vim_item)

            -- Kind icons`
		  	vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		  	-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		  	vim_item.menu = ({
		  		nvim_lsp = "[LSP]",
		  		luasnip = "[Snippet]",
		  		buffer = "[Buffer]",
		  		path = "[Path]",
		  		copilot = "[Copilot]",
		  	})[entry.source.name]
		  	return vim_item
		  end,
	    },
        mapping = {
		  ["<C-k>"] = cmp.mapping.select_prev_item(),
		  ["<C-j>"] = cmp.mapping.select_next_item(),
		  ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		  ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		  ["<C-e>"] = cmp.mapping({
		  	i = cmp.mapping.abort(),
		  	c = cmp.mapping.close(),
		  }),
		  -- Accept currently selected item. If none selected, `select` first item.
		  -- Set `select` to `false` to only confirm explicitly selected items.
		  ["<CR>"] = cmp.mapping.confirm({ select = true }),
		  ["<Tab>"] = cmp.mapping(function(fallback)
		  	if cmp.visible() then
		  		cmp.select_next_item()
		  	elseif require("copilot.suggestion").is_visible() then
		  		require("copilot.suggestion").accept()
		  	elseif luasnip.expandable() then
		  		luasnip.expand()
		  	elseif luasnip.expand_or_jumpable() then
		  		luasnip.expand_or_jump()
		  	elseif check_backspace() then
		  		fallback()
		  	else
		  		fallback()
		  	end
		  end, {
            "n",
		  	"i",
		  	"s",
		  }),
		  ["<S-Tab>"] = cmp.mapping(function(fallback)
		  	if cmp.visible() then
		  		cmp.select_prev_item()
		  	elseif luasnip.jumpable(-1) then
		  		luasnip.jump(-1)
		  	else
		  		fallback()
		  	end
		  end, {
		  	"i",
		  	"s",
		  }),
        },
     	sources = {
	  	  { name = "copilot" },
	  	  { name = "nvim_lsp" },
	  	  { name = "luasnip" },
	  	  { name = "buffer" },
	  	  { name = "path" },
	  	  { name = "cmdline" },
	    },
	    confirm_opts = {
		    behavior = cmp.ConfirmBehavior.Replace,
		    select = false,
	    },
    	experimental = {
	      ghost_text = false,
		  native_menu = false,
	    },
      })
    end,
  },
}

