import Foundation

protocol IntContainer {
    mutating func append(_ item: Int)
    var count: Int { get }
    subscript(i: Int) -> Int { get }
}

protocol StringContainer {
    mutating func append(_ item: String)
    var count: Int { get }
    subscript(i: Int) -> String { get }
}

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//struct IntStack {
//    var items: [Int] = []
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        items.removeLast()
//    }
//}

struct IntStack: Container {
    // original IntStack implementation
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        items.removeLast()
    }

    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        items.count
    }
    subscript(i: Int) -> Int {
        items[i]
    }
}

//struct Stack<Element> {
//    var items: [Element] = []
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        items.removeLast()
//    }
//}

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        items.removeLast()
    }

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


var intStack = Stack(items: [3, 2, 5])
intStack.push(8)
print(intStack)         // Stack<Int>(items: [3, 2, 5, 8])

intStack.append(7)
print(intStack)         // Stack<Int>(items: [3, 2, 5, 8, 7])

print(intStack.count)   // 5
print(intStack[3])      // 8


var stringStack = Stack<String>()
stringStack.push("uno")
stringStack.append("dos")
stringStack.push("tres")
stringStack.append("cuatro")

print(stringStack)      // Stack<String>(items: ["uno", "dos", "tres", "cuatro"])
print(stringStack[1])   // dos
