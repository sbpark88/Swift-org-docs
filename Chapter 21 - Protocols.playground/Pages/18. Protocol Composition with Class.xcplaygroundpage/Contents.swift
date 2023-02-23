import Foundation

protocol Named {
    var name: String { get }
}

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)

// Case 1 - Subclass
//func whereIs(_ city: City) {
//    print("\(city.name), latitude: \(city.latitude), longitude: \(city.longitude)")
//}

// Case 2 - Downcasting
//func whereIs(_ location: Location) {
//    print("\((location as? City)!.name), latitude: \(location.latitude), longitude: \(location.longitude)")
//}

// Case 3 - Protocol Composition with Class
func whereIs(_ location: Location & Named) {
    print("\(location.name), latitude: \(location.latitude), longitude: \(location.longitude)")
}


whereIs(seattle)
