import Foundation

// 2. Initializing an Empty String (빈 문자열 초기화)
// Both initializing are equal.
var emptyString = ""
var initializerSyntax = String()


// String Mutability (문자열 수정)
// If you assign the string to a variable, it can be modified.
var variableString = "Horse"
variableString += " and carriage"
print(variableString)

// While, if you assign it to a constant, it cannot be modified.
let constantString = "Highlander"
constantString += " and another Highlander" // error occured!
print(constantString)
