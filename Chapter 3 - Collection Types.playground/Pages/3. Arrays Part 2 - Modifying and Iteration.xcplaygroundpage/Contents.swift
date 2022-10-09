import Foundation

// 3. Arrays (배열) Part 2 - Modifying and Iteration
// Accessing and Modifying an Array (배열의 접근 및 변환)
// 3.1. 'append(_:)' method add a new item to the end of an array.
var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList.append("Flour")
print(shoppingList)     // ["Eggs", "Milk", "Flour"]

// 3.2. Also '+' operator add a new item to the end of an array.
shoppingList += ["Butter"]
print(shoppingList)     // ["Eggs", "Milk", "Flour", "Butter"]

// 3.3. Retrieve a value or modify using 'Subscript Syntax'.
print(shoppingList[0])  // Eggs

shoppingList[0] = "Organic eggs"
print(shoppingList)     // ["Organic eggs", "Milk", "Flour", "Butter"]

shoppingList[1...3] = ["Organic milk", "Organic flour", "Premium butter"]
print(shoppingList)     // ["Organic eggs", "Organic milk", "Organic flour", "Premium butter"]

// 3.4. 'insert(_:at:)' method add a new item at the specific position of an array.
shoppingList.insert("Yeast", at: 2)
print(shoppingList)     // ["Organic eggs", "Organic milk", "Yeast", "Organic flour", "Premium butter"]

// 4.5. 'removeLast()' method remove the final item from an array and return that element.
var removedElement = shoppingList.removeLast()
print(removedElement)
print(shoppingList)

// 4.6. 'remove(at:)' method remove an item at the specific position from an array.
var secondElement = shoppingList.remove(at:1)
print(secondElement)
print(shoppingList)

// 4.7 'removeAll()' method or Empty Array '[ ]' make an array totaly empty array.
shoppingList.removeAll()
print(shoppingList)

// shoppingList = []
// print(shoppingList)


// Iterating Over an Array (배열의 순회)
let fruits = [
    "Apple",
    "Pear",
    "Persimmon",
    "Tangerine",
    "Orange",
    "Mango",
    "Plum",
    "Cherry"
]

// 1. You can iterate over the entire set of values in an array with the for-in loop.
for item in fruits {
    print(item, terminator: "  ")
}

print("-------------------")

// default, ascending order
for item in fruits.sorted() {
    print(item, terminator: "  ")
}
print("-------------------")
// ascending order
for item in fruits.sorted(by: <) {
    print(item, terminator: "  ")
}
print("-------------------")
// descending order
for item in fruits.sorted(by: >) {
    print(item, terminator: "  ")
}

print("-------------------")

// 2. 'enumerated()' method make you can access 'index' and 'value' using a 'tuple' variable.
for (index, value) in fruits.enumerated() {
    print("Item \(index + 1): \(value)")
}

