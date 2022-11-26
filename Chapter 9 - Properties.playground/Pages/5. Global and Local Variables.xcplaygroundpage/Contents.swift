import Foundation

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


func someFunction() {
    @LengthOfSide var length: Int
    print(length)   // 0
    
    length = 5
    print(length)   // 5
    
    length = 12
    print(length)   // 10
}

someFunction()
