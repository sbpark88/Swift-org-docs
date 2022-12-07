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
// 3. Implement computed properties with private stored properties - Success
//class Vehicle {
//    var tag = "Vehicle"
//}
//
//class Bicycle: Vehicle {
//    private var _tag = "Bicycle"
//    override var tag: String {
//        get { _tag }
//        set { _tag = newValue }
//    }
//}
//
//class Tandem: Bicycle {
//    private var _tag = "Tandem"
//    override var tag: String {
//        get { _tag }
//        set { _tag = newValue }
//    }
//}
//
//var vehicle = Vehicle()
//var bicycle = Bicycle()
//var tandem = Tandem()
//print(vehicle.tag)  // Vehicle
//print(bicycle.tag)  // Bicycle
//print(tandem.tag)   // Tandem


print("-----------------------------------")
// 4. Use Phase 2 of Initialization
class Vehicle {
    var tag = "Vehicle"
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        tag = "Bicycle"
    }
}

class Tandem: Bicycle {
    convenience init(tag: String) {
        self.init()
        self.tag = tag
    }
}


var vehicle = Vehicle()
var bicycle = Bicycle()
var tandem = Tandem(tag: "Tandem")
print(vehicle.tag)  // Vehicle
print(bicycle.tag)  // Bicycle
print(tandem.tag)   // Tandem
