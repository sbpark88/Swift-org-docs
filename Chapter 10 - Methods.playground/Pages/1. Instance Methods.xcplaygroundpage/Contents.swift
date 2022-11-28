import Foundation

// Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()

print(counter.count)    // 0

counter.increment()
print(counter.count)    // 1

counter.increment(by: 5)
print(counter.count)    // 6

counter.reset()
print(counter.count)    // 0


// 1. The self Property
//struct Point {
//    var x = 0.0, y = 0.0
//    func isToTheRightOf(x: Double) -> Bool {
//        self.x > x
//    }
//}
//
//let somePoint = Point(x: 4.0, y: 5.0)
//if somePoint.isToTheRightOf(x: 1.0) {
//    print("This point is to the right of the line where x == 1.0")
//}
// This point is to the right of the line where x == 1.0


print("-------------------------------------")
// 2. Modifying Value Types from Within Instance methods
//struct Point {
//    var x = 0.0, y = 0.0
//    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
//}
//
//var somePoint = Point(x: 1.0, y: 1.0)
//print("The point is at (\(somePoint.x), \(somePoint.y))")
//
//somePoint.moveBy(x: 2.0, y: 3.0)
//print("The point is now at (\(somePoint.x), \(somePoint.y))")


//let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)   // Cannot use mutating member on immutable value: 'fixedPoint' is a 'let' constant


print("-------------------------------------")
// 3. Assigning to self Within a Mutating Method
func address(of object: UnsafeRawPointer) -> NSString {
    let address = Int(bitPattern: object)
    return NSString(format: "%p", address)
}


struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    mutating func anotherMoveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
print("The point is at (\(somePoint.x), \(somePoint.y))")
print("Point's memeory address is \(address(of: &somePoint))")

somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
print("Point's memeory address is \(address(of: &somePoint))")

somePoint.anotherMoveBy(x: 5.0, y: 2.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
print("Point's memeory address is \(address(of: &somePoint))")
