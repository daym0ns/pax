local M = {}

local home = os.getenv("HOME")
local paxdir = home .. "/.local/share/nvim/site/pack/pax/start/"
os.execute("mkdir -p " .. paxdir)

function M.ensure(plugin)
	local repo = plugin:match("([^/]+)$")
	local pdir = paxdir .. repo .. "/"

	local dirExists = os.execute('[ -d "' .. pdir .. '" ]')
	if dirExists ~= 0 then
		print("Installing plugin " .. plugin)
		local yn = vim.fn.input("Do you want to continue? [Y/n]: ")
		if string.upper(yn) == "Y" or yn == "" then
			os.execute("git clone --depth 1 https://github.com/" .. plugin .. " " .. pdir)
		else
			print("\nInstallation cancelled")
		end
	end
end

function M.ensureTable(t)
	for _, p in pairs(t) do
		M.ensure(p)
	end
end

return M
