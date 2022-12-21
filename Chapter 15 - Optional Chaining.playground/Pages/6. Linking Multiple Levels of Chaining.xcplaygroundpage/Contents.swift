import Foundation

let john = Person()
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Unable to retrieve the address.

print(john.residence?.address?.street)              // nil
print(type(of: john.residence?.address?.street))    // Optiona<String>


print("----------------------------------------")
john.residence = {
    let someResidence = Residence()
    someResidence.rooms = Array(repeating: "", count: 300).lazy
        .enumerated().map { (index, value) in
            index == 237 ? "Shining" : String(index)
        }
        .map { Room(name: $0) }
    someResidence.address = {
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"

        return someAddress
    }()

    return someResidence
}()


if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// John's street name is Acacia Road.

print(john.residence?.address?.street)              // Optional("Acacia Road")
print(type(of: john.residence?.address?.street))    // Optional<String>

/*  Defining Model Classes for Optional Chaining Examples  */

class Person {
    var residence: Residence?
}

class Residence {
    var rooms: [Room] = []
    var numberOfRooms: Int { rooms.count }
    subscript(i: Int) -> Room {
        get { rooms[i] }
        set { rooms[i] = newValue }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
