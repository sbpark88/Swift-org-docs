import Foundation

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        count >= 1 && self[0] == item
    }
    
    func isTop(_ item: Item) -> Bool {
        count >= 1 && self[count - 1] == item
    }
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
}

extension Container {
    func average() -> Double where Item == Int {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
}

//protocol SuffixableContainer: Container {
//    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
//    func suffix(_ size: Int) -> Suffix
//    func last() -> Suffix.Item
//}

protocol SuffixableContainer: Container where Suffix.Item == Item {
    associatedtype Suffix: SuffixableContainer
    func suffix(_ size: Int) -> Suffix
    func last() -> Suffix.Item
}

struct Stack<Element> {
    // original Stack<Element> implementation
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        items.removeLast()
    }
}

extension Stack where Element: Equatable {
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
        lhs.items == rhs.items
    }
}

extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack<Element> {
        var result = Stack()
        for index in (count - size)..<count {
            result.append(self[index])
        }
        return result
    }
    func last() -> Element {
        self[count - 1]
    }
    // Inferred that Suffix is Stack.
}

extension Array: Container {}

//func allItemsMatch<C1: Container, C2: Container>(_ containerA: C1, _ containerB: C2) -> Bool
//where C1.Item: Equatable, C1.Item == C2.Item
//{
//    // Check that both containers contain the same number of items.
//    if containerA.count != containerB.count {
//        return false
//    }
//
//    // Check each pair of items to see if they're euivalent.
//    for i in 0..<containerA.count {
//        if containerA[i] != containerB[i] {
//            return false
//        }
//    }
//
//    // All items match, so return true.
//    return true
//}




// ---

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}
//
//extension Stack: Container {
//    // conformance to the Container protocol
//    mutating func append(_ item: Element) {
//        self.push(item)
//    }
//    var count: Int {
//        items.count
//    }
//    subscript(i: Int) -> Element {
//        items[i]
//    }
//}

var someStack = Stack(items: [9, 2, 5, 7, 3, 4, 2])

//for element in someStack {  // error, For-in loop requires 'Stack<Int>' to conform to 'Sequence'
//    print(element)
//}

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//
//    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
//    func makeIterator() -> Iterator
//}

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

protocol IterableContainer: Container where Iterator.Element == Item {
    associatedtype Iterator: IteratorProtocol
    func makeIterator() -> Iterator
}

//extension Stack: Container {
//    // conformance to the Container protocol
//    mutating func append(_ item: Element) {
//        self.push(item)
//    }
//    var count: Int {
//        items.count
//    }
//    subscript(i: Int) -> Element {
//        items[i]
//    }
//}
//
//extension Stack: IterableContainer {
//    // conformance to the IterableContainer protocol
//    func makeIterator() -> IndexingIterator<[Element]> {
//        items.makeIterator()
//    }
//}

extension Stack: IterableContainer {
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        items.count
    }
    subscript(i: Int) -> Element {
        items[i]
    }

    // conformance to the IterableContainer protocol
    func makeIterator() -> IndexingIterator<[Element]> {
        items.makeIterator()
    }
}


var iteratorStack = someStack.makeIterator()
print(iteratorStack)    // IndexingIterator<Array<Int>>(_elements: [9, 2, 5, 7, 3, 4, 2], _position: 0)

print("")

for element in iteratorStack {
    print(element, terminator: ", ")    // 9, 2, 5, 7, 3, 4, 2,
}

print("")

while let element = iteratorStack.next() {
    print(element, terminator: ", ")    // 9, 2, 5, 7, 3, 4, 2,
}
