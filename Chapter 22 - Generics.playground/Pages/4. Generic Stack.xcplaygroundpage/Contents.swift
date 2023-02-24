import Foundation

//struct Stack<E> {
//    var items: [E] = []
//    mutating func push(_ item: E) {
//        items.append(item)
//    }
//    mutating func pop() -> E {
//        items.removeLast()
//    }
//}

struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        items.removeLast()
    }
}

var intStack = Stack(items: [3, 2, 5])
print(intStack)             // Stack<Int>(items: [3, 2, 5])

intStack.push(8)
print(intStack)             // Stack<Int>(items: [3, 2, 5, 8])

intStack.pop()
print(intStack)             // Stack<Int>(items: [3, 2, 5])


var stringStack = Stack<String>()
stringStack.push("uno")
stringStack.push("dos")
stringStack.push("tres")
stringStack.push("cuatro")
print(stringStack)          // Stack<String>(items: ["uno", "dos", "tres", "cuatro"])

print(stringStack.pop())    // cuatro
print(stringStack)          // Stack<String>(items: ["uno", "dos", "tres"])
