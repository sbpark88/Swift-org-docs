import Foundation

// 4. Concatenating String and Characters (문자열과 문자의 결합)
print("# 4.1 String + String")
var string1 = "hello"
var string2 = " there"
print("string1 + string2 = \(string1 + string2)")  // welcome now equals "hello there"

print("\nString + Character can be string.append() method, not addition operator(+)")
let exclamationMark: Character = "!"
print("string1.append(exclamationMark) = \(string1.append(exclamationMark))")

print("\nConcatenating of The Multiline String Literals")
let badStart = """
one
two
"""

let end = """
three
"""

print("badStart + end >> \n\(badStart + end)")

print("\nInsert empty line in the last for the string literals including a 'line break'.")
let goodStart = """
one
two

"""

print("goodStart + end >> \n\(goodStart + end)")
