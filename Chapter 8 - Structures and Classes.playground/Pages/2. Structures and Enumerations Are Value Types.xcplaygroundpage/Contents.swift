import Foundation

// 1. Structures
struct Resolution {
    var width = 0
    var height = 0
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixel wide")
// Prints "cinema is now 2048 pixels wide"

print("hd is still \(hd.width) pixel wide")
// Prints "hd is still 1920 pixels wide"


print("---------------------------------------")
// 2. Enumerations

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection

//currentDirection = .south
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
// Prints "The current direction is north"

print("The remembered direction is \(rememberedDirection)")
// Prints "The remembered direction is west"
