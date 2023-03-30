import Foundation

public class SomePublicClass {                      // explicitly public class
    public var somePublicProperty = 0               // explicitly public class member
    var someInternalProperty = 0                    // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}     // explicitly file-private class member
    private func somePrivateMethod() {}             // explicitly private class member
}

class SomeInternalClass {                           // implicitly internal class
    var someInternalProperty = 0                    // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}     // explicitly file-private class member
    private func somePrivateMethod() {}             // explicitly private class member
}

fileprivate class SomeFilePrivateClass {            // explicitly file-private class
    func someFilePrivateMethod() {}                 // implicitly file-private class member
    private func somePrivateMethod() {}             // explicitly private class member
}

private class SomePrivateClass {                    // explicitly private class
    func somePrivateMethod() {}                     // implicitly private class member
}

//---------------------------------------------------------------------

// Context 의 Access Levels 와 일치하는 경우
//struct SomeInternalStructure {
//    func someFunction() -> (SomeInternalClass, SomeInternalClass) {
//        (SomeInternalClass(), SomeInternalClass())
//    }
//}
//
//private struct SomePrivateStructure {
//    func someFunction() -> (SomePrivateClass, SomePrivateClass) {
//        (SomePrivateClass(), SomePrivateClass())
//    }
//}

// Context 의 Access levels 와 일치하지 않는 경우
//struct SomeInternalStructure {
//    func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//        (SomeInternalClass(), SomePrivateClass())
//    }  // error: method must be declared fileprivate because its result uses a private type
//}

struct SomeInternalStructure {
    fileprivate func someFunctionFirst() -> (SomeInternalClass, SomePrivateClass) {
        (SomeInternalClass(), SomePrivateClass())
    }
    private func someFunctionSecond() -> (SomeInternalClass, SomePrivateClass) {
        (SomeInternalClass(), SomePrivateClass())
    }
}

let some = SomeInternalStructure()
some.someFunctionFirst()
//some.someFunctionSecond()   // 'someFunctionSecond' is inaccessible due to 'private' protection level
