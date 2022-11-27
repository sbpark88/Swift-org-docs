import Foundation

// 1. Syntax
struct SomeStructure {
    static var someTypeProperty = "Initiate Value"
    static var computedTypeProoperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var someTypeProperty = "Initiate Value"
    static var computedTypeProoperty: Int {
        return 6
    }
}

class SomeClass {
    static var someTypeProperty = "Initiate Value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// 2. Difference between `Stored Type Properties` and `Stored Properties`
struct AnotherStructure {
    static var storedTypeProperty = "Apple"
    var storedProperty = "Pear"
    
    static var computedTypeProperty: Int { 1 }
    var computedProperty: Int { 10 }
}

// Type Properties
print(AnotherStructure.storedTypeProperty)   // Apple
print(AnotherStructure.computedTypeProperty) // 1

AnotherStructure.storedTypeProperty = "Melon"
print(AnotherStructure.storedTypeProperty)   // Melon


// Instance Properties
var anotherStructure = AnotherStructure()
print(anotherStructure.storedProperty)       // Pear
print(anotherStructure.computedProperty)     // 10

anotherStructure.storedProperty = "Watermelon"
print(anotherStructure.storedProperty)       // Watermelon

var theOtherStructure = AnotherStructure()
print(theOtherStructure.storedProperty)      // Pear

print(AnotherStructure.storedTypeProperty)   // Melon


print("--------------------------------------")
// 2. AudioChannel Examples
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)     // 7
print(AudioChannel.maxInputLevelForAllChannels) // 7

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)    // 10
print(AudioChannel.maxInputLevelForAllChannels) // 10
