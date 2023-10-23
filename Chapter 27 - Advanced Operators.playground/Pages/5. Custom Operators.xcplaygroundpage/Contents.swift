import Foundation

struct Vector2D {
    var x = 0.0, y = 0.0
}


extension Vector2D {
    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static prefix func - (vector: Vector2D) -> Vector2D {
        Vector2D(x: -vector.x, y: -vector.y)
    }

    static func += (lhs: inout Vector2D, rhs: Vector2D) {
        lhs = lhs + rhs
    }
}

extension Vector2D: Equatable {}


// Custom Operators
// 1. New Prefix Operator `+++`
prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print("After Doubling Vector is (\(afterDoubling.x), \(afterDoubling.y)).")


// 2. Precedence for Custom Infix Operators
infix operator +-: AdditionPrecedence

extension Vector2D {
    static func +- (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        Vector2D(x: lhs.x + rhs.x, y: lhs.y - rhs.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print("Plus Minus Vector is (\(plusMinusVector.x), \(plusMinusVector.y)).")
