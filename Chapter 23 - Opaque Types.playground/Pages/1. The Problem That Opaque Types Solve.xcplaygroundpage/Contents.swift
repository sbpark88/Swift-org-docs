import Foundation

protocol Shape {
    func draw() -> String
}


// 1. Triangle
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

let smallTriangle = Triangle(size: 3)
print(type(of: smallTriangle))  // Triangle

print(smallTriangle)            // Triangle(size: 3)


//var arr = ["*", "**", "***"]
//print(arr)                          // ["*", "**", "***"]
//print(arr.joined())                 // ******
//print(arr.joined(separator: ", "))  // *, **, ***

print(smallTriangle.draw())


// 2. FlippedShape
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)
print(type(of: flippedTriangle))    // FlippedShape<Triangle>

print(flippedTriangle.shape)        // Triangle(size: 3)

print(flippedTriangle.draw())


// 3. JoinedShape

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(type(of: joinedTriangles))    // JoinedShape<Triangle, FlippedShape<Triangle>>

print(joinedTriangles.top)          // Triangle(size: 3)
print(joinedTriangles.bottom)       // FlippedShape<Triangle>(shape: __lldb_expr_38.Triangle(size: 3))

print(joinedTriangles.draw())
