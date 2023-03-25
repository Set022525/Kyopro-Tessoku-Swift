let queryLength = Int(readLine()!)!

var queryType = [Int](repeating: 0, count: 100009)
var name = [String](repeating: "", count: 100009)
var outputStack: [String] = []

//input
for i in 0 ..< queryLength {
    let input = readLine()!.split(separator: " ") // ["1", "title"]

    let inputQueryType = Int(input[0])!
    queryType[i] = inputQueryType

    if inputQueryType == 1 {
        let inputName = String(input[1])
        name[i] = inputName
    }
}

//output
for i in 0 ..< queryLength {
    if queryType[i] == 1 {
        outputStack.append(name[i])
    }
    if queryType[i] == 2 {
        print(outputStack.first!)
    }
    if queryType[i] == 3 {
        outputStack.removeFirst()
    }
}