import Foundation

// 1. Property Wrappers
//struct OneToNine {
//    private var number = 1
//    var wrappedValue: Int {
//        get { number }
//        set { number = max(min(newValue, 9), 1) }
//    }
//}

// Explicit Wrapping
//struct MultiplicationTable {
//    private var _left = OneToNine()
//    private var _right = OneToNine()
//    var left: Int {
//        get { _left.wrappedValue }
//        set { _left.wrappedValue = newValue }
//    }
//    var right: Int {
//        get { _right.wrappedValue }
//        set { _right.wrappedValue = newValue }
//    }
//}


// Property Wrappers
@propertyWrapper
struct OneToNine {
    private var number = 1
    var wrappedValue: Int {
        get { number }
        set { number = max(min(newValue, 9), 1) }
    }
}

struct MultiplicationTable {
    @OneToNine var left: Int
    @OneToNine var right: Int
}


var multiplication = MultiplicationTable()

multiplication.left = 7
multiplication.right = 8
print("\(multiplication.left) x \(multiplication.right) = \(multiplication.left * multiplication.right)")
// Prints "7 x 8 = 56"

multiplication.left = 10
multiplication.right = 5
print("\(multiplication.left) x \(multiplication.right) = \(multiplication.left * multiplication.right)")
// Prints "9 x 5 = 45"


print("--------------------------------------")
// 2. Setting Initial Values for Wrapped Properties
@propertyWrapper
struct LengthOfSide {
    private var maximum: Int
    private var length: Int
    
    var wrappedValue: Int {
        get { length }
        set { length = min(newValue, maximum) }
    }
    
    init() {
        maximum = 10
        length = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 10
        length = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        length = min(wrappedValue, maximum)
    }
}

// Without arguments
// ZeroRectangle
struct Rectangle {
    @LengthOfSide var height: Int
    @LengthOfSide var width: Int
}
var rectangle = Rectangle()
print(rectangle)
//Rectangle(_height: __lldb_expr_53.LengthOfSide(maximum: 10, length: 0),
//           _width: __lldb_expr_53.LengthOfSide(maximum: 10, length: 0))

print("height: \(rectangle.height), width: \(rectangle.width)") // height: 0, width: 0

rectangle.height = 12
rectangle.width = 5
print("height: \(rectangle.height), width: \(rectangle.width)") // height: 10, width: 5


// NarrowRectangle
print("")
struct NarrowRectangle {
    @LengthOfSide(wrappedValue: 15, maximum: 20) var height: Int
    @LengthOfSide(wrappedValue: 3, maximum: 5) var width: Int
}


var narrowRectangle = NarrowRectangle()
print(narrowRectangle)
//NarrowRectangle(_height: __lldb_expr_69.LengthOfSide(maximum: 20, length: 15),
//                 _width: __lldb_expr_69.LengthOfSide(maximum: 5, length: 3))

print("height: \(narrowRectangle.height), width: \(narrowRectangle.width)") // height: 10, width: 5


print("")
// Using intial values
print("")
struct HugeRectangle {
    @LengthOfSide(maximum: 20) var height: Int = 20
    @LengthOfSide(maximum: 20) var width: Int = 25
}

var hugeRectangle = HugeRectangle()
print(hugeRectangle)
//HugeRectangle(_height: __lldb_expr_74.LengthOfSide(maximum: 20, length: 20),
//               _width: __lldb_expr_74.LengthOfSide(maximum: 20, length: 20))

print("height: \(hugeRectangle.height), width: \(hugeRectangle.width)") // height: 20, width: 20
