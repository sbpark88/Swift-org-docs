import Foundation

// 1. Computed Properties
// getter
//struct Classroom {
//    let subject: Subject
//    let maxStudents: Int
//    var applicant: Int = 0
//
//    var students: Int {
//        get {
//            applicant > maxStudents ? maxStudents : applicant
//        }
//    }
//
//    enum Subject {
//        case Korean, English, Math, History, Science
//    }
//}

var englishClass = Classroom(subject: .English, maxStudents: 50)

Array(1...10).forEach { i in englishClass.applicant += 1 }
print("\(englishClass.students) students in math class")    // 10 students in math class

Array(1...35).forEach { i in englishClass.applicant += 1 }
print("\(englishClass.students) students in math class")    // 45 students in math class

Array(1...10).forEach { i in englishClass.applicant += 1 }
print("\(englishClass.students) students in math class")    // 50 students in math class

print(englishClass) // Classroom(subject: main.Classroom.Subject.English, maxStudents: 50, applicant: 55)

print("------------------------------------")
// getter and setter
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}

//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//        set (newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
//    }
//}

var square = Rect(origin: Point(),
                  size: Size(width: 10, height: 10))

print(square.center)    // Point(x: 5.0, y: 5.0)

square.center = Point(x: 17.5, y: 17.5)
print("""

square.origin: \(square.origin)
square.center: \(square.center)

""")


print("------------------------------------")
// 2. Shorthand Setter/Getter Declaration
// Shorthand Setter Declaration
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//        set {
//            origin.x = newValue.x - (size.width / 2)
//            origin.y = newValue.y - (size.height / 2)
//        }
//    }
//}


// Shorthand Getter Declaration
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


print("------------------------------------")
// 3. Read-Only COmputed Properties
struct Classroom {
    let subject: Subject
    let maxStudents: Int
    var applicant: Int = 0
    
    var students: Int {
        applicant > maxStudents ? maxStudents : applicant
    }
    
    enum Subject {
        case Korean, English, Math, History, Science
    }
}
