import Foundation

// 3. Projecting a Value From a Property Wrapper
@propertyWrapper
struct LengthOfSide {
    private var maximum: Int
    private var length: Int
    private(set) var projectedValue: Bool = false
    
    var wrappedValue: Int {
        get { length }
        set {
            if newValue > maximum {
                length = maximum
                projectedValue = true
            } else {
                length = newValue
                projectedValue = false
            }
        }
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



// Using intial values
struct HugeRectangle {
    @LengthOfSide(wrappedValue: 20, maximum: 20) var height: Int
    @LengthOfSide(maximum: 20) var width: Int = 25
}

var hugeRectangle = HugeRectangle()
print(hugeRectangle)
//HugeRectangle(_height: __lldb_expr_74.LengthOfSide(maximum: 20, length: 20),
//               _width: __lldb_expr_74.LengthOfSide(maximum: 20, length: 20))

print("height: \(hugeRectangle.height), width: \(hugeRectangle.width)") // height: 20, width: 20


print(hugeRectangle.height)     // 20
print(hugeRectangle.$height)    // false
print(hugeRectangle.width)      // 20
print(hugeRectangle.$width)     // false

hugeRectangle.width = 30
print(hugeRectangle.width)      // 20
print(hugeRectangle.$width)     // true


print("--------------------------------------")
enum Size {
    case small, large
}

struct SizedRectangle {
    @LengthOfSide var height: Int
    @LengthOfSide var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

var rectangle = SizedRectangle()
var resizeWasCalibrated = rectangle.resize(to: .small)

print(rectangle.height, rectangle.$height)  // 10 false
print(rectangle.width, rectangle.$width)    // 10 true
print(resizeWasCalibrated)                  // true
