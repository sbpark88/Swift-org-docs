import Foundation

// 7. Range Operators (범위 연산자)
// Closed Range Operator (닫힌 범위 연산자)
print("# 1. Closed Range Operator")
print("The closed range operator(a...b) defines a range that runs from a to b, and includes the values a and b.")
// The value of a must not be greater than b, and this operator is useful when iterating like for-in loop.
print("for index in 1...5 { }")
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// Half-Open Range Operator (반 닫힌 범위 연산자)
print("\n# 2. Half-Open Range Operator")
print("The half-open range operator(a..<b) defines a range that runs from a to b, but doesn't include b.")
// Half-open ranges are particularly useful when iterating zero-based lists such as arrays.
let names = ["Anna", "Alex", "Brian", "Jack"]
print("names array is \(names)")
let count = names.count
print("for i in 0..<count { }")
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

// One-Sided Ranges (단방향 범위)
print("\n# 3. One-sided Ranges")
print("The one-sided range operator([a..] or [..a]) continue as far as possible in one direction.")
print("for name in names[2...] { }    >> flow 2 ~ 3(end of range upper side)")
for name in names[2...] {
    print(name)
}
// Brian
// Jack

print("\nfor name in names[...2] { }    >> flow 0(end of range lower side) ~ 2")
for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
