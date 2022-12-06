import Foundation

// Required Initializers
let printCar = { (car: Car) in
    print("Car name is \"\(car.name)\" and have \(car.cylinder) cylinders")
}


class Vehicle {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

class Car: Vehicle {
    var cylinder = 1
//    required init(name: String) {
//        super.init(name: name)
//    }
    convenience init(name: String, cylinder: Int) {
        self.init(name: name)
        self.cylinder = cylinder
    }
}

class Truck: Car {
    required init(name: String) {
        super.init(name: name)
        self.cylinder = 8
    }
}

let bmw3 = Car(name: "BMW3")
let bmw5 = Car(name: "BMW5", cylinder: 5)
let someTruck = Truck(name: "BMW Truck")

printCar(bmw3)      // Car name is "BMW3" and have 1 cylinders
printCar(bmw5)      // Car name is "BMW5" and have 5 cylinders
printCar(someTruck) // Car name is "BMW Truck" and have 8 cylinders
