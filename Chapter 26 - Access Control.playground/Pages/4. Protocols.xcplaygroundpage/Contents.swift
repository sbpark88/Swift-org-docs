import Foundation

protocol SomeProtocol {
    var protocolProperty: Int { get }
}

protocol SomePrivateProtocol {
    var privateProtocolProperty: Int { get }
}

struct SomeStructure: SomeProtocol, SomePrivateProtocol {
    var protocolProperty: Int
    var privateProtocolProperty: Int
}

var some = SomeStructure(protocolProperty: 10, privateProtocolProperty: 30)
print(some.protocolProperty)  // 10
some.protocolProperty = 5
print(some.protocolProperty)  // 5

print(some.privateProtocolProperty) // 30
some.privateProtocolProperty = 50
print(some.privateProtocolProperty) // 50
