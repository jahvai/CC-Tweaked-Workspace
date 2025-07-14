if arg[1] == nil then
print("Name of File To Retrieve:")
arg[1] = read()
end

if arg[2] == nil then
arg[2] = arg[1]
end

file = arg[1]
filename = arg[2]
shell.run("wget", "https://raw.githubusercontent.com/jahvai/CC-Tweaked-Workspace/refs/heads/main/"..file, filename)
