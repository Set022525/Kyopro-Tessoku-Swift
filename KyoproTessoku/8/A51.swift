let queryLength = Int(readLine()!)!

var queryType = [Int](repeating: 0, count: 100009)
var bookTitles = [String](repeating: "", count: 100009)
var outputStack: [String] = []

//input
for i in 0 ..< queryLength {
    let input = readLine()!.split(separator: " ") // ["1", "title"]

    let inputQueryType = Int(input[0])!
    queryType[i] = inputQueryType

    if inputQueryType == 1 {
        let inputBookTitle = String(input[1])
        bookTitles[i] = inputBookTitle
    }
}

//output
for i in 0 ..< queryLength {
    if queryType[i] == 1 {
        outputStack.append(bookTitles[i])
    }
    if queryType[i] == 2 {
        print(outputStack.last!)
    }
    if queryType[i] == 3 {
        outputStack.removeLast()
    }
}

//c++で書かれた解答例に寄せてしまったので not swifty...
//inputの部分はguradとか上手く使って綺麗にしたい