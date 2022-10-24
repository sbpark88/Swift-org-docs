import Foundation

// 1. The Sorted Method

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// ascending order(default)
func forward(_ s1: String, _ s2: String) -> Bool {
    s1 < s2
}
print("origin          : \(names)")
print("default         : \(names.sorted())")
print("ascending order : \(names.sorted(by: forward))")

// descending order
func backward(_ s1: String, _ s2: String) -> Bool {
    s1 > s2
}
print("descending order: \(names.sorted(by: backward))")


print("-------------------------------------------")
// 2. Closure Expression Syntax
// 위 정렬은 `Global Functions` 형태의 `Closures` 대신 `Closure Expressions` 형태의 `Closures`를 이용하면 더욱 간결한 표현이 가능하다.

let ascendingOrderNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 < s2 })
let descendingOrderNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
print("ascendingOrderNames : \(ascendingOrderNames)")
print("descendingOrderNames: \(descendingOrderNames)")


print("-------------------------------------------")
//3. Inferring Type From Context

print("ascending order : \(names.sorted(by: { s1, s2 in return s1 < s2 }))")
print("descending order: \(names.sorted(by: { s1, s2 in return s1 > s2 }))")


print("-------------------------------------------")
//4. Implicit Return from Single-Expression Closures

print("ascending order : \(names.sorted(by: { s1, s2 in s1 < s2 }))")
print("descending order: \(names.sorted(by: { s1, s2 in s1 > s2 }))")


print("-------------------------------------------")
//5. Shorthand Argument Names

print("ascending order : \(names.sorted(by: { $0 < $1 }))")
print("descending order: \(names.sorted(by: { $0 > $1 }))")


print("-------------------------------------------")
//6. Operator Methods

print("ascending order : \(names.sorted(by: <))")
print("descending order: \(names.sorted(by: >))")
