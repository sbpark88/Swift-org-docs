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

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        top.draw() + "\n" + bottom.draw()
    }
}


// 1. Square & makeTrapezoid()
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}

//let trapezoid = makeTrapezoid()
//
//print(type(of: trapezoid))  // JoinedShape<Triangle, JoinedShape<Square, FlippedShape<Triangle>>>
//
//print(trapezoid.draw())


// 2. flip(_:) & join(_:_:)
func flip<T: Shape>(_ shape: T) -> some Shape {
    FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

//let smallTriangle = Triangle(size: 3)
//let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
//print(type(of: opaqueJoinedTriangles))  // JoinedShape<Triangle, FlippedShape<Triangle>>
//print(opaqueJoinedTriangles)
//print(opaqueJoinedTriangles.draw())


let smallTriangle = Triangle(size: 2)
let smallSquare = Square(size: 2)
let trapezoid = join(smallTriangle, join(smallSquare, flip(smallTriangle)))
print(type(of: trapezoid))
print(trapezoid.draw())



// 3. invalidFlip(_:)

//func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
//    if shape is Square {
//        return shape // Error: return types don't match
//    }
//    return FlippedShape(shape: shape) // Error: return types don't match
//}


// 4. FlippedShape



// 5. repeat(shape:count:)


