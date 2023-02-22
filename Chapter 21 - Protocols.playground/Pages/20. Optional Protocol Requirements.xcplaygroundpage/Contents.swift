import Foundation

//protocol Member {
//    var name: String { get set }
//    var age: Int { get set }
//    optional var address: String { get }    // 'optional' can only be applied to members of an @objc protocol
//}

//@objc protocol Member {
//    var name: String { get set }
//    var age: Int { get set }
//     optional var address: String { get }   // 'optional' requirements are an Objective-C compatibility feature; add '@objc'
//}

@objc protocol Member {
    var name: String { get set }
    var age: Int { get set }
    @objc optional var address: String { get }
}

//struct Teacher: Member {    // Non-class type 'Teacher' cannot conform to class protocol 'Member'
//    var name: String
//    var age: Int
//    var address: String
//}

class Teacher: Member {
    var name: String
    var age: Int
    var address: String
    init(name: String, age: Int, address: String) {
        self.name = name
        self.age = age
        self.address = address
    }
}

class Student: Member {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jamie = Teacher(name: "Jamie", age: 42, address: "서울시 강남구")
let mike = Student(name: "Mike", age: 20)

var MemberList: [Member] = [jamie, mike]

for member in MemberList {
    switch member {
    case let manager as Teacher:
        print("Teacher name is \(manager.name), he(she) is \(manager.age) years old, and lives in \(manager.address).")
    case let student as Student:
        print("Student name is \(student.name), he(she) is \(student.age) years old.")
    default: break
    }
}
