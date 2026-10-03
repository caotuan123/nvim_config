return 
{
  'stevearc/conform.nvim',
   config = function()
     require("conform").setup{
     	formatters_by_ft = {
     	  ppython = { "ruff_format" },
     	},
     }
     end
}

