import Foundation

// 3. Strings Are Value Types (값 타입 문자열)
print("Swift's 'String' type is a value type.")
/*
 If you create a new String value, that String value is copied
 when it’s passed to a function or method, or when it’s assigned to a constant or variable.
 
 In each case, a new copy of the existing String value is created,
 and the new copy is passed or assigned, not the original version.
 
 However, behind the scenes, Swift’s compiler optimizes string usage
 so that actual copying takes place only when absolutely necessary.
 This means you always get great performance when working with strings as value types.
 */
print("Therefore you trust 'String' is safe from mutation and performance issue. Just, use it!")


// Working with Characters (문자)
print("You can access the individual Character values for a String by iterating over the string with a for-in loop:\n")
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶

print("\nThis means you can create just one 'Character' value.")
let cCharacter: Character = "C"
var aCharacter: Character = "A"
print(cCharacter)   // Prints "C"

print("""

And 'String' values are can be constructed by passing
'an array of Character values' as an argument to its 'initializer'.

""")

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)    // Prints "Cat!🐱"
