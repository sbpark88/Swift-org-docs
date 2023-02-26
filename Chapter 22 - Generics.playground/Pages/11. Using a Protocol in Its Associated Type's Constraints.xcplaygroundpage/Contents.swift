import Foundation

protocol Container {
    associatedtype Item: Equatable
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
    
    // conformance to the Equatable protocol
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

var someStack = Stack<Int>()
someStack.push(3)
someStack.append(5)
someStack.push(7)
someStack.append(9)

print(someStack.suffix(2))  // Stack<Int>(items: [7, 9])
print(someStack.last())     // 9
