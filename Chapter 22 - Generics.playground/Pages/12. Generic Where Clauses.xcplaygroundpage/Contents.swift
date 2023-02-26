import Foundation

// Case 1
//protocol Container {
//    associatedtype Item: Equatable
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}
//
//protocol SuffixableContainer: Container {
//    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
//    func suffix(_ size: Int) -> Suffix
//    func last() -> Suffix.Item
//}
//
//struct Stack<Element: Equatable> {
//    // original Stack<Element> implementation
//    var items: [Element] = []
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        items.removeLast()
//    }
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
//
//    // conformance to the Equatable protocol
//    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
//        lhs.items == rhs.items
//    }
//}
//
//extension Stack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack<Element> {
//        var result = Stack()
//        for index in (count - size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//    func last() -> Element {
//        self[count - 1]
//    }
//    // Inferred that Suffix is Stack.
//}
//
//extension Array: Container where Element: Equatable  {}


// Case 2
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
    func last() -> Suffix.Item
}

struct Stack<Element: Equatable> {
    // original Stack<Element> implementation
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        items.removeLast()
    }
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




// ---

func allItemsMatch<C1: Container, C2: Container>(_ containerA: C1, _ containerB: C2) -> Bool
where C1.Item: Equatable, C1.Item == C2.Item
{
    // Check that both containers contain the same number of items.
    if containerA.count != containerB.count {
        return false
    }

    // Check each pair of items to see if they're euivalent.
    for i in 0..<containerA.count {
        if containerA[i] != containerB[i] {
            return false
        }
    }

    // All items match, so return true.
    return true
}

var someStack = Stack(items: [3, 2, 5])
var anotherStack = Stack(items: [3, 2, 5])
var someArray = [3, 2, 5]

print(someStack == anotherStack)            // true
//print(someStack == someArray)               // error: Cannot convert value of type 'Stack<Int>' to expected argument type '[Int]'

print(allItemsMatch(someStack, someArray))  // true
