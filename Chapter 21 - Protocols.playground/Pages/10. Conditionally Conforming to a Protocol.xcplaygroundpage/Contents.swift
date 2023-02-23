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

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)    // [A 6-sided dice, A 12-sided dice]

let myNumber = [1, 2, 4, 6]
let myString = ["A", "C", "F"]

//myNumber.textualDescription // Property 'textualDescription' requires that 'Int' conform to 'TextRepresentable'
//myString.textualDescription // Property 'textualDescription' requires that 'String' conform to 'TextRepresentable'
