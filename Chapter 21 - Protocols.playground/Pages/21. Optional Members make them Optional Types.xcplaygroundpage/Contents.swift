import Foundation

@objc protocol Member {
    var name: String { get set }
    var age: Int { get set }
    @objc optional var address: String { get }
}

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
    userInformation(user: member)
    print("")
}

func userInformation(user: Member) {
    print(user.name)
    print(user.age)
    print(user.address as Any)
}
