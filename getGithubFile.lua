if arg[1] == nil then
write("Name of File To Retrieve: ")
arg[1] = read()
end

if arg[2] == nil then
arg[2] = arg[1]
end

file = arg[1]
filename = arg[2]
if string.lower(arg[2]) != "run" then
shell.run("wget", "https://raw.githubusercontent.com/jahvai/CC-Tweaked-Workspace/refs/heads/main/"..file, filename)
else
shell.run("wget", "run", "https://raw.githubusercontent.com/jahvai/CC-Tweaked-Workspace/refs/heads/main/"..file)
end
