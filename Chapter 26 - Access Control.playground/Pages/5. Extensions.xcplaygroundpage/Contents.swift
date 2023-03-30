import Foundation

struct SomeStruct {
    var number: Int
    func double() -> Int { self.number * 2 }
}

private extension SomeStruct {
    func triple() -> Int { self.number * 3 }
}


var some = SomeStruct(number: 5)
some.number     // 5
some.double()   // 10
some.triple()   // 15

//----------------------------------------------
print("")

struct Origin {
    private let originNumber = 5
    func printExtensionNumber() { print(doubleNumber) }
}

extension Origin {
    private var doubleNumber: Int { originNumber * 2 }
    func printAnotherExtensionNumber() { print(tripleNumber) }
}

extension Origin {
    private var tripleNumber: Int { originNumber * 3 }
    func printOriginNumber() { print(originNumber) }
}

var someStructure = Origin()
someStructure.printExtensionNumber()        // 10
someStructure.printAnotherExtensionNumber() // 15
someStructure.printOriginNumber()           // 5
