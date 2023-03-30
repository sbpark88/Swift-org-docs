import Foundation

struct SomeStruct {
    var number: Int
    func double() -> Int { self.number * 2 }
}

private typealias PrivateStruct = SomeStruct
//public typealias PublicStruct = SomeStruct  // Type alias cannot be declared public because its underlying type uses an internal type

//var privateStruct = PrivateStruct(number: 5) // error: variable must be declared private or fileprivate because its type 'PrivateStruct' (aka 'SomeStruct') uses a private type

private var privateStruct = PrivateStruct(number: 5)
privateStruct.number    // 5
privateStruct.double()  // 10
