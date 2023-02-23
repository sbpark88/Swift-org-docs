import Foundation

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0

    func random() -> Double {
        lastRandom = ((lastRandom + a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
//Array(1...5).forEach { _ in print("Here's a random number: \(generator.random())") }
// Here's a random number: 0.23928326474622771
// Here's a random number: 0.4782664609053498
// Here's a random number: 0.7172496570644719
// Here's a random number: 0.956232853223594
// Here's a random number: 0.19521604938271606


//protocol RandomBoolGenerator: RandomNumberGenerator {
//    func randomBool() -> Bool
//}
//
//extension LinearCongruentialGenerator: RandomBoolGenerator {
//    func randomBool() -> Bool {
//        random() > 0.5
//    }
//}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        random() > 0.5
    }
}

Array(1...5).forEach { _ in print("Here's a random Boolean: \(generator.randomBool())") }
// And here's a random Boolean: false
// And here's a random Boolean: true
// And here's a random Boolean: true
// And here's a random Boolean: false
// And here's a random Boolean: false
