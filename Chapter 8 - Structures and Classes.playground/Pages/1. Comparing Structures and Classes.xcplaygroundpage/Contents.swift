import Foundation

// 1. Definition Syntax
struct SomeStructure {
    // structure definition goes here
}
class SomeClass {
    // class definition goes here
}


print("---------------------------------------")
// 2. Class and Structure Instances
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()


print("---------------------------------------")
// 3. Accessing Properties
// Get Properties
print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"


// drill down into subproperties
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"


// Set Properties
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"


// Set Properties of the Structures
//someResolution.width = 1600 // Cannot assign to property: 'someResolution' is a 'let' constant

var anotherResolution = Resolution()
anotherResolution.width = 1600
print("The width of anotherResolution is now \(anotherResolution.width)")
// Prints "The width of anotherResolution is now 1600"


print("---------------------------------------")
// 4. Memberwise Initializers for Structure Types
let resolutionTypeA = Resolution(width: 5120, height: 2880)
print(resolutionTypeA)  // Resolution(width: 5120, height: 2880)

let resolutionTypeB = Resolution(width: 2560)
print(resolutionTypeB)  // Resolution(width: 2560, height: 0)

let resolutionTypeC = Resolution(height: 1440)
print(resolutionTypeC)  // Resolution(width: 0, height: 1440)
