import Foundation

enum CompassPoint {
    case east, west, south, north
}

var directionToHead: CompassPoint

// 1. You can match individual enumeration values with a switch statement

directionToHead = .south
switch directionToHead {
case .south:
    print("Watch out for penguins")
default:
    print("This direction is not south")
}
