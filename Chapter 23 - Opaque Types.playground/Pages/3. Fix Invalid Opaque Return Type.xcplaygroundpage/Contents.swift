import Foundation

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

//struct FlippedShape<T: Shape>: Shape {
//    var shape: T
//    func draw() -> String {
//        let lines = shape.draw().split(separator: "\n")
//        return lines.reversed().joined(separator: "\n")
//    }
//}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        top.draw() + "\n" + bottom.draw()
    }
}


// 1. Square & makeTrapezoid()
//struct Square: Shape {
//    var size: Int
//    func draw() -> String {
//        let line = String(repeating: "*", count: size)
//        let result = Array<String>(repeating: line, count: size)
//        return result.joined(separator: "\n")
//    }
//}


// 2. flip(_:) & join(_:_:)
//func flip<T: Shape>(_ shape: T) -> some Shape {
//    FlippedShape(shape: shape)
//}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

//let smallTriangle = Triangle(size: 3)
//let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
//print(type(of: opaqueJoinedTriangles))  // JoinedShape<Triangle, FlippedShape<Triangle>>
//print(opaqueJoinedTriangles)
//print(opaqueJoinedTriangles.draw())


//---


// 3. invalidFlip(_:)
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        if shape is Square {
            return shape.draw()
        }
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}


func fixedInvalidFlip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape) // Error: return types don't match
}

let smallTriangle = Triangle(size: 2)
let smallSquare = Square(size: 2)
let trapezoid = join(smallTriangle, join(smallSquare, fixedInvalidFlip(smallTriangle)))
print(type(of: trapezoid))
print(trapezoid.draw())


// 5. repeat(shape:count:)


