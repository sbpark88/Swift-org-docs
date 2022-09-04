import Foundation

// 5. Ternary Conditional Operator (삼항 조건 연산자)
print("The ternary conditional operator(question ? answer1 : answer2) is shorthand for the code if-else.")
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print("contentHeight: \(contentHeight), hasHeader: \(hasHeader)")
print("contentHeight + (hasHeader ? 50 : 20)    >> contentHeight is \(rowHeight)")
