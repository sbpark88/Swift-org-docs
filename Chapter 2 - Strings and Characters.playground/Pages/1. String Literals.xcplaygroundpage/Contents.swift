import Foundation

/*
# Swift Strings and Characters

Swift’s String type is bridged with Foundation’s NSString class.
Foundation also extends String to expose methods defined by NSString.
This means, if you import Foundation, you can access those NSString methods on String without casting.

For more information about using String with Foundation and Cocoa, see Bridging Between String and NSString.
[Structure String Full Documentation](https://developer.apple.com/documentation/swift/string#2919514)
*/

// 1. String Literals ("Some string...")(문자열 리터럴)
// If you need a string that spans several lines, use a multiline string literal—a sequence of characters surrounded by three double quotation marks.
let someString = "Some string literal value"
print("someString: \(someString)")

// 2. Multiline String Literals (""" Multiline string... """)(여러줄 문자열 리터럴)
// If you need a string that spans several lines, use a multiline string literal—a sequence of characters surrounded by three double quotation marks:
print("\n# 2. Multiline String Literals")
print("This literals see the line break as string value also, so you do not have to type '\\n' to change lines!!")

var quotation = """
> The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

// ------------------------------------------------------------------------------------------------

print("\n# 2.2 How do you prevent new lines?")
print("If you do not want to change lines, you can do it just type '\\'.")
quotation = """
> The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.
"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(quotation)

// ------------------------------------------------------------------------------------------------

let indent = """

# 2.3 String indent
Multiline String Literals can be indented by indenting closing quotation marks.
Spaces before the closing quote are ignored,
however, other srings come before this quote not empty spaces, it will make error!!

"""
print(indent)

quotation = """
      The White Rabbit put on his spectacles.
        "Where shall I begin, please your Majesty?" he asked.
      "Begin at the beginning," the King said gravely, "and go on \
      till you come to the end; then stop."
      """
print(quotation)


// Special Characters in String Literals (문자열 리터럴의 특수 문자)
print("\n# 3. Special Characters in String Literals")
// The escaped special characters (\0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), etc...).
print("# 3.1 The escaped special characters")
let specialCharacters = "To me:\nLive as if you were to \"die\" tomorrow."
print("'To me:\\nLive as if you were to \\\"die\\\" tomorrow.' is printed like this:" )
print(specialCharacters)

// An arbitrary Unicode scalar value, written as '\u{n}' where n is a 1–8 digit hexadecimal number.
print("\n# 3.2 An arbitrary Unicode scalar value")
let sparklingHeart = "\u{1F496}"  // 💖, Unicode scalar U+1F496
print("Unicode scalar \\u{1F496}: \(sparklingHeart)")

// Extended String Delimiters (확장된 문자열 구획 문자)
// If you surround the string literals within equal count '#', 'Special Characters' are ginored.
print(#"Line 1\nLine 2"#)
print(##"Line 1\nLine 2"##)
print(###"Line 1\nLine 2"###)

// Then, if you need 'Special Characters' in the 'Extended String Delimiters',
// it is possible by input the same count '#' sign after '\' sign.
print(#"Line 1\#nLine 2"#)
print(##"Line 1\##nLine 2"##)
print(###"Line 1\###nLine 2"###)

