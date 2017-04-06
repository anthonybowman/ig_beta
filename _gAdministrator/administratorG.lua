local adminRanks = {
    [1] = "#12DB43(Adminsegéd)",
    [2] = "#12DB43(Admin Level 1)",
    [3] = "#12DB43(Admin Level 2)",
    [4] = "#12DB43(Admin Level 3)",
    [5] = "#12DB43(Admin Level 4)",
    [6] = "#12DB43(Admin Level 5)",
    [7] = "#219DF0(Fő Admin)",
    [8] = "#9F00C2(AdminController)",
    [9] = "#E84E0C(Tulajdonos)",	
    [10] = "#E84E0C(Developer)",	
}

function getRankName(id)
    return adminRanks[id]
end 

enabledSerials = {
    ["BE1ADFC2974AA213F5F18389A1523DB4"] = true, --# Krumpli2
    ["1BD1DFFA59A6CFA793DA8D6933589783"] = true, --# Anthony
}

cmdList = {
    ["shutdown"] = true,
    ["register"] = true,
    ["msg"] = true,
    ["login"] = true,
    ["restart"] = true,
    ["start"] = true,
    ["stop"] = true,
    ["refresh"] = true,
    ["aexec"] = true,
    ["refreshall"] = true,
    ["debugscript"] = true,
}
