if arg[1] == nil then
print("Name of File To Retrieve:")
arg[1] = read()
end

file = arg[1]
shell.run("wget", "https://raw.githubusercontent.com/jahvai/CC-Tweaked-Workspace/refs/heads/main/"..file, file)
