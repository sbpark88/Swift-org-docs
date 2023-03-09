import Foundation

// Case 1. Unowned Optional References
//class Country {
//    let name: String
//    var capitalCity: City?
//    init(name: String, capitalName: String) {
//        self.name = name
//        self.capitalCity = City(name: capitalName, country: self)
//    }
//    deinit { print("Country \(name) is being deinitialized") }
//}
//
//class City {
//    let name: String
//    unowned let country: Country
//    init(name: String, country: Country) {
//        self.name = name
//        self.country = country
//    }
//    deinit { print("City \(name) is being deinitialized") }
//}
//
//var country = Country(name: "Canada", capitalName: "Ottawa")
//print("\(country.name)'s capital city is called \(country.capitalCity!.name)")


// Case 2. Unowned References and Implicitly Unwrapped Optional Properties
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit { print("Country \(name) is being deinitialized") }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit { print("City \(name) is being deinitialized") }
}

//var country = Country(name: "Canada", capitalName: "Ottawa")
//print("\(country.name)'s capital city is called \(country.capitalCity.name)")


// Case 2.2 deallocated test

var country: Country?

country = Country(name: "Canada", capitalName: "Ottawa")
country = nil
