ip = "example.com"

function split_string(str, pat)
    local t = {}
    local fpat = "(.-)"..pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t,cap)
        end
        last_end = e + 1
        s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
        cap = str:sub(last_end) table.insert(t, cap)
    end
    return t
end
function clear()
    term.clear()
    term.setCursorPos (1,1)
end
   
while true do
    clear()
    print ("Press any key to run.")
    local event, key = os.pullEvent ("char")
    clear() 
    local source = http.get("http://" .. ip .. "/turtle.txt")
    local aSource = source.readAll()
    source.close()
    local delay = 0.3
    move = split_string(aSource, ",")
    
    local reply = ''

    for i=1, #move do
        --loadstring(move[i])() and append to reply
        reply = reply .. move[i] .. ', '

        sleep(delay)
    end

    http.post("http://" .. ip, "reply=" .. reply)
    sleep(1.5)
  end
