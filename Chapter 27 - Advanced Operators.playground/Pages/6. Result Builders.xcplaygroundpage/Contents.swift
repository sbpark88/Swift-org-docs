import Foundation

protocol Drawable {
    func draw() -> String
}

struct Line: Drawable {
    var elements: [Drawable]
    func draw() -> String {
        elements.map { $0.draw() }.joined(separator: "")
    }
}

struct Text: Drawable {
    var content: String
    init(_ content: String) {
        self.content = content
    }
    func draw() -> String {
        content
    }
}

struct Space: Drawable {
    func draw() -> String {
        " "
    }
}

struct Stars: Drawable {
    var length: Int
    func draw() -> String {
        String(repeating: "*", count: length)
    }
}

struct AllCaps: Drawable {
    var content: Drawable
    func draw() -> String {
        content.draw().uppercased()
    }
}


//--------------------------------------------------------------------

// 1. Draw something one line string.
let name: String? = "Hogwarts"
//let manualDrawing = Line(elements: [
//    Stars(length: 3),
//    Text("Hello"),
//    Space(),
//    AllCaps(content: Text("\(name ?? "World")!")),
//    Stars(length: 2)
//])
//
//print(manualDrawing.draw()) // ***Hello HOGWARTS!**


// 2. Declaration of "Result Builder"
@resultBuilder
struct DrawingBuilder {
    static func buildBlock(_ components: Drawable...) -> Drawable {
        Line(elements: components)
    }
    static func buildEither(first: Drawable) -> Drawable {
        first
    }
    static func buildEither(second: Drawable) -> Drawable {
        second
    }
}

// 3. Apply Result Builder
func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
    content()
}

func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
    AllCaps(content: content())
}

//func makeGreeting(for name: String? = nil) -> Drawable {
//    let greeting = draw(content: {
//        Stars(length: 3)
//        Text("Hello")
//        Space()
//        caps(content: {
//            Text("\(name ?? "World")!")
//        })
//        Stars(length: 2)
//    })
//    return greeting
//}

func makeGreeting(for name: String? = nil) -> Drawable {
    draw {
        Stars(length: 3)
        Text("Hello")
        Space()
        caps {
            Text("\(name ?? "World")!")
        }
        Stars(length: 2)
    }
}


let genericGreeting = makeGreeting()
print(genericGreeting.draw())   // ***Hello WORLD!**

let personGreeting = makeGreeting(for: "Hogwarts")
print(personGreeting.draw())    // ***Hello Hogwarts!**


// Syntax for Result Builder function calling
//let capsDrawing = caps(content: {
//    let partialDrawing: Drawable
//    if let name = name {
//        partialDrawing = DrawingBuilder.buildEither(first: Text("\(name)!"))
//    } else {
//        partialDrawing = DrawingBuilder.buildEither(second: Text("World!"))
//    }
//    return partialDrawing
//})

let capsDrawing = caps {
    let partialDrawing: Drawable
    if let name = name {
        partialDrawing = DrawingBuilder.buildEither(first: Text("\(name)!"))
    } else {
        partialDrawing = DrawingBuilder.buildEither(second: Text("World!"))
    }
    return partialDrawing
}
print(capsDrawing)          // AllCaps(content: __lldb_expr_156.Text(content: "Hogwarts!"))
print(capsDrawing.draw())   // HOGWARTS!


extension DrawingBuilder {
    static func buildArray(_ components: [Drawable]) -> Drawable {
        Line(elements: components)
    }
}

let manyStars = draw {
    Text("Stars:")
    for length in 1...3 {
        Space()
        Stars(length: length)
    }
}
print(manyStars.draw()) // Stars: * ** ***
