import Foundation

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
print("Type of directionToHead is '\(type(of: directionToHead))'")
print("directionToHead is '\(directionToHead)'")  // directionToHead is west

directionToHead = .east
print("directionToHead is '\(directionToHead)'")  // directionToHead is east

var anotherDirectionToHead: CompassPoint
anotherDirectionToHead = .south
print("anotherDirectionToHead is '\(anotherDirectionToHead)'")    // anotherDirectionToHead is south
