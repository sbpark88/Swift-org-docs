import Foundation

protocol easyIndex {
    subscript(_ digitIndex: Int) -> Self { get }
}

extension Int: easyIndex {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}


3782[0] // 2, 10^0 의 자릿수는 2다.
3782[1] // 8, 10^1 의 자릿수는 8이다.
3782[2] // 7, 10^2 의 자릿수는 7이다.
3782[3] // 3, 10^3 의 자릿수는 3이다.
3782[4] // 0, 10^4 의 자릿수는 존재하지 않으므로 0이다.



let greeting = "Guten Tag!"

//print(greeting.startIndex)                              // Index(_rawBits: 15)
//print(greeting.index(greeting.startIndex, offsetBy: 3)) // Index(_rawBits: 196871)
//
//print(greeting[greeting.startIndex])                                // G
//print(greeting[greeting.index(greeting.startIndex, offsetBy: 1)])   // u
//print(greeting[greeting.index(greeting.startIndex, offsetBy: 2)])   // t
//print(greeting[greeting.index(greeting.endIndex, offsetBy: -1)])    // !


extension String: easyIndex {
    subscript(digitIndex: Int) -> String {
        String(self[self.index(self.startIndex, offsetBy: digitIndex)])
    }
}

print(greeting[0])                  // G
print(greeting[1])                  // u
print(greeting[2])                  // t
print(greeting[greeting.count - 1]) // !
