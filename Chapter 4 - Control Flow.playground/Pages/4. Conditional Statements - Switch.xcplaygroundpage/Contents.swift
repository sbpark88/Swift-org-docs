import Foundation

// 2. switch

// 여러 개의 `condition`이 주어지는 경우 `if ~ else if ~ else if ... else`는
// `switch`문을 이용해 대체할 수 있다.
// Syntax
// switch some value to consider {
// case value 1:
//     respond to value 1
// case value 2,
//      value 3:
//     respond to value 2 or 3
// default:
//     otherwise, do something else
// }

// let someCharacter: Character = "o"
// switch someCharacter {
// case "a":
//     print("The first letter of the alphabet")
// case "z":
//     print("The last letter of the alphabet")
// default:
//     print("Some other character")
// }
// Prints "The last letter of the alphabet"

// `if ~ else if ~ else if ... else`에서 모든 `condition`을 만족하지 않는 경우 실행하는 `else`는 `Optional`이지만
// `switch`에서 `default`은 필수다. 물론, `else`를 구현하지 않는 것처럼 아무것도 하지 않기를 원한다면 `default`에 `break`만 선언하면 된다.
// > `TypeScript(JavaScript)`와 같은 일부 언어에서는 `default`가 `Optional`이지만 `Swift`에서는 필수로 구현해야한다.


// - No Implicit Fallthrough

// typescript로 바꾸자
// ```javascript
// const anotherCharacter = "a"
// switch (anotherCharacter) {
//     case "a":
//     case "A":
//         console.log("The letter A")
//         break
//     default:
//         console.log("Not the letter A")
// }
// // Prints "The letter A"
// ```

// let anotherCharacter: Character = "a"
// switch anotherCharacter {
// case "a": // Invalid, the case has an empty body
// case "A":
//     print("The letter A")
// default:
//     print("Not the letter A")
// }
// This will report a compile-time error.

// `Objective-C`를 포함한 대부분의 언어가 만족하는 처음 만족하는 `case`를 실행한 후 아래 case를 계속 실행하는 것(fall through the bottom of each case)과 달리
// `Swift`의 `switch`문은 처음 만족하는 `case`를 실행한 후 `즉시 종료`된다. 따라서 `Swift`에서는 위와 같은 로직은 에러가 발생된다.
// 따라서 `Swift`의 `switch`문은 break를 명시하지 않아도 된다. 반대로 의도적으로 `fallthrough` 시키길 원하면 `fallthrough`를 명시해야한다.

// let anotherCharacter: Character = "a"
// switch anotherCharacter {
// case "a": fallthrough
// case "A":
//     print("The letter A")
// default:
//     print("Not the letter A")
// }
// // Prints "The letter A"

// 하지만 `Swift`에서 위와 같은 방식은 권장되는 방식이 아니다. 대신 `Swift`에서는 다른 언어에서 case가 `single case match`만 매칭할 수 있는 것과 달리 `multiple case match`를 지원한다.

// let anotherCharacter: Character = "a"
// switch anotherCharacter {
// case "a", "A":
//     print("The letter A")
// default:
//     print("Not the letter A")
// }
// Prints "The letter A"

// > 가독성을 위해 `multiple case`를 줄바꿈 해 매칭할 수 있다.

// - Interval Matching

// `Swift`의 `switch`문은 `multiple case match`를 지원하기 때문에 `range operator`를 이용해 다음과 같은 매칭을 할 수 있다.
// let approximateCount = 62
// let countedThings = "moons orbiting Saturn"
// let naturalCount: String
// switch approximateCount {
// case 0:
//     naturalCount = "no"
// case 1..<5:
//     naturalCount = "a few"
// case 5..<12:
//     naturalCount = "several"
// case 12..<100:
//     naturalCount = "dozens of"
// case 100..<1000:
//     naturalCount = "hundreds of"
// default:
//     naturalCount = "many"
// }
// print("There are \(naturalCount) \(countedThings).")
// // Prints "There are dozens of moons orbiting Saturn."


// switch true
// 여기 조금 특별한 방식의 `switch`문이 있다.
// - 범위

// typescript로 바꾸자
// ```javascript
// const approximateCount = 62
// const countedThings = "moons orbiting Saturn"
// let naturalCount
// switch (true) {
//     case approximateCount === 0:
//         naturalCount = "no"
//         break
//     case (approximateCount >= 1) && (approximateCount < 5):
//         naturalCount = "a few"
//         break
//     case (approximateCount >= 5) && (approximateCount < 12):
//         naturalCount = "several"
//         break
//     case (approximateCount >= 12) && (approximateCount < 100):
//         naturalCount = "dozens of"
//         break
//     case (approximateCount >= 100) && (approximateCount < 1000):
//         naturalCount = "hundreds of"
//         break
//     default:
//         naturalCount = "many"
// }
// console.log(`There are ${naturalCount} ${countedThings}.`)
// // Prints "There are dozens of moons orbiting Saturn."
// ```

// `multiple case match`를 지원하지 않는 대부분의 언어에서는 범위를 매칭하기 위해 위와 같이 코딩한다.
// 마찬가지로 `Swift`에서도 아래와 같은 방식으로 코딩할 수 있지만 `Swift`에서는 `Interval Matching`을 지원하기 때문에 이를 이용하는 것이 권장된다.

// ```swift
// let approximateCount = 62
// let countedThings = "moons orbiting Saturn"
// let naturalCount: String
// switch true {
//     case approximateCount == 0:
//         naturalCount = "no"
//     case (approximateCount >= 1) && (approximateCount < 5):
//         naturalCount = "a few"
//     case (approximateCount >= 5) && (approximateCount < 12):
//         naturalCount = "several"
//     case (approximateCount >= 12) && (approximateCount < 100):
//         naturalCount = "dozens of"
//     case (approximateCount >= 100) && (approximateCount < 1000):
//         naturalCount = "hundreds of"
//     default:
//         naturalCount = "many"
// }
// print("There are \(naturalCount) \(countedThings).")
// // Prints "There are dozens of moons orbiting Saturn."
// ```

// - 데이터 유효성 검사
// https://kowoohyuk.tistory.com/133
// https://ui.toast.com/posts/ko_20210603


//struct User {
//  var name: String?
//  var age: Int?
//  var phone: String?
//  var height: Double?
//  var weight: Double?
//}


//var myUser1 = User(name: "홍길동", age: 128, phone: "010-4434-234", height: 183.2, weight: nil)
//print("The 'myUser1' validation check result is \(validateUser(of: myUser1))")
//
//var myUser2 = User(name: "홍길동", age: 128, phone: "010-4434-234", height: 183.2, weight: 78.5)
//print("The 'myUser2' validation check result is \(validateUser(of: myUser2))")
//
//// 단순히 nil 체크만 했지만 정규표현식을 추가하거나 값의 범위를 검사하는 유효성 검사와 throw Error 등을 처리할 수 있다.
//
//func validateUser(of user: User?) -> Bool {
//  switch true {
//  case user == nil: return false
//  case user?.age == nil: return false
//  case user?.name == nil: return false
//  case user?.phone == nil: return false
//  case user?.height == nil: return false
//  case user?.weight == nil: return false
//  default: return true
//  }
//}



/* const user = {
 firstName: "Seán",
 lastName: "Barry",
 email: "my.address@email.com",
 number: "00447123456789",
 };
 
 switch (true) {
 case !user:
 throw new Error("User must be defined.");
 case !user.firstName:
 throw new Error("User's first name must be defined");
 case typeof user.firstName !== "string":
 throw new Error("User's first name must be a string");
 // ...더 많은 유효성 검사들
 default:
 return user;
 } */



// - Tuples




