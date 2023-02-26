import Foundation

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let dogIndex = findIndex(ofString: "dog", in: strings) {
    print("The index of dog is \(dogIndex).")
} else {
    print("The dog is not in the array.")
}

if let bearIndex = findIndex(ofString: "bear", in: strings) {
    print("The index of bear is \(bearIndex).")
} else {
    print("The bear is not in the array.")
}
