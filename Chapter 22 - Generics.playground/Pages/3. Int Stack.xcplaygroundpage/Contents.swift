import Foundation

struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        items.removeLast()
    }
}

var intStack = IntStack(items: [3, 2, 5])
print(intStack) // IntStack(items: [3, 2, 5])

intStack.push(8)
print(intStack) // IntStack(items: [3, 2, 5, 8])

intStack.pop()
print(intStack) // IntStack(items: [3, 2, 5])

