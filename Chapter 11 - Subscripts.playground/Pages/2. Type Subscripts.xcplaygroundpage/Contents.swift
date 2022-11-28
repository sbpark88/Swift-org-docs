import Foundation

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        Planet(rawValue: n)!
    }
}

let earth = Planet(rawValue: 3)!
print(earth)    // earth

let mars = Planet[4]
print(mars)     // mars

print(type(of: earth))  // Planet
print(type(of: mars))   // Planet
