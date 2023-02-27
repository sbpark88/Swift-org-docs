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



struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func flip<T: Shape>(_ shape: T) -> some Shape {
    FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}


//---

// 4. repeat(shape:count:)
func `repeat`<T: Shape>(_ shape: T, count: Int) -> some Collection {
    Array<T>(repeating: shape, count: count)
}


let smallTriangle = Triangle(size: 3)
let smallSquare = Square(size: 3)

let doubleTriangle = `repeat`(smallTriangle, count: 2)
let tripleSquare = `repeat`(smallSquare, count: 3)

doubleTriangle.forEach { shape in
    if let shape = shape as? Shape {
        print(shape.draw())
    }
}

print("")

tripleSquare.forEach { shape in
    if let shape = shape as? Shape {
        print(shape.draw())
    }
}
