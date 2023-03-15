let input1 = Int(readLine()!)!
let input2 = readLine()!.split(separator: " ").map{Int($0)!}

var sumArray: [Int] = []

for i in input2 {
    for j in input2 {
        for k in input2{
            if i != j && j != k && k != i {
                sumArray.append(i+j+k)
            }
        }
    }
}

let flag = sumArray.contains(1000)

print(flag ? "Yes" : "No")