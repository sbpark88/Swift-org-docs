import Foundation

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        count >= 1 && self[0] == item
    }
    
    func isTop(_ item: Item) -> Bool {
        count >= 1 && self[count - 1] == item
    }
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
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

extension Stack: Container {
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


var intStack = Stack(items: [3, 2, 5])
var doubleArray = [3.0, 2.0, 5.0]

print(intStack.average())       // 3.3333333333333335
print(doubleArray.average())    // 3.3333333333333335
