import Foundation

protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
print(simonTheHamster.textualDescription)   // A hamster named Simon

let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)    // A hamster named Simon
