import Foundation

// 1. Stored Properties
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
print(rangeOfThreeItems)    // FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems)    // FixedLengthRange(firstValue: 6, length: 3)

//rangeOfThreeItems.length = 4    // Cannot assign to property: 'length' is a 'let' constant


print("------------------------------------")
// 2. Stored Properties and Instance Variables
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 3 // Cannot assign to property: 'rangeOfFourItems' is a 'let' constant

class FixedVolumeRange {
    var firstValue: Int
    let volume: Int
    
    init(firstValue: Int, volume: Int) {
        self.firstValue = firstValue
        self.volume = volume
    }
}

let rangeOfFiveVolumes = FixedVolumeRange(firstValue: 0, volume: 5)
print("rangeOfFiveVolumes(firstValue: \(rangeOfFiveVolumes.firstValue), volume: \(rangeOfFiveVolumes.volume))")
// rangeOfFiveVolumes(firstValue: 0, volume: 5)

rangeOfFiveVolumes.firstValue = 1
print("rangeOfFiveVolumes(firstValue: \(rangeOfFiveVolumes.firstValue), volume: \(rangeOfFiveVolumes.volume))")
// rangeOfFiveVolumes(firstValue: 1, volume: 5)


print("------------------------------------")
// 3. Lazy Stored Properties
//class Classroom {
//    let subject: Subject
//    let maxStudents: Int
//    var applicant: Int = 0
//
//    lazy var students: Int = {
//        maxStudents > applicant ? maxStudents : applicant
//    }()
//
//    enum Subject {
//        case Korean, English, Math, History, Science
//    }
//
//    init(subject: Subject, maxStudents: Int) {
//        self.subject = subject
//        self.maxStudents = maxStudents
//    }
//}

struct Classroom {
    let subject: Subject
    let maxStudents: Int
    var applicant: Int = 0
    
    lazy var students: Int = {
        applicant > maxStudents ? maxStudents : applicant
    }()
    
    enum Subject {
        case Korean, English, Math, History, Science
    }
}

var mathClass = Classroom(subject: .Math, maxStudents: 30)
var englishClass = Classroom(subject: .English, maxStudents: 50)

print("Math")
Array(1...43).forEach { i in mathClass.applicant += 1 }
print(mathClass)    // Classroom(subject: __lldb_expr_54.Classroom.Subject.Math, maxStudents: 30, applicant: 43, $__lazy_storage_$_students: nil)
mathClass.students
print(mathClass)    // Classroom(subject: __lldb_expr_54.Classroom.Subject.Math, maxStudents: 30, applicant: 43, $__lazy_storage_$_students: Optional(30))
print("\(mathClass.students) students in math class")       // 30 students in math class


print("\n\nEnglish")
Array(1...10).forEach { i in englishClass.applicant += 1 }
print("\(englishClass.students) students in english class")    // 10 students in english class

Array(1...35).forEach { i in englishClass.applicant += 1 }
print("\(englishClass.students) students in english class")    // 10 students in english class

print(englishClass) // Classroom(subject: __lldb_expr_74.Classroom.Subject.English, maxStudents: 50, applicant: 45, $__lazy_storage_$_students: Optional(10))


print("------------------------------------")
// 4. Stored Properties and Instance Variables
