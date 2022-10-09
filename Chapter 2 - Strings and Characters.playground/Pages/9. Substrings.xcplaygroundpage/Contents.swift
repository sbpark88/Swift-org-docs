import Foundation

// 9. Substrings (부분 문자열)
/*
 Substrings in Swift have most of the same methods as strings,
 which means you can work with substrings the same way you work with strings.
 */

let greeting = "Hello, world!"
print("greeting: \(greeting)")
print("type of greeting is \(type(of: greeting))")

var index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
print("\nbeginning: \(beginning)")
print("type of beginning is \(type(of: beginning))")



print("--------------------------------------------------------")
var fullName = "Michale Jackson"
// Cannot assign to previous 'index' variable, because of the 'index' is 'String.index', but firstIndex return 'String.index?(Optional)'.
let optionalIndex = fullName.firstIndex(of: " ")
let afterIndex = fullName.index(after: optionalIndex!)
var firstName = fullName[..<optionalIndex!]
var lastName = fullName[afterIndex...]

print("\nFull name: \(fullName), type: \(type(of: fullName)), address: \(address(of: &fullName))")    // Full name: Michale Jackson, type: String,    address: 0x7f48c8d8a038
print("First name: \(firstName), type: \(type(of: firstName)), address: \(address(of: &firstName))")  // First name: Michale,        type: Substring, address: 0x7f48c8d8a060
print("Last name: \(lastName),  type: \(type(of: lastName)), address: \(address(of: &lastName))")     // Last name: Jackson,         type: Substring, address: 0x7f48c8d8a080

fullName = "Michale Jordan"
print("\nFull name: \(fullName), type: \(type(of: fullName)), address: \(address(of: &fullName))")    // Full name: Michale Jordan,  type: String,    address: 0x7f48c8d8a038
print("First name: \(firstName), type: \(type(of: firstName)), address: \(address(of: &firstName))")  // First name: Michale,        type: Substring, address: 0x7f48c8d8a060
print("Last name: \(lastName),  type: \(type(of: lastName)), address: \(address(of: &lastName))")     // Last name: Jackson,         type: Substring, address: 0x7f48c8d8a080

// I can still access the 'Substring of String before changed' despite 'String - fullName' already changed.
// This means that the old data 'String - fullName' still stored somewhere in memory.

lastName = fullName[afterIndex...]
print("\nLast name: \(lastName),  type: \(type(of: lastName)), address: \(address(of: &lastName))")   // Last name: Jordan,          type: Substring, address: 0x7f48c8d8a080


/*
 Summary
 
 1. Both 'String' and 'Substring' confirm to the 'StringProtocol' protocol, thus, we can call functions similly.
 2. The 'String' has a region of memory for own values.
 3. While, the 'Substring' does not have a region of memory, reuse the storage of the original string.
 Thus, it is not suitable for long life-cycle.
 4. In the above case, 'beginning' is a substring of 'greeting'.
 
 Advantage of 'Substring' - Optimiz'ation
 The 'Substring' reuse the memory of the original 'String', therefore, do not have to pay
 the performance cost of copying memory until you modify either the string or substring.
 
 Disadvantage of 'Substring' - Paradox of advantage
 Due to the above advantage, the entire original 'String' must be kept in memory as long as any of its 'Substring' are being used.
 Therefore, the 'Substring' must be converted to an instnace of 'String'.
 
 */

print("\n# 9.2 Getting substrings (https://stackoverflow.com/questions/39677330/how-does-string-substring-work-in-swift)")

var str = "Hello, playground"
print("str: \(str)")

print("\n# 9.2.1 Beginning of a string")
index = str.index(str.startIndex, offsetBy: 5)
// One-Sided Ranges
print("str[..<index] : \(str[..<index])") // Hello
// prefix
print("str.prefix(upTo: index) : \(str.prefix(upTo: index))") // Hello
// or even easier
print("str.prefix(5) : \(str.prefix(5))") // Hello


print("\n# 9.2.2 End of a string")
index = str.index(str.endIndex, offsetBy: -10)
// One-Sided Ranges
print("str[index...] : \(str[index...])") // playground
// suffix
print("str.suffix(from: index) : \(str.suffix(from: index))") // playground
// or even easier
print("str.suffix(10) : \(str.suffix(10))") // playground


print("\n# 9.2.3 Range in a string")
let start = str.index(str.startIndex, offsetBy: 7)
let end = str.index(str.endIndex, offsetBy: -6)
// Half-Open Range
print("str[start..<end] : \(str[start..<end])") // play

print("\n# 9.3 Converting 'Substring' to 'String")
let message = """
Don't forget, when you are ready to save your substring,
you should convert it to a String so that the old string's memory can be cleaned up.
"""
print(message)
let mySubstring = str[start..<end]
let myString = String(mySubstring)








func address(of object: UnsafeRawPointer) -> String {
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}
