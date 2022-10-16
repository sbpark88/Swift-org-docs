import Foundation


// 1. Alternative to the if statement for multiple states

//let someCharacter: Character = "z"
//switch someCharacter {
//case "a":
//    print("The first letter of the alphabet")
//case "z":
//    print("The last letter of the alphabet")
//default:
//    print("Some other character")
//}
// Prints The last letter of the alphabet

print("--------------------------------------------")
// 2. No Implicit Fallthrough

//let anotherCharacter: Character = "z"
//switch anotherCharacter {
//case "a": fallthrough
//case "A":
//    print("The first letter of the alphabet")
//case "z": fallthrough
//case "Z":
//    print("The last letter of the alphabet")
//default:
//    print("Some other character")
//}


// 하지만 `Swift`에서 위와 같은 방식은 권장되는 방식이 아니다. 대신 `Swift`에서는 다른 언어에서 case가 `single case match`만 매칭할 수 있는 것과 달리 `multiple case match`를 지원한다.

let anotherCharacter: Character = "z"
switch anotherCharacter {
case "a", "A":
    print("The first letter of the alphabet")
case "z", "Z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints The last letter of the alphabet

// > 가독성을 위해 `multiple case`를 줄바꿈 해 매칭할 수 있다.

print("--------------------------------------------")
// - Interval Matching

//let approximateCount: Int = 62
//let countedThings: String = "moons orbiting Saturn"
//let naturalCount: String
//switch approximateCount {
//case 0:
//    naturalCount = "no"
//case 1..<5:
//    naturalCount = "a few"
//case 5..<12:
//    naturalCount = "several"
//case 12..<100:
//    naturalCount = "dozens of"
//case 100..<1000:
//    naturalCount = "hundreds of"
//default:
//    naturalCount = "many"
//}
//print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."

// switch true

let approximateCount: Int = 62
let countedThings: String = "moons orbiting Saturn"
let naturalCount: String
switch true {
case approximateCount == 0:
    naturalCount = "no"
case (approximateCount >= 1) && (approximateCount < 5):
    naturalCount = "a few"
case (approximateCount >= 5) && (approximateCount < 12):
    naturalCount = "several"
case (approximateCount >= 12) && (approximateCount < 100):
    naturalCount = "dozens of"
case (approximateCount >= 100) && (approximateCount < 1000):
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// // Prints "There are dozens of moons orbiting Saturn."

print("--------------------------------------------")
// - 데이터 유효성 검사


struct User {
    var name: String?
    var age: Int?
    var phone: String?
    var height: Double?
    var weight: Double?
}

func validateUser(of user: User?) -> Bool {
    guard let user = user else { return false }
    
    switch true {
    case user.age == nil: print("age is nil"); return false
    case (user.age! < 0) || (user.age! > 130): print("invalid age"); return false
    case user.name == nil: print("name is nil"); return false
    case user.phone == nil: print("phone is nil"); return false
    case user.height == nil: print("height is nil"); return false
    case user.weight == nil: print("weight is nil"); return false
    default: return true
    }
}

//var myUser = User(name: "홍길동", age: 132, phone: "010-4434-3556", height: 183.2, weight: 74)
//var myUser = User(name: "장보고", age: 42, phone: "010-2342-1234", height: 175.2, weight: nil)
var myUser = User(name: "이순신", age: 30, phone: "010-7423-3464", height: 169.6, weight: 52)

let result: Bool? = validateUser(of: myUser)

print("Validation check result of myUser is \(result!).")

print("--------------------------------------------")
// - Tuples

whereIs((0, 0))
whereIs((3, 0))
whereIs((1, 2))
whereIs((3, 2))

func whereIs(_ point: (Int, Int)) {
    switch point {
    case (0, 0):
        print("\(point) is at the origin")
    case (_, 0):
        print("\(point) is on the x-axis")
    case (0, _):
        print("\(point) is on the y-axis")
    case (-2...2, -2...2):
        print("\(point) is inside the box")
    default:
        print("\(point) is outside of the box")
    }
}


print("--------------------------------------------")
// - Value Bindings

anotherPoint((4, 0))
anotherPoint((0, 2))
anotherPoint((2, 6))

func anotherPoint(_ point: (Int, Int)) {
    switch point {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
}

print("--------------------------------------------")
// - Where


yetAnotherPoint((4, 4))
yetAnotherPoint((3, -3))
yetAnotherPoint((3, 7))

func yetAnotherPoint(_ point: (Int, Int)) {
    switch point {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
    }
}


//func yetAnotherPoint(_ point: (Int, Int)) {
//    let (x, y) = point
//    switch true {
//    case x == y:
//        print("(\(x), \(y)) is on the line x == y")
//    case x == -y:
//        print("(\(x), \(y)) is on the line x == -y")
//    default:
//        print("(\(x), \(y)) is just some arbitrary point")
//    }
//}

print("--------------------------------------------")
// - Compound Cases

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}


stillAnotherPoint((9, 0))

func stillAnotherPoint(_ point: (Int, Int)) {
    switch point {
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")
    default:
        print("Not on an axis")
    }
}

print("--------------------------------------------")

let anotherResult: Bool? = validateUserWithCompoundCases(of: User(name: "홍길동", age: 132, phone: "010-4434-3556", height: 183.2, weight: 74))

print("Validation check result is \(anotherResult!).")

func validateUserWithCompoundCases(of user: User?) -> Bool {
    guard let user = user else { return false }
    
    switch true {
    case user.age == nil, user.name == nil,
        user.phone == nil, user.height == nil,
        user.weight == nil
        : print("age is nil"); return false
    case (user.age! < 0) || (user.age! > 130): print("invalid age"); return false
    default: return true
    }
}
