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

// -----------------------------------------------

//var internalInstance = SomePrivateClass()   // Variable must be declared private or fileprivate because its type 'SomePrivateClass' uses a private type
fileprivate var fileprivateInstance = SomePrivateClass()
private var privateInstance = SomePrivateClass()

// -----------------------------------------------
// 1. Getters: internal, Setters: internal
//class SomeClass {
//    var id: String = ""
//}

//class SomeClass {
//    private var _id: String = ""
//    var id: String {
//        get {
//            _id
//        }
//        set {
//            _id = newValue
//        }
//    }
//}
//
//let someClass = SomeClass()
//
//someClass.id = "A"
//print(someClass.id)  // A

// -----------------------------------------------
// 2. Getters: internal, Setters: private
//class SomeClass {
//    private var _id: String = ""
//    var id: String {
//        get {
//            _id
//        }
//    }
//    func setId(_ id: String) {
//        self._id = id
//    }
//}
//
//let someClass = SomeClass()
//
////someClass.id = "A"   // error: cannot assign to property: 'id' is a get-only property
//someClass.setId("A")
//print(someClass.id)  // A

// -----------------------------------------------
// 3. private(set)
class SomeClass {
    //    internal private(set) var id: String = ""
    private(set) var id: String = ""
    
    func setId(_ id: String) {
        self.id = id
    }
}

let someClass = SomeClass()

//someClass.id = "A"   // error: cannot assign to property: 'id' is a get-only property
someClass.setId("A")
print(someClass.id)  // A


struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var tracking = TrackedString()
print(tracking.numberOfEdits)   // 0
tracking.value = "A"
print(tracking.numberOfEdits)   // 1
tracking.value = "B"
print(tracking.numberOfEdits)   // 2
tracking.value += "C"
print(tracking.numberOfEdits)   // 3
