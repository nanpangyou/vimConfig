local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--  保存此文件自动更新安装软件
--  注意PackerCompile改成了PackerSync
--  plugins.lua改成了plugins-setup.lua， 适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- 主题
  use { "ellisonleao/gruvbox.nvim" }
  -- 显示栏
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
  -- 文件树
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
      config = function()
        require("nvim-tree").setup {}
      end
    }
  -- 窗口切换   使用ctrl+hjkl切换窗口 warn: 目前和键盘改键软件冲突 
  use ("christoomey/vim-tmux-navigator")
  -- 代码高亮
  use {"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'} 
  -- 括号高亮
  use "p00f/nvim-ts-rainbow"
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
