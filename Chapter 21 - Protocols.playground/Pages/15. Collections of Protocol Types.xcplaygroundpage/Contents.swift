import Foundation

protocol TextRepresentable {
    var textualDescription: String { get }
}

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

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator

    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }

    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}


let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
let simonTheHamster = Hamster(name: "Simon")

let things: [TextRepresentable] = [d6, d12, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}
