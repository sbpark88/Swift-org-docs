import Foundation

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

var numbers = [1, 2, 5, 7, 8, 14]

//numbers.append(99)
//print(numbers)          // [1, 2, 5, 7, 8, 14, 99]
//print(numbers.count)    // 7
//print(numbers[2])       // 5
//
//
//if numbers is any Container {
//    print("numbers conforms the Container protocol.")
//} else {
//    print("numbers do not conform the Container protocol.")
//}

extension Array: Container {}

if let _ = numbers as? any Container {
    print("numbers conforms the Container protocol.")
} else {
    print("numbers do not conform the Container protocol.")
}
