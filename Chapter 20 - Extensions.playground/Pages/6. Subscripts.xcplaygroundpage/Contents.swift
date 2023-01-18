import Foundation

(3782 / 1) % 10     // 2
(3782 / 10) % 10    // 8
(3782 / 100) % 10   // 7
(3782 / 1000) % 10  // 3


extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

3782[0] // 2
3782[1] // 8
3782[2] // 7
3782[3] // 3
3782[4] // 0
