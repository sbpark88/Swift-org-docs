import Foundation

//extension Array: TextRepresentable where Element: TextRepresentable {
//    var textualDescription: String {
//        let itemsAsText = self.map { $0.textualDescription }
//        return "[" + itemsAsText.joined(separator: ", ") + "]"
//    }
//}

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

print(equalNumbers.allEqual())      // true
print(differentNumbers.allEqual())  // false


print(equalNumbers.allSatisfy { $0 == equalNumbers[0] })            // true
print(differentNumbers.allSatisfy { $0 == differentNumbers[0] })    // false

print(equalNumbers.contains { $0 == 200 })                          // false
print(differentNumbers.contains { $0 == 200 })                      // true
