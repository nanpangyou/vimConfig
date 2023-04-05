-- 设置leader键
vim.g.mapleader = " "

local keymap = vim.keymap

----------------  插入模式  ----------------
--
keymap.set("i", "jj", "<ESC>")

----------------  visual 模式 ---------------
-- 单行或者多行移动  shift + j / shift + k
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-----------------  normal 模式 --------------
-- 分割窗口 leader+sv（split vertical）   leader+sh (split horizontal)
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口


-- 取消高亮  leader+nh
keymap.set("n", "<leader>nh", ":nohl<CR>") -- no high light
