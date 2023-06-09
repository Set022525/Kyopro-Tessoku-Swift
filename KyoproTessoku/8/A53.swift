let queryLength = Int(readLine()!)!

var queryType = [Int](repeating: 0, count: 100009)
var price = [Int](repeating: -1, count: 100009)
var outputPriorityQueue = PriorityQueue<Int>{ $0 < $1 }

//input
for i in 0 ..< queryLength {
    let input = readLine()!.split(separator: " ") // ["1", "price"]

    let inputQueryType = Int(input[0])!
    queryType[i] = inputQueryType

    if inputQueryType == 1 {
        let inputPrice = Int(input[1])!
        price[i] = inputPrice
    }
}

//output
for i in 0 ..< queryLength {
    if queryType[i] == 1 {
        outputPriorityQueue.append(price[i])
    }
    if queryType[i] == 2 {
        print(outputPriorityQueue.first!)
    }
    if queryType[i] == 3 {
        outputPriorityQueue.popFirst()!
    }
}

//swiftには標準ライブラリにpriorityQueueがないらしいので，koherさんのhttps://github.com/koher/swift-atcoder-support/blob/main/Sources/AtCoderSupport/PriorityQueue.swift を使用
struct PriorityQueue<Element> {
    private var elements: [Element] = []
    private let areInIncreasingOrder: (Element, Element) -> Bool
    
    init<S>(_ elements: S, by areInIncreasingOrder: @escaping (Element, Element) -> Bool) where S: Sequence, S.Element == Element {
        self.areInIncreasingOrder = areInIncreasingOrder
        for element in elements {
            append(element)
        }
    }
    
    init(by areInIncreasingOrder: @escaping (Element, Element) -> Bool) {
        self.init(EmptyCollection(), by: areInIncreasingOrder)
    }
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    var first: Element? { elements.first }
    
    mutating func append(_ element: Element) {
        var i = elements.count
        elements.append(element)
        elements.withUnsafeMutableBufferPointer { elements in
            while i > 0 {
                let parentIndex = (i - 1) >> 1
                let parent = elements[parentIndex]
                guard areInIncreasingOrder(element, parent) else { break }
                elements[parentIndex] = element
                elements[i] = parent
                i = parentIndex
            }
        }
    }
    
    mutating func popFirst() -> Element? {
        guard let element = elements.popLast() else { return nil }
        guard let first = elements.first else { return element }
        
        elements.withUnsafeMutableBufferPointer { elements in
            elements[0] = element
            
            var  i = 0
            while true {
                var childIndex: Int = (i << 1) + 1
                guard childIndex < elements.count else { break }
                var child: Element = elements[childIndex]
                let rightIndex = childIndex + 1
                if rightIndex < elements.count {
                    let right = elements[rightIndex]
                    if areInIncreasingOrder(right, child) {
                        childIndex = rightIndex
                        child = right
                    }
                }
                if areInIncreasingOrder(element, child) { break }
                elements[childIndex] = element
                elements[i] = child
                i = childIndex
            }
        }

        return first
    }
}
extension PriorityQueue where Element: Comparable {
    init<S>(_ elements: S) where S: Sequence, S.Element == Element {
        self.init(elements, by: <)
    }
    
    init() {
        self.init(by: <)
    }
    
}