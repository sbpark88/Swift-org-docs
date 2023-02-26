import Foundation

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


if let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25]) {
    print("The index of 9.3 is \(doubleIndex).")
} else {
    print("The 9.3 is not in the array.")
}

if let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"]) {
    print("The index of Andrea is \(stringIndex).")
} else {
    print("Andrea is not in the array.")
}
