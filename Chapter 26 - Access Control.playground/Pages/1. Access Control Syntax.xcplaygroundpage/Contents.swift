import Foundation

public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

class AnotherSomeInternalClass {}              // implicitly internal
let anotherSomeInternalConstant = 0            // implicitly internal
