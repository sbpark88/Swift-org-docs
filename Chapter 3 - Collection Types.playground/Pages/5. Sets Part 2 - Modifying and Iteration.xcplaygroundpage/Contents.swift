import Foundation

// 5. Sets (집합) Part 2 - Modifying and Iteration
// 1. Accessing and Modifying a Set (셋의 접근과 변경)
// 1.1 'insert(_:)' method add a new item into a set without duplication.
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
favoriteGenres.insert("Jazz")
print(favoriteGenres)   // ["Hip hop", "Classical", "Rock", "Jazz"]

favoriteGenres.insert("Jazz")
print(favoriteGenres)   // ["Hip hop", "Classical", "Rock", "Jazz"]
/*
 Set has still 4 elements because the Set is unique.
 */

// 1.2 'remove(_:)' method remove an equal element from an a set and return the Optional of that element(If the element is not a member of the set, return nil).
var removedElement = favoriteGenres.remove("Hip hop")
print(removedElement as Any)
print(favoriteGenres)

var returnNil = favoriteGenres.remove("Funk")
print(returnNil as Any)

// 1.3 'removeAll()' method or Empty Array '[ ]' make a set totaly empty set.

favoriteGenres.removeAll()
print(favoriteGenres)

// favoriteGenres = []
// print(favoriteGenres)

// Iterating Over a Set (셋의 순회)
let fruits: Set = [
    "Apple",
    "Pear",
    "Persimmon",
    "Tangerine",
    "Orange",
    "Mango",
    "Plum",
    "Cherry"
]

// 1. You can iterate over the values in a set with a 'for-in' loop.
print("Set fruits")
for item in fruits {
    print(item, terminator: "  ")
}
print("\nSet fruits2")
for item in fruits {
    print(item, terminator: "  ")
}
print("\nSet fruits3")
let fruits2: Set = [
    "Apple",
    "Pear",
    "Persimmon",
    "Tangerine",
    "Orange",
    "Mango",
    "Plum",
    "Cherry"
]

for item in fruits2 {
    print(item, terminator: "  ")
}


/*
 Set is the 'unordered collection'. Therefore, if you want to sort a direction, use 'sorted()' method.
 Set은 `Unordered Collection`이다. 따라서 특정 순서대로 정렬되길 원한다면 배열과 마찬가지로 `sorted()` 메서드를 이용한다.
 */
print("\n-------------------")

// default, ascending order
for item in fruits.sorted() {
    print(item, terminator: "  ")
}
print("\n-------------------")
// ascending order
for item in fruits.sorted(by: <) {
    print(item, terminator: "  ")
}
print("\n-------------------")
// descending order
for item in fruits.sorted(by: >) {
    print(item, terminator: "  ")
}
print("\n-------------------")
for (index, value) in fruits.sorted().enumerated() {
    print("Item \(index + 1): \(value)")
}
