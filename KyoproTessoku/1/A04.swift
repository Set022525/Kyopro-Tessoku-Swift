let input1 = Int(readLine()!)!
let base = String(input1, radix: 2)
let size = 10
let padd = String(repeating: Character("0"), count:(size - base.count))

print(padd+base)