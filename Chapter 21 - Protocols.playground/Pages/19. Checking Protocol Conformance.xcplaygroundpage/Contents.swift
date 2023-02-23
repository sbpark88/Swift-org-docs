import Foundation

protocol HasArea {
    var area: Double { get }
}

class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

let country = Country(area: 100.0)

// 1. is
//print(country is HasArea)   // true
//print(country is Int)       // false
//
//if country is HasArea {
//    print("country conforms to HasArea protocol.")
//} else {
//    print("country do not conforms to HasArea protocol.")
//}

// 2. as?
//print(country as? HasArea)   // Optional(__lldb_expr_7.Country)
//print(country as? Int)       // nil
//
//if let country = country as? HasArea {
//    print(country)
//    print("country conforms to HasArea protocol.")
//} else {
//    print("country do not conforms to HasArea protocol.")
//}

// 3. as!
//print(country as! HasArea)   // __lldb_expr_11.Country
//print(country as! Int)       // Could not cast value of type '__lldb_expr_11.Country' (0x1025a8720) to 'NSNumber' (0x1b8cd7ff0).


class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

objects.forEach {
    if let objectWithArea = $0 as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}
