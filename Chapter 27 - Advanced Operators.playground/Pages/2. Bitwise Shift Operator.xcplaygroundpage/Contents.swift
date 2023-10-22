import Foundation

// 5. Bitwise Left and Right Shift Operator `<<` `>>`

// Shifting Behavior for Unsigned Integers
// UInt8
let shiftBits: UInt8 = 4
printToBinary(number: shiftBits)        // 00000100
printToBinary(number: shiftBits << 1)   // 00001000
printToBinary(number: shiftBits << 2)   // 00010000
printToBinary(number: shiftBits << 5)   // 10000000
printToBinary(number: shiftBits << 6)   // 00000000
printToBinary(number: shiftBits >> 2)   // 00000001

// UInt32
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153


func printToBinary(number: UInt8) {
    print(toBinary(number))

    func toBinary(_ number: UInt8) -> String {
        let binary = String(number, radix: 2)
        if binary.count < number.bitWidth {
            return String(repeating: "0", count: 8 - binary.count) + binary
        } else {
            return binary
        }
    }
}
