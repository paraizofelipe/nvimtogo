local lspconfig = require'lspconfig'

lspconfig.gopls.setup{
    cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
    filetypes = { "go", "gomod" },
    root_dir = lspconfig.util.root_pattern('.git', 'go.mod');
}
