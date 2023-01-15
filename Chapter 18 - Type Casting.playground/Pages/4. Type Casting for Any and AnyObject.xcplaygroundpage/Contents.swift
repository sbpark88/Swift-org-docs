import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

struct Point {
    var x = 0.0, y = 0.0
}

enum CompassPoint {
    case east, west, south, north
}


let product = { (a: Int, b: Int) in a * b }


var things: [Any] = []
//var things: [AnyObject] = []/

//things.append(0)            // Int
//things.append(0.0)          // Double
//things.append(42)           // Int
//things.append(3.14159)      // Double
//
//things.append("hello")      // String
//things.append((3.0, 5.0))   // Tuple of type (Double, Double)
//things.append({ (name: String) -> String in "Hello, \(name)" }) // Closure of type (name: Stirng) -> String
//
things.append(Movie(name: "Avatar", director: "James Francis Cameron")) // Class
//things.append(Point(x: 5.2, y: 3.0))                                    // Structure
//things.append(CompassPoint.east)                                        // Enumeration


func testAnyTypes(_ things: [Any]) {
    for thing in things {
        switch thing {
        case 0 as Int:
            print("\(thing) : zero as an Int")
        case 0 as Double:
            print("\(thing) : zero as a Double")
        case let someInt as Int:
            print("\(thing) : an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("\(thing) : a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("\(thing) : a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("\(thing) : an (x, y) point at \(x), \(y)")
        case let stringConverter as (String) -> String:
            print("\(thing) : \(stringConverter("Michael"))")
        case let movie as Movie:
            print("\(thing) : a movie called \(movie.name), dir. \(movie.director)")
        case let point as Point:
            print("\(thing) : a point is at (\(point.x), \(point.y))")
        case let direction as CompassPoint:
            print("\(thing) : a direction is \(direction)")
        default:
            print("\(thing) : something else")
        }
    }
}

//testAnyTypes(things)

//if let aMovie = things[0] as? Movie {
//    print("\(aMovie) : a movie called \(aMovie.name), dir. \(aMovie.director)")
//}


let optionalNumber3: Int? = 3
let optionalNumber5: Int? = 5
let optionalNumber7: Int? = 7
let optionalNumber9: Int? = 9

things.append(optionalNumber3)
things.append(optionalNumber5 ?? 0)
things.append(optionalNumber7!)
things.append(optionalNumber9 as Any)

testAnyTypes(things)
