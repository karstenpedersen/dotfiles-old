require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
  	}
  }
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('harpoon')
require('telescope').load_extension('lazygit')

