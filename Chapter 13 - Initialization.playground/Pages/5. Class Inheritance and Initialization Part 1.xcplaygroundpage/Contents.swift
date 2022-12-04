import Foundation

// 1. Designated Initializers and Convenience Initializers


print("-------------------------------------")
// 2. Syntax for Designated and Convenicenc Initializers


print("-------------------------------------")
// 3. Initializer Delegation for Class Types


print("-------------------------------------")
// 4. Two-Phase Initialization


print("-------------------------------------")
// 5. Initializer Inheritance and Overriding
// Base Class
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        "\(numberOfWheels) wheels(s)"
    }
}

var vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")    // Vehicle: 0 wheels(s)


// Subclass
class Bicycle: Vehicle {
    var hasBasket = false
    override init() {
        super.init()
        numberOfWheels = 2
    }
}


//class Bicycle: Vehicle {
//    var hasBasket: Bool
//    override init() {
//        hasBasket = false
//        super.init()
//        numberOfWheels = 2
//    }
//}


// Omit super
//class Hoverboard: Vehicle {
//    var color: String
//    init(color: String) {
//        self.color = color
////        super.init() implicitly called here
//    }
//    override var description: String {
//        "\(super.description) in a beautiful \(color)"
//    }
//}
//
//let hoverboard = Hoverboard(color: "silver")
//print("Hoverboard: \(hoverboard.description)")  // Hoverboard: 0 wheels(s) in a beautiful silver


print("-------------------------------------")
// 6. Automatic Initializer Inheritance
class Hoverboard: Vehicle {
    var color = "Gray"
    override var description: String {
        "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard()
print("Hoverboard: \(hoverboard.description)")  // Hoverboard: 0 wheels(s) in a beautiful silver
