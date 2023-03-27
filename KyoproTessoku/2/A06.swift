var prefixSum = [0]
let input1 = readLine()!.split(separator: " ").map{Int($0)!}  //[N, Q]
let numVisitors = readLine()!.split(separator: " ").map{Int($0)!}  //[A1, A2, ..., AN]

//calc prefix sum
for i in 1...input1.first! {
    prefixSum.append(prefixSum[i-1]+numVisitors[i-1])
}

for _ in 1...input1.last! {
    let input2 = readLine()!.split(separator: " ").map{Int($0)!} //[Li, Ri]

    //output
    print(prefixSum[input2.last!] - prefixSum[input2.first! - 1])
}