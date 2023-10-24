import Foundation

struct Vector2D {
    var x = 0.0, y = 0.0
}


// 1. Infix Operators
extension Vector2D {
    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print("Combined Vector is (\(combinedVector.x), \(combinedVector.y)).")
// Combined Vector is (5.0, 5.0).


// 2. Unary Operators
// Prefix Operators
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
print("Negative Vector is (\(negative.x), \(negative.y)).")
// Negative Vector is (-3.0, -4.0).
let alsoPosotive = -negative
print("Also Positive Vector is (\(alsoPosotive.x), \(alsoPosotive.y)).")
// Also Positive Vector is (3.0, 4.0).


// 3. Compund Assignment Operators
// Addition Assignment Operator
extension Vector2D {
    static func += (lhs: inout Vector2D, rhs: Vector2D) {
        lhs = lhs + rhs
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print("Original Vector is (\(original.x), \(original.y)) now.")
// Original Vector is (4.0, 6.0) now.


// 4. Equivalence Operators
// 직접 구현하기
//extension Vector2D: Equatable {
//    static func == (lhs: Vector2D, rhs: Vector2D) -> Bool {
//        lhs.x == rhs.x && lhs.y == rhs.y
//    }
//}

// Protocol 채택으로 Swift 가 기본 구현을 자동으로 합성하도록 하기
extension Vector2D: Equatable {}

let alpha = Vector2D(x: 2.0, y: 3.0)
let beta = Vector2D(x: 2.0, y: 3.0)
if alpha == beta {
    print("These tow vectors are equivalent.")
}
