import Foundation

class Department {
    var name: String
    var course: [Course]
    init(name: String) {
        self.name = name
        self.course = []
    }
    deinit { print("Department '\(name)' is being deinitialized") }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
    deinit { print("Course '\(name)' is being deinitialized") }
}

var department: Department?
var intro: Course?
var intermediate: Course?
var advanced: Course?

department = Department(name: "Horticulture")
intro = Course(name: "Survey of Planets", in: department!)
intermediate = Course(name: "Growing Common Herbs", in: department!)
advanced = Course(name: "Caring for Tropical Plants", in: department!)

intro?.nextCourse = intermediate!
intermediate?.nextCourse = advanced!
department?.course = [intro!, intermediate!, advanced!]

let printCourse = { (variableName: String, course: Course) in
    print("""
          [\(variableName)]
          Class : \(course)
          Name : \(course.name)
          Department : \(course.department)
          Next Course : \(course.nextCourse as Any)
          
          """)
}

printCourse("intro", intro!)
printCourse("intermediate", intermediate!)
printCourse("advanced", advanced!)

print("[department] : \(department!),    \(String(describing: department!.name)),    \(String(describing: department!.course))")

// Unsafe Unowned References - error case
department = nil
print(department as Any)   // nil
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    print("1")
    print(intro!.name)
    print(intro!.department)
    print("2")
}

// Unsafe Unowned References - success case
//do {
//    department = nil
//    advanced = nil
//    intermediate = nil
//    intro = nil
//}
// Department 'Horticulture' is being deinitialized
// Course 'Survey of Planets' is being deinitialized
// Course 'Growing Common Herbs' is being deinitialized
// Course 'Caring for Tropical Plants' is being deinitialized
