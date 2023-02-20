import Foundation

protocol Human {
    var name: String { get set }
    var age: Int { get set }
    
    init(name: String, age: Int)
}

struct Student: Human {
    var name: String
    
    var age: Int
    
    init(name: String = "[Unknown]", age: Int) {
        self.name = name
        self.age = age
    }
    
    func identification() {
        print("My name is \(self.name) and I am \(self.age) years old")
    }
}

var jamie = Student(name: "Jamie", age: 20)
jamie.identification()

var kate = Student(age: 22)
kate.identification()
