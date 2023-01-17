import Foundation

// 1. Functions Without Parameters
func sayHelloWorld() -> String {
    "hello, world"
}

print(sayHelloWorld())


print("---------------------------------------------")
// 2. Functions With Multiple Parameters
func greet(person: String) -> String {
    "Hello, \(person)!"
}

func greetAgain(person: String) -> String {
    "Hello again, \(person)!"
}

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: false))
print(greet(person: "Tim", alreadyGreeted: true))


print("---------------------------------------------")
// 3. Functions Without Return Values

//func greetVoid(person: String) -> Void {
//    print("Hello, \(person)!")
//}

// `Return Type`은 Void일 때 한하여 생략될 수 있다(Optional).
func greetVoid(person: String) {
    print("Hello, \(person)!")
}

greetVoid(person: "Harry")

print("---------------------------------------------")
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

print(printWithoutCounting(string: "hello, world"))


print("---------------------------------------------")
// 4. Functions with Multiple Return Values

// `Swift`에서 `tuple`을 이용해 다음과 같이 한 번에 `compound` 시켜 변수에 할당할 수 있다.
let (alphabetA, alphabetB) = ("A", "B")
print("alphabetA is \(alphabetA) and alphabetB is \(alphabetB)")

// 함수 역시 `tuple`을 이용해 함수의 `Return Type`에 여러 값을 `compound` 시켜 한 번에 `One compound return value`로 반환할 수 있다.

//let intArray: [Int] = [31, 6, 43, 13, 6, 1, 56, 5, 88, 24]

//func minMax(array: [Int]) -> (Int, Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//// `Return Value`를 `Tuple`을 이용해 각각 `Int` 타입의 상수 `minNumber`, `maxNumber`에 받는다.
//let (minNumber, maxNumber): (Int, Int) = minMax(array: intArray)
//print("min is \(minNumber) and max is \(maxNumber)")
//
//
//// `Return Value`를 `Tuple` 타입의 단일 상수 `bounds`에 받는다. 이 때 `Tuple`의 각 값에 접근할 수 있도록 `min`과 `max`라는 `label`을 붙여준다.
//let bounds: (min: Int, max: Int) = minMax(array: intArray)
//print("min is \(bounds.min) and max is \(bounds.max)")


// 만약, `Return Type`에 미리 `label`을 붙여주면 반환 받은 값은 별도의 `label` 지정 없이 해당 `label`을 이용할 수 있다.
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//let bounds = minMax(array: intArray)
//print("min is \(bounds.min) and max is \(bounds.max)")

print("---------------------------------------------")
// 5. Optional Tuple Return Types

let intArray: [Int] = [31, 6, 43, 13, 6, 1, 56, 5, 88, 24]

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: []) {
    print("min is \(bounds.min) and max is \(bounds.max)")
} else {
    print("input array is empty.")
}

if let bounds = minMax(array: intArray) {
    print("min is \(bounds.min) and max is \(bounds.max)")
} else {
    print("input array is empty.")
}


print("---------------------------------------------")
// 6. Functions With an Implicit Return

// 함수의 전체 본문이 단일 표현식인 경우 함수는 암시적으로 해당 표현식을 반환한다.

func add(_ num1: Int, _ num2: Int) -> Int {
    num1 + num2
}

print(add(6, 8))

