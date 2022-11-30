import Foundation

// 1. Origin
//class Vehicle {
//    var tag = "Vehicle"
//}
//
//class Bicycle: Vehicle {
//}
//
//class Tandem: Bicycle {
//}
//
//var vehicle = Vehicle()
//var bicycle = Bicycle()
//var tandem = Tandem()
//print(vehicle.tag)  // Vehicle
//print(bicycle.tag)  // Vehicle
//print(tandem.tag)   // Vehicle


print("-----------------------------------")
// 2. Overriding stored properties - Fail
//class Vehicle {
//    var tag = "Vehicle"
//}
//
//class Bicycle: Vehicle {
//    override var tag: String = "Bicycle"    // Cannot override with a stored property 'tag'
//}


print("-----------------------------------")
// 3. Set property value after initialization - Success
//class Vehicle {
//    var tag = "Vehicle"
//}
//
//class Bicycle: Vehicle {
//}
//
//class Tandem: Bicycle {
//}
//
//var vehicle = Vehicle()
//var bicycle = Bicycle()
//bicycle.tag = "Bicycle"
//var tandem = Tandem()
//tandem.tag = "Tandem"
//print(vehicle.tag)  // Vehicle
//print(bicycle.tag)  // Bicycle
//print(tandem.tag)   // Tandem


print("-----------------------------------")
// 4. Set property values at initialization - Fail
//class Vehicle {
//    var tag = "Vehicle"
//}
//
//class Bicycle: Vehicle {
//    override init() {
//        tag = "Bicicle" // 'self' used in property access 'tag' before 'super.init' call
//    }
//}


print("-----------------------------------")
// 5. Implement computed properties with private stored properties - Success
class Vehicle {
    var tag = "Vehicle"
}

class Bicycle: Vehicle {
    private var _tag = "Bicycle"
    override var tag: String {
        get { _tag }
        set { _tag = newValue }
    }
}

class Tandem: Bicycle {
    private var _tag = "Tandem"
    override var tag: String {
        get { _tag }
        set { _tag = newValue }
    }
}

var vehicle = Vehicle()
var bicycle = Bicycle()
var tandem = Tandem()
print(vehicle.tag)  // Vehicle
print(bicycle.tag)  // Bicycle
print(tandem.tag)   // Tandem
