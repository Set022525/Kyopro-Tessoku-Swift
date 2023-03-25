let queryLength = Int(readLine()!)!

var queryType = [Int](repeating: 0, count: 100009)
var name = [String](repeating: "", count: 100009)
var outputQueue: [String] = []

//input
for i in 0 ..< queryLength {
    let input = readLine()!.split(separator: " ") // ["1", "name"]

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
        outputQueue.append(name[i])
    }
    if queryType[i] == 2 {
        print(outputQueue.first!)
    }
    if queryType[i] == 3 {
        outputQueue.removeFirst()
    }
}