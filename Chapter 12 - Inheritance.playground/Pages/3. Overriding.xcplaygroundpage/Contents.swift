import Foundation

// 1. Overriding
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
    
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

var vehicle = Vehicle()
var bicycle = Bicycle()
var tandem = Tandem()


print("-----------------------------------")
// 2. Accessing Superclass Methods, Properties, and Subscripts
class TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int { multiplier * index }
    func printMultiplier() {
        print(multiplier)
    }
    init(multiplier: Int) {
        self.multiplier = multiplier
    }
}

class ArithmeticSequenceTable: TimesTable {
    var superMultiplier: Int { super.multiplier }
    override func printMultiplier() {
        super.printMultiplier()
    }
    override subscript(index: Int) -> Int { super[index] + 1 }
}



let threeTimesTable = TimesTable(multiplier: 3)
let arithmeticSequenceTable = ArithmeticSequenceTable(multiplier: 5)

print(threeTimesTable.multiplier)
print(arithmeticSequenceTable.multiplier)
print(arithmeticSequenceTable.superMultiplier)

threeTimesTable.printMultiplier()
arithmeticSequenceTable.printMultiplier()

(0...10).forEach { print(threeTimesTable[$0], terminator: "  ") }
// 0  3  6  9  12  15  18  21  24  27  30
print("")

(0...10).forEach { print(arithmeticSequenceTable[$0], terminator: "  ") }
// 1  6  11  16  21  26  31  36  41  46  51
print("")


print("-----------------------------------")
// 3. Overriding Methods
class Train: Vehicle {
    override func makeNoise() {
        print("칙칙폭폭")
    }
}

let train = Train()
train.makeNoise()


print("-----------------------------------")
// 4. Overriding Properties
// 4.1 Overriding Property Getters and Setters
class Car: Vehicle {
    var gear = 1
    override var description: String {
        super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)") // Car: traveling at 25.0 miles per hour in gear 3


print("-----------------------------------")
// 4.2 Overriding Property Observers
class AutomaticCar: Car {
    override final var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)") // AutomaticCar: traveling at 35.0 miles per hour in gear 4


print("-----------------------------------")
// 5. Preventing Overrides
//class ElectricMotorCar: AutomaticCar {
//    override var currentSpeed: Double { // error: Property overrides a 'final' property
//        
//    }
//}
