return 
{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'javascript', 'lua', 'python', 'bash' }, -- choose your languages
      highlight = { enable = true },
      indent = { enable = true },
    }
    end
}
