import Foundation

// 1. Failable Initializer Syntax
// Int Types
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}
// 12345.0 conversion to Int maintains value of 12345

let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("\(pi) conversion to Int doesn't maintain value")
}
// 3.14159 conversion to Int doesn't maintain value

print(type(of: valueChanged))   // Optional<Int>


// Custom Types
//struct Animal {
//    let species: String
//}
//
//let someCreature = Animal(species: "Giraffe")
//print("An animal was initialized with a species of \(someCreature.species)")
//// An animal was initialized with a species of Giraffe
//print(type(of: someCreature))       // Animal
//
//let anonymousCreature = Animal(species: "")
//print("An animal was initialized with a species of \(anonymousCreature.species)")
//// An animal was initialized with a species of
//print(type(of: anonymousCreature))  // Animal


struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// An animal was initialized with a species of Giraffe
print(type(of: someCreature))       // Optional<Animal>

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature couldn't be initialized")
}
// The anonymous creature couldn't be initialized
print(type(of: anonymousCreature))  // Optional<Animal>

print("-------------------------------------")
// 2. Failable Initializers for Enumerations
//enum TemperatureUnit {
//    case kelvin, celsius, fahrenheit
//    init?(symbol: Character) {
//        switch symbol {
//        case "K": self = .kelvin
//        case "C": self = .celsius
//        case "F": self = .fahrenheit
//        default: return nil
//        }
//    }
//}
//
//let fahrenheitUnit = TemperatureUnit(symbol: "F")
//if fahrenheitUnit != nil {
//    print("This is a defined temperature unit, so initialization succeeded.")
//}
//// This is a defined temperature unit, so initialization succeeded.
//
//let unknownUnit = TemperatureUnit(symbol: "X")
//if unknownUnit == nil {
//    print("This isn't a defined temperature unit, so initialization failed.")
//}
//// This isn't a defined temperature unit, so initialization failed.


print("-------------------------------------")
// 3. Failable Initializers for Enumerations with Raw Values
enum CompassPoint: String {
    case east, west, south, north
}

print("\(CompassPoint.east) is type of \(type(of: CompassPoint.east))")
print("\(CompassPoint.east.rawValue) is type of \(type(of: CompassPoint.east.rawValue))")
// east is type of CompassPoint
// east is type of String

let east = CompassPoint(rawValue: "east")
print("Constant 'east' is type of \(type(of: east))")
// Constant 'east' is type of Optional<CompassPoint>


print("-------------------------------------")
enum TemperatureUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnit = TemperatureUnit(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// This is a defined temperature unit, so initialization succeeded.

let unknownUnit = TemperatureUnit(rawValue: "X")
if unknownUnit == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}
// This isn't a defined temperature unit, so initialization failed.


//enum SomeEnumeration: Int {
//    case zero, one, two, three
//}
//
//let zero = SomeEnumeration(rawValue: 0)
//if zero != nil {
//    print("Zero is valid.")     // Zero is valid.
//}
//print(type(of: zero))   // Optional<SomeEnumeration>
//
//let four = SomeEnumeration(rawValue: 4)
//if four == nil {
//    print("Four is unvalid.")   // Four is unvalid.
//}
//print(type(of: four))   // Optional<SomeEnumeration>
//
//enum Planet: Int {
//    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
//}
//
//
//let earth = Planet(rawValue: 2)
//if earth != nil {
//    print("Earth is a planet in the solar system.")         // Earth is a planet in the solar system.
//}
//
//
//let unknownPlanet = Planet(rawValue: 9)
//if unknownPlanet == nil {
//    print("There is no 9th planet in our solar system.")    // There is no 9th planet in our solar system.
//}


print("-------------------------------------")
// 4. Porpagation of Initialization Failuer
// `Failable Initializers` delegates to `Failable Initializers`
//class Product {
//    let name: String
//    init?(name: String) {
//        if name.isEmpty { return nil }
//        self.name = name
//    }
//}
//
//class CartItem: Product {
//    let quantity: Int
//    init?(name: String, quantity: Int) {
//        if quantity < 1 { return nil }
//        self.quantity = quantity
//        super.init(name: name)
//    }
//}

//class CartItem: Product {
//    let quantity: Int
//    init?(name: String, quantity: Int) {
//        guard quantity > 0 else { return nil }
//        self.quantity = quantity
//        super.init(name: name)
//    }
//}


// `Failable Initializers` delegates to `Nonfailable Initializers`
class Product {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            self.quantity = -1
        } else {
            self.quantity = quantity
        }
        super.init(name: name)
    }
}


if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(String(describing: twoSocks.quantity))")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(String(describing: zeroShirts.quantity))")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}


print("-------------------------------------")
// 5. Overriding a Failable Initializer
let printTitle = { (variable: String, document: Document?) in
    guard let document = document else {
        print("\"\(variable)\" initialization failed")
        return
    }
    if document.name == nil {
        print("\"\(variable)\" initialization success, name is nil")
    } else {
        print("\"\(variable)\" initialization success, name is \"\(document.name!)\"")
    }
}

class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

//let unnamed = Document()
//let contacts = Document(name: "Contacts")
//let emptyName = Document(name: "")
//
//printTitle("unnamed", unnamed)
//printTitle("contacts", contacts)
//printTitle("emptyName", emptyName)


//class AutomaticallyNamedDocument: Document {
//    override init() {
//        super.init()
//        self.name = "[Untitled]"
//    }
//    override init(name: String) {
//        super.init()
//        if name.isEmpty {
//            self.name = "[Untitled]"
//        } else {
//            self.name = name
//        }
//    }
//}
//
//let unnamed = AutomaticallyNamedDocument()
//let contacts = AutomaticallyNamedDocument(name: "Contacts")
//let emptyName = AutomaticallyNamedDocument(name: "")
//
//printTitle("unnamed", unnamed)
//printTitle("contacts", contacts)
//printTitle("emptyName", emptyName)


class AutomaticallyNamedDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
    override init(name: String) {
        if name.isEmpty {
            super.init(name: "[Untitled]")!
        } else {
            super.init(name: name)!
        }
    }
}

// init!
//class Document {
//    var name: String?
//    // this initializer creates a document with a nil name value
//    init() {}
//    // this initializer creates a document with a nonempty name value
//    init!(name: String) {
//        if name.isEmpty { return nil }
//        self.name = name
//    }
//}
//
//class AutomaticallyNamedDocument: Document {
//    override init() {
//        super.init(name: "[Untitled]")
//    }
//    override init(name: String) {
//        if name.isEmpty {
//            super.init(name: "[Untitled]")
//        } else {
//            super.init(name: name)
//        }
//    }
//}


let unnamed = AutomaticallyNamedDocument()
let contacts = AutomaticallyNamedDocument(name: "Contacts")
let emptyName = AutomaticallyNamedDocument(name: "")

printTitle("unnamed", unnamed)
printTitle("contacts", contacts)
printTitle("emptyName", emptyName)

print("-------------------------------------")
// 6. The init! Failable Initializer
