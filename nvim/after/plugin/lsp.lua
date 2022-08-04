local on_attach = function(client, bufnr) 
	local bufopts = { noremap = true, silent=true, buffer=bufnr}

    require("illuminate").on_attach(client)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, bufopts)
	vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local cmp     = require("cmp")
-- https://github.com/onsails/lspkind.nvim
local lspkind = require("lspkind")
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local luasnip = require("luasnip")
-- https://github.com/tzachar/cmp-tabnine
local tabnine = require("cmp_tabnine.config")

require("symbols-outline").setup()

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
	snippet = {
    	expand = function(args)
      		luasnip.lsp_expand(args.body)
    	end,
  	},

	mapping = cmp.mapping.preset.insert({
    	['<C-d>'] = cmp.mapping.scroll_docs(-4),
    	
		['<C-f>'] = cmp.mapping.scroll_docs(4),
    	
		['<C-Space>'] = cmp.mapping.complete(),
    	
		['<CR>'] = cmp.mapping.confirm {
      		behavior = cmp.ConfirmBehavior.Replace,
      		select = true,
    	},
    	
		['<Tab>'] = cmp.mapping(function(fallback)
      		if cmp.visible() then
        		cmp.select_next_item()
      		elseif luasnip.expand_or_jumpable() then
        		luasnip.expand_or_jump()
      		else
        		fallback()
      		end
    	end, { 'i', 's' }),
    	
		['<S-Tab>'] = cmp.mapping(function(fallback)
      		if cmp.visible() then
       			cmp.select_prev_item()
      		elseif luasnip.jumpable(-1) then
        		luasnip.jump(-1)
      		else
       			fallback()
      		end
    	end, { 'i', 's' }),
  	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. ' ' .. menu
				end
				vim_item.kind = ''
			end
			vim_item.menu = menu
			return vim_item
		end
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})

tabnine:setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = "..";
})

require("lspconfig").clangd.setup {
	capabilities = capabilities,
    on_attach = on_attach,
    
    cmd = {
        "clangd", "-j=3", "--clang-tidy", "--background-index",
		"--completion-style=detailed", "--header-insertion=never",
		"--header-insertion-decorators=0"	      
    },

    filetypes = {"c", "cpp", "h", "hpp", "objc", "objcpp"}
}
