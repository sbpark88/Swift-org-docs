import Foundation

// 1. Append or Remove elements in an Array
// Bad Case
//var foo = [1, 4, 6, 9, 13]
//foo.append(15)
//print(foo)  // [1, 4, 6, 9, 13, 15]

// Good Case
var foo = [1, 4, 6, 9, 13]
var bar = foo + [15]
print(foo)  // [1, 4, 6, 9, 13]
print(bar)  // [1, 4, 6, 9, 13, 15]

print("---------------------------------------")

// 2. Sorting
// Bad Case
//var foo2 = [6, 2, 13, 1, 7, 15]
//foo2.sort(by: >)
//print(foo2)  // [15, 13, 7, 6, 2, 1]

// Good Case
var foo2 = [6, 2, 13, 1, 7, 15]
var bar2 = foo2.sorted(by: >)
print(foo2)  // [6, 2, 13, 1, 7, 15]
print(bar2)  // [15, 13, 7, 6, 2, 1]
