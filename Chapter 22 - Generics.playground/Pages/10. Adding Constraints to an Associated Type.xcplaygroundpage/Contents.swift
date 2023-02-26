import Foundation

//var arrayA = [1, 5, 6]
//var arrayB = [1, 5, 6]
//
//print(arrayA == arrayB) // true
//
//var arrayC = ["A", "B", "C"]
//var arrayD = ["A", "C", "B"]
//
//print(arrayC == arrayD) // false
//
//
//struct Some<Element: Equatable>: Equatable {
//    var items: [Element] = []
//
//    static func == (lhs: Some<Element>, rhs: Some<Element>) -> Bool {
//        lhs.items == rhs.items
//    }
//}
//
//var structureA = Some(items: [1, 5, 6])
//var structureB = Some(items: [1, 5, 6])
//
//print(structureA == structureB) // true
//
//var structureC = Some(items: ["A", "B", "C"])
//var structureD = Some(items: ["A", "C", "B"])
//
//print(structureC == structureD) // false


protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//struct Stack<Element: Equatable>: Container {
//    // original Stack<Element> implementation
//    var items: [Element] = []
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        items.removeLast()
//    }
//
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

var someStack = Stack(items: [3, 2, 5])
var anotherStack = Stack(items: [3, 2, 5])

print(someStack == anotherStack)
