let input1 = readLine()!.split(separator: " ").map{Int($0)!}
let input2 = readLine()!.split(separator: " ").map{Int($0)!}
let flag = input2.contains(input1.last!)

print(flag ? "Yes" : "No")