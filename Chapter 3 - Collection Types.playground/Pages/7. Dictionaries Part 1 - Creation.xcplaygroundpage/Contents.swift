import Foundation

// 7. Dictionaries (사전) Part 1 - Creation
/*
 A collection whose elements are key-value pairs.
 Swift’s Dictionary type is bridged to Foundation’s NSDictionary class.
 */

// 1. Hash Values
// A dictionary 'Key' type must conform to the 'Hashable' protocol, like a set’s value type.

// 2. Dictionary Type Syntax
// 다음 두 가지 형태의 `initializer syntax`를 사용할 수 있다.
// var someDictionary = Dictionary<Key, Value>()
// var someDictionary: [Key: Value] = [:]   // Dictionary Type Shorthand Syntax (딕셔너리의 축약형 문법)

// 2. Creating an Empty Dictionary (빈 딕셔너리 생성)
//var someDictionary = Dictionary<Int, String>()
var someDictionary: [Int: String] = [:]
//var someDictionary = [Int: String]()
someDictionary[1] = "Apple"
someDictionary[2] = "Google"

print(someDictionary)

someDictionary = [:]
print(someDictionary)
print(type(of: someDictionary))


/*
 someDictionary is now an empty dictionary, but is still of type Dictionary<Int, String>
 */

// 3. Creating a Dictionary with a Dictionary Literal (리터럴을 이용한 Dictionary의 생성)
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//print(airports)

// If the dictionary literal contains key-value pairs are only one type, 'Swift' infer the type of the dictionary.
//var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//print(airports)


// In this case, `Swift` cannot infer the type, because of the dictionary literal has more than one value type.
//var airports = ["YYZ": "Toronto Pearson", "ZIP-CODE": 6301] // error occured, add explicit type [String: Any] annotation
//print(airports)


// The dictionary can store two or more types at value, however, in this case cannot use type inference.
// `Dictionay`는 `Value`에 2 가지 이상의 타입을 저장할 수 있지만 `Type Inference`를 사용할 수 없다.
// 또한 Any가 허용되는 것은 `Value`만이다. `Key`는 저장하려는 두 `Key`가 모두 `Hashable` 하더라도
// `explicit type annotation`으로 선언하기 위해서는 `Any`로 선언해야하는데, 이 `Any`는 `Non-Hashable`이기 때문이이다.
// 즉, `[String: Any]`는 가능하지만 `[Any: String]`는 불가능하다.
// var airports: [String: Any]
// var airports: [Any: String] // error: type 'Any' does not conform to protocol 'Hashable'

var airports: [String: Any] = ["YYZ": "Toronto Pearson", "ZIP-CODE": 6301]
print(airports)

