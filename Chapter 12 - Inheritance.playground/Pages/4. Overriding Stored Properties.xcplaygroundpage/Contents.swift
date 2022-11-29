import Foundation

// 1. Overriding
class Vehicle {
    var tag = "Vehicle"
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
    init() {
        tag = "Vehicle2"
    }
}

class Bicycle: Vehicle {
//    private var _tag = "Bicycle"
//    override var tag: String {
//        get { _tag }
//        set { _tag = newValue }
//    }
    var hasBasket = false
    
    func getSuperTag() -> String {
        super.tag
    }
    
    override init() {
        tag = "Bicycle"
    }
}

//class Tandem: Bicycle {
//    private var _tag = "Tandem"
//    override var tag: String {
//        get { _tag }
//        set { _tag = newValue }
//    }
//    var currentNumberOfPassengers = 0
//
//    override func getSuperTag() -> String {
//        super.tag
//    }
//}

var vehicle = Vehicle()
print("vehicle's class name is \(vehicle.tag).")

var bicycle = Bicycle()
print("bicycle's class name is \(bicycle.tag).")
//bicycle.tag = "new Bicycle"

//print("vehicle's class name is now \(vehicle.tag).")
//print("bicycle's class name is now \(bicycle.tag).")
//print("bicycle's superclass name is now \(bicycle.getSuperTag()).")

//var tandem = Tandem()
//print("tandem's class name is \(tandem.tag).")
//print("tandem's superclass name is now \(tandem.getSuperTag()).")

// 2. Accessing Superclass Methods, Properties, and Subscripts

// 3. Overriding Methods

// 4. Overriding Properties

// 5. Overriding Property Getters and Setters

// 6. Overriding Property Observers


