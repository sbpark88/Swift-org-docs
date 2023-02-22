import Foundation

protocol RandomNumberGenerator {
    func random() -> Double
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        random() > 0.5
    }
}

//class LinearCongruentialGenerator: RandomNumberGenerator {
//    var lastRandom = 42.0
//    let m = 139968.0
//    let a = 3877.0
//    let c = 29573.0
//
//    func random() -> Double {
//        lastRandom = ((lastRandom + a + c).truncatingRemainder(dividingBy: m))
//        return lastRandom / m
//    }
//}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0

    func random() -> Double {
        lastRandom = ((lastRandom + a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
    func randomBool() -> Bool {
        random() > 0.8
    }
}

let generator = LinearCongruentialGenerator()
Array(1...5).forEach { _ in print("Here's a random Boolean: \(generator.randomBool())") }
// Here's a random Boolean: false
// Here's a random Boolean: false
// Here's a random Boolean: false
// Here's a random Boolean: true
// Here's a random Boolean: false
