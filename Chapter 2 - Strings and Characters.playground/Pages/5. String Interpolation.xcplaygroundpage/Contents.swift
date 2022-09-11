import Foundation

// 5. String Interpolation (문자열 삽입)
let subject = """
String interpolation is a way to construct a new String value
from a mix of constants, variables, literals, and expressions
by including their values inside a string literal.

"""
print(subject)

let three = 3
print("\(three) times 2.5 is \(Double(three) * 2.5)")

print("\nAlso you can string interpolation in the 'multiline string'.")
let multilineString = """

     \(three)
x    2.5
---------
     \(Double(three) * 2.5)

"""
print(multilineString)

print("The 'string interpolation' in the 'extended string delimiters'.")
print(#"\(three) times 2.5 is \(Double(three) * 2.5)"#)     // Ignored
print(#"\#(three) times 2.5 is \#(Double(three) * 2.5)"#)   // Works well
