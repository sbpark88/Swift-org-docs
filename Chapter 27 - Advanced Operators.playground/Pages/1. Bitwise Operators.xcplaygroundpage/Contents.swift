import Foundation

// 1. Bitwise NOT Operator `~`
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
printToBinary(number: invertedBits) // 11110000


// 2. Bitwise AND Operator `&`
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
printToBinary(number: middleFourBits)   // 00111100


// 3. Bitwise OR Operator `|`
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits
printToBinary(number: combinedBits) // 11111110


// 4. Bitwise XOR Operator `^`
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits
printToBinary(number: outputBits)   // 00010001


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
