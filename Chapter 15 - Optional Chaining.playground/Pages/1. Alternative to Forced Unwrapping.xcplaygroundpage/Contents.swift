import Foundation

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

// Forced Unwrapping
//print(john.residence!.numberOfRooms)
// Fatal error: Unexpectedly found nil while unwrapping an Optional value

// Optional Binding without Optional Chaining
if let residence = john.residence {
    print("John's residence has \(residence.numberOfRooms) room(s).")
} else {
    print("john.residence? is nil")
}

// Optional Binding with Optional Chaining
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("john.residence? is nil")
}


// If the optional has a value?
john.residence = Residence()

print(john.residence?.numberOfRooms as Any)    // Optional(1)

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("john.residence? is nil")
}
// John's residence has 1 room(s).
