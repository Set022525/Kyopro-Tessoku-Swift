let input = readLine()!.split(separator: " ").map{Int($0)!}
let seq = Array(input.first!...input.last!)
let flag = seq.contains{100%$0 == 0}

print(flag ? "Yes" : "No")