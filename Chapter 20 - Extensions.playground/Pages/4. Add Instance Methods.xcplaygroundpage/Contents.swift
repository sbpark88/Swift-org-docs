import Foundation

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

for _ in 1...3 {
    print("Hello! This is For-loop.")
}

Array(1...3).forEach { _ in print("Hello! This is forEach.") }

3.repetitions { print("Hello! This is Instance Methods") }

