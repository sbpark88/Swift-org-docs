import Foundation

struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        items.removeLast()
    }
}

extension Stack {
    var topItem: Element? {
        items.last
    }
}

var stringStack = Stack<String>()
stringStack.push("uno")
stringStack.push("dos")
stringStack.push("tres")
stringStack.push("cuatro")
print(stringStack)          // Stack<String>(items: ["uno", "dos", "tres", "cuatro"])

if let topItem = stringStack.topItem {
    print(topItem)          // cuatro
}
print(stringStack)          // Stack<String>(items: ["uno", "dos", "tres", "cuatro"])
