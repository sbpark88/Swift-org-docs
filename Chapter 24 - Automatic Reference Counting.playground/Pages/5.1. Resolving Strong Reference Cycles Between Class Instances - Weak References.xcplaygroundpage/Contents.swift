import Foundation

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

// Strong References
//print(unit4A as Any)                // Optional(__lldb_expr_13.Apartment)
//
//unit4A = nil
//print(unit4A as Any)                // nil
//DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//    print(john?.apartment as Any)   // Optional(__lldb_expr_13.Apartment)
//}

// Weak References
print(john as Any)                  // Optional(__lldb_expr_17.Person)

john = nil
print(john as Any)                  // nil
// John Appleseed is being deinitialized
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    print(unit4A?.tenant as Any)    // nil
}


//unit4A = nil
