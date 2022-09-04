import UIKit

// 8. Logical Operators (논리 연산자)
print("# 1. Logical NOT Operator(논리 부정 연산자), Logical AND Operator(논리 곱 연산자), Logical OR Operator(논리 합 연산자)")
print("Logical NOT(!a) operator inverts a Boolean value, !true is: \(!true)")
print("Logical AND(a && b) operator creates logical expressions where both values must be 'true' for the overall expression to also be 'true'.")
print("Logical OR(a || b) operator creates logical expressions in which only one of the two values has to be 'true' for the overall expression to be 'true'.\n")

// Combining Logical Operators (논리 연산자의 조합)
print("# 2. Combining Logical Operators")
print("You can combine multiple logical operators to create longer compounded expressions, it runs left to right comparing only two values.")
let (enteredDoorCode, passedRetinaScan, hasDoorKey, knowsOverridePassword) = (true, false, false, true)
print(" enteredDoorCode: \(enteredDoorCode)\n passedRetinaScan: \(passedRetinaScan)\n hasDoorKey: \(hasDoorKey)\n knowsOverridePassword: \(knowsOverridePassword)\n")

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword    >> Welcome!")
} else {
    print("enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword    >> ACCESS DENIED")
}
// Prints "Welcome!"

// Explicit Parentheses (명시적 괄호)
print("\n# 2.2 Explicit Parentheses")
print("Adding 'explicit parentheses' around the particular position, better readbility.")
print("(enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword    >> better expression!!")


print("\n################################# Advanced ################################")
// Short-Circuit Evaluation (단락 평가)
print("# 3. Short-Circuit Evaluation")
print("# 3.1 Short-circuit evaluation makes better code probabilistically.")

print("Case 1, '&&'    >> The higher probability on left side operand(피연산자) be false, the better!")
print("(10% true) && (70% true)    is better than    (70% true) && (10% true)\n")

print("Case 2, '||'    >> The higher probability on left side operand(피연산자) be true, the better!")
print("(70% true) || (10% true)    is better than    (10% true) || (70% true)\n")

print("# 3.2 Used to check nil and value at the same time.")
var cityName: String? = ""
// Ordinary way to check null and value most of languages.
print("cityName != nil && cityName! != \"Seoul\"")
if cityName != nil && cityName! != "Seoul" {
    print(cityName!)
}

// However, I think seperate unwrap and value check is more beautiful like this.
if let cityName = cityName {
    if cityName != "Seoul" {
        print(cityName)
    }
}

print("# 3.3 Used to set default value.")
var location: String?
// Ordinary way to set default value most of languages.
if location == nil || location! == "" {
    location = "California"
}
print(location!)
