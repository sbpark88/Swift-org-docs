import Foundation

var potentialOverflow = Int16.max   // 32,767
// potentialOverflow += 1  //  error, Swift runtime failure: arithmetic overflow

print(potentialOverflow &+ 1)   // -32768
print(potentialOverflow &+ 2)   // -32767
print(potentialOverflow &+ 3)   // -32766

print(potentialOverflow &- 1)   // 32766

print(potentialOverflow &* 2)   // -2


// 1. Value Overflow for Unsigned Integers to Positive Direction
var unsignedOverflow = UInt8.max
printToBinary(number: unsignedOverflow)
unsignedOverflow = unsignedOverflow &+ 1
printToBinary(number: unsignedOverflow)


// 2. Value Overflow for Unsigned Integers to Negative Direction
var anotherUnsignedOverflow = UInt8.min
printToBinary(number: anotherUnsignedOverflow)
anotherUnsignedOverflow = anotherUnsignedOverflow &- 1
printToBinary(number: anotherUnsignedOverflow)


// 3. Value Overflow for Signed Integers to Negative Direction
var signedOverflow = Int8.min
printToBinary(number: signedOverflow)
signedOverflow = signedOverflow &- 1
printToBinary(number: signedOverflow)


func printToBinary<T: BinaryInteger>(number: T) {
    print("Binary: \(toBinary(number)), Decimal: \(number)")

    func toBinary(_ number: T) -> String {
        let absoluteNumber = abs(Int(number))
        let binary = String(absoluteNumber, radix: 2)
        if binary.count < 8 {
            return String(repeating: "0", count: 8 - binary.count) + binary
        } else {
            return binary
        }
    }
}

