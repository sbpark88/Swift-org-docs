import Foundation

// 1. Syntax
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


print("---------------------------------------")
// 2. Implicitly Assigned Raw Values
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

print(Planet.mercury.rawValue)  // 1
print(Planet.venus.rawValue)    // 2
print(Planet.neptune.rawValue)  // 8


enum CompassPoint: String {
    case east, west, south, north
}

print(CompassPoint.east)            // east
print(CompassPoint.east.rawValue)   // east

print(type(of: CompassPoint.east))          // CompassPoint
print(type(of: CompassPoint.east.rawValue)) // String


print("---------------------------------------")
// 3. Initializing from a Raw Value
//let possiblePlanet = Planet.uranus
//print(possiblePlanet)   // uranus

let possiblePlanet = Planet(rawValue: 7)
print(type(of: possiblePlanet))     // Optional<Planet>
print(possiblePlanet as Any)        // Optional(__lldb_expr_41.Planet.uranus)
print(possiblePlanet!)              // uranus

let impossiblePlanet = Planet(rawValue: 9)
print(type(of: impossiblePlanet))   // Optional<Planet>
print(impossiblePlanet as Any)      // nil

print("---------------------------------------")
var positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth: print("Mostly harmless")
    default: print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


let isThisSafePlanet = { (planetNumber: Int) -> Bool in
    guard let somePlanet = Planet(rawValue: planetNumber) else {
        print("There isn't a planet at position \(planetNumber)")
        return false
    }
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
        return true
    default:
        print("Not a safe place for humans")
        return false
    }
    
}

let safe = isThisSafePlanet(positionToFind)
print("safe: \(safe)")
