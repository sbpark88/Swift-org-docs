import Foundation

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count

print("\(numberOfChoices) beverages available\n")

for beverage in Beverage.allCases {
    print(beverage)
}
