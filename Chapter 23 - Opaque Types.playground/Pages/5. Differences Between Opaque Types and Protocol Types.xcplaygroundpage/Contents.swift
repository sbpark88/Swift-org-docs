import Foundation

protocol Person {
    var name: String { get }
    var age: Int { get }
}

struct Student: Person {
    var name: String
    var age: Int
    var address: String
}

//func generalFunction<T: Person>(who: T) -> T {
//    who
//}

func generalFunction<T: Person>(who: T) -> Person {
    who
}

//func generalFunction<T: Person>(who: T) -> T {
//    who.name
//}

//func opaqueFunction<T: Person>(who: T) -> some T {
//    who.name
//}

func opaqueFunction<T: Person>(who: T) -> some Person {
    who
}
