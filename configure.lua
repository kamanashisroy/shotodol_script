function yes_no_to_bool(x)
	if(x == "y") then return true end
	return false
end

function prompt_yes_no(y)
	local x = "n"
	repeat
		 io.write(y)
		 io.flush()
		 x=io.read()
	until x=="y" or x=="n"
	return x
end

function prompt(y,xval)
	local x = xval
	io.write(y)
	io.flush()
	x=io.read()
	if x == "" then
		return xval
	end
	return x
end

local configLines = {}
local configOps = {}

io.write("This is the configure script built for shotodol_script package\n")
configLines["PLATFORM"] = "linux"

-- print("QT_HOME="..."/home/ayaskanti/opt/qt/Desktop/Qt/474/gcc")
-- print("ECHO="..."echo -e")
-- use only echo in mac
configLines["ECHO"] = "echo"
local haslfs,lfs = pcall(require,"lfs")
local phome = "";
if haslfs then
	phome = lfs.currentdir()
end
configLines["PROJECT_HOME"] = prompt("Project path " .. phome .. " > " , phome)
configLines["SHOTODOL_SCRIPT_HOME"] = configLines["PROJECT_HOME"]
-- local ahome = string.gsub(configLines["PROJECT_HOME"],"shotodol_script$","aroop")
-- configLines["VALA_HOME"] = prompt("Aroop path " .. ahome .. " > ", ahome)
local shotohome = string.gsub(configLines["PROJECT_HOME"],"shotodol_script$","shotodol")
configLines["SHOTODOL_HOME"] = prompt("Shotodol path " .. shotohome .. " > ", shotohome)
configLines["CFLAGS+"] = ""
configLines["VALAFLAGS+"] = ""

if configLines["PLATFORM"] == "linux" then
	configLines["LUA_LIB"] = prompt("enable lua library ?(50/5.1/n) > ", "50")
else
	configLines["LUA_LIB"] = "n"
end
if configLines["LUA_LIB"] ~= "n" then
	configLines["VALAFLAGS+"] = configLines["VALAFLAGS+"] .. " -D LUA_LIB"
end
local conf = assert(io.open("build/.config.mk", "w"))
-- import shotodol symbols
local infile = assert(io.open(configLines["SHOTODOL_HOME"] .. "/build/.config.mk", "r"))
local shotodol_config = infile:read("*a")
infile:close()
conf:write(shotodol_config);

for x in pairs(configLines) do
	local op = configOps[x]
	if op == nil then
		op = "="
	end
	conf:write(x .. op .. configLines[x] .. "\n")
end
assert(conf:close())

local shotodol = dofile(configLines["SHOTODOL_HOME"] .. "/build/shotodol.lua")
shotodol.genmake(configLines["PROJECT_HOME"])

