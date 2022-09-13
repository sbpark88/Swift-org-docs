import Foundation

// 8. Accessing and Modifying a String (문자열 접근과 수정)
print("You access and modify a string through its methods and properties, or by using subscript syntax.")

// String Indices (문자열 인덱스)
print("\n# 8.1 String Indices")
let greeting = "Guten Tag!"
print("greeting.startIndex:                                   \(greeting.startIndex)")                                  // Index of "G", Index(_rawBits: 1)
print("greeting.index(after: greeting.startIndex):            \(greeting.index(after: greeting.startIndex))")           // Index of "u", Index(_rawBits: 65793)
print("greeting.index(before: greeting.endIndex):             \(greeting.index(before: greeting.endIndex))")            // Index of "!", Index(_rawBits: 590081)
print("greeting.endIndex:                                     \(greeting.endIndex)")                                    //
print("-------------------------------- Let's print them --------------------------------")
print("greeting[greeting.startIndex]:                         \(greeting[greeting.startIndex])")                        // Index of "G", Index(_rawBits: 1)
print("greeting[greeting.index(after: greeting.startIndex)]:  \(greeting[greeting.index(after: greeting.startIndex)])") // Index of "u", Index(_rawBits: 65793)
print("greeting[greeting.index(before: greeting.endIndex)]:   \(greeting[greeting.index(before: greeting.endIndex)])")  // Index of "!", Index(_rawBits: 590081)
print("greeting[greeting.endIndex]:                           Fatal error: String index is out of bounds")

let aboutEndIndex = """

# Why the endIndex do not represent the last index actually?
>> A string’s “past the end” position—that is, the position one greater than the last valid subscript argument.
- startIndex is the index of the first character.
- endIndex is the index of the after the last character.

Ref: https://developer.apple.com/documentation/swift/string/endindex
     https://stackoverflow.com/questions/39676939/how-does-string-index-work-in-swift

"""
print(aboutEndIndex)


print("greeting.index(greeting.startIndex, offsetBy: 0): \(greeting.index(greeting.startIndex, offsetBy: 0))")    // Index of "G",  Index(_rawBits: 1)
print("greeting.index(greeting.startIndex, offsetBy: 1): \(greeting.index(greeting.startIndex, offsetBy: 1))")    // Index of "u",  Index(_rawBits: 65793)
print("greeting.index(greeting.startIndex, offsetBy: 2): \(greeting.index(greeting.startIndex, offsetBy: 2))")    // Index of "t",  Index(_rawBits: 131329)
print("greeting.index(greeting.startIndex, offsetBy: 3): \(greeting.index(greeting.startIndex, offsetBy: 3))")    // Index of "e",  Index(_rawBits: 196865)
print("greeting.index(greeting.startIndex, offsetBy: 4): \(greeting.index(greeting.startIndex, offsetBy: 4))")    // Index of "n",  Index(_rawBits: 262401)
print("greeting.index(greeting.startIndex, offsetBy: 5): \(greeting.index(greeting.startIndex, offsetBy: 5))")    // Index of " ",  Index(_rawBits: 327937)
print("greeting.index(greeting.startIndex, offsetBy: 6): \(greeting.index(greeting.startIndex, offsetBy: 6))")    // Index of "T",  Index(_rawBits: 393473)
print("greeting.index(greeting.startIndex, offsetBy: 7): \(greeting.index(greeting.startIndex, offsetBy: 7))")    // Index of "a",  Index(_rawBits: 459009)
print("greeting.index(greeting.startIndex, offsetBy: 8): \(greeting.index(greeting.startIndex, offsetBy: 8))")    // Index of "g",  Index(_rawBits: 524545)
print("greeting.index(greeting.startIndex, offsetBy: 9): \(greeting.index(greeting.startIndex, offsetBy: 9))")    // Index of "!",  Index(_rawBits: 590081)
print("greeting.index(greeting.startIndex, offsetBy: 10): \(greeting.index(greeting.startIndex, offsetBy: 10))")  // Out of bounds, Index(_rawBits: 655361)

print("\nFor each of the indices, not include endIndex(out of bounds).")
for index in greeting.indices {
    //    print(index)  // only offsetBy 0~9, not include 10(Index(_rawBits: 655361))
    print("\(greeting[index]) ", terminator: "")
}

print("\nAlso, we can use this endIndex on the 'one-sided ranges' like this.")
let range = ..<greeting.endIndex
print(greeting[range])

// Inserting and Removing (문자열 삽입과 삭제)
print("\n# 8.2 Inserting and Removing")
var welcome = "hello"
// insert a single character
welcome.insert("!", at: welcome.endIndex)
print(welcome)

// insert the contents of anoter string
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
print(welcome)

// remove a single character
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)

// remove a substring at a specified range
let removeRange = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex  // hello there
welcome.removeSubrange(removeRange)
print(welcome)
