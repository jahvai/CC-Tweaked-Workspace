local completion = require "cc.shell.completion"
local complete = completion.build(
  completion.file 
)
shell.setCompletionFunction("getGithubFile.lua", complete)
shell.setCompletionFunction("getGithubFile", complete)

if arg[1] == nil then
    write("Name of File To Retrieve: ")
    arg[1] = read()
end

if (arg[2] == nil) or (arg[2] == "nil") then
    arg[2] = arg[1]
end

local file = arg[1]
local filename = arg[2]
if (arg[3] == "force") or (arg[3] == "f") then
    shell.run("rm "..filename)
end

if string.lower(arg[2]) ~= "run" then
    shell.run("wget", "https://raw.githubusercontent.com/jahvai/CC-Tweaked-Workspace/refs/heads/main/"..file, filename)
else
    shell.run("wget", "run", "https://raw.githubusercontent.com/jahvai/CC-Tweaked-Workspace/refs/heads/main/"..file)
end
