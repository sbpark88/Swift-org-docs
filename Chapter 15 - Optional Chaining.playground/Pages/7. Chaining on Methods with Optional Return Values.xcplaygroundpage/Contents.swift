import Foundation

let john = Person()
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

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
// John's building identifier is 29 Acacia Road.


print("----------------------------------------")
if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier doesn't begin with \"The\".")
    }
}
// John's building identifier doesn't begin with "The".


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
