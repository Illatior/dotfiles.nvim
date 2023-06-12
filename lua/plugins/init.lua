vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use('wbthomason/packer.nvim')

	local plugins = require("plugins.plugins-list")
	for _, plugin in pairs(plugins) do
		use(plugin)
	end
end)
