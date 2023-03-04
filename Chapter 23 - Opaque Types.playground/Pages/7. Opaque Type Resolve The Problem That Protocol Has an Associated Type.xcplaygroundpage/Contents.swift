import Foundation

//protocol Container { }
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }

//func makeProtocolContainer<T, C: Container>(item: T) -> C {
//    [item]
//}

//func makeProtocolContainer<T>(item: T) -> Container {
//    [item]
//}
//
//let emptyContainer = makeProtocolContainer(item: 10)
//print(type(of: emptyContainer)) // Array<Int>
//print(emptyContainer)           // [10]
//print(emptyContainer[0])        // error: value of type 'any Container' has no subscripts



//func makeProtocolContainer<T>(item: T) -> any Container {
//    [item]
//}
//
//let anyContainer = makeProtocolContainer(item: 11)
//print(type(of: anyContainer))   // Array<Int>
//print(anyContainer)             // [11]
//print(anyContainer.count)       // 1
//
//let eleven = anyContainer[0]
//print(type(of: eleven))         // Int
//print(eleven)                   // 11



func makeProtocolContainer<T>(item: T) -> some Container {
    [item]
}

let opaqueContainer = makeProtocolContainer(item: 12)
print(type(of: opaqueContainer))    // Array<Int>
print(opaqueContainer)              // [12]
print(opaqueContainer.count)        // 1

let twelve = opaqueContainer[0]
print(type(of: twelve))             // Int
print(twelve)                       // 12
