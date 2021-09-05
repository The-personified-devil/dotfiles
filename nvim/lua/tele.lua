local opts = { noremap = true, silent = true }

tele_builtin = require("telescope.builtin")

set_keymap("n", "<leader>ff", "<CMD>lua tele_builtin.find_files()<CR>", opts)
set_keymap("n", "<leader>fg", "<CMD>lua tele_builtin.live_grep()<CR>", opts)
set_keymap("n", "<leader>fb", "<CMD>lua tele_builtin.buffers()<CR>", opts)
set_keymap("n", "<leader>fh", "<CMD>lua tele_builtin.help_tags()<CR>", opts)
