import Foundation

// 1. While
// A 'While' loop performs a set of statements until a condition becomes false.

// 주사위를 2개를 굴려 곱한 값이 20이상이면 반복문을 중지한다.
// -> 반복 횟수를 알 수 없다.
// -> while loop 사용이 적합하다.

//var result = 0
//var rollCount = 0
//
//while result < 20 {
//    result = rollDice() * rollDice()
//    rollCount += 1
//    print(result)
//}
//print("The dice are rolled \(rollCount) times.")





// 2. Repeat-While


// `repeat-while`문이 `while`문과 다른 점은 우선 1번 실행 후 조건을 검사하기 때문에
// 반복을 위한 condition이 만족하지 않더라도 최소한 1번은 실행을 한다는 것이다

//var result = 25
//var rollCount = 0
//
//while result < 20 {
//    result = rollDice() * rollDice()
//    rollCount += 1
//    print(result)
//}
// print("The dice are rolled \(rollCount) times.")
// 초깃값이 20 이상이므로 실행하지 않는다.

//var result = 25
//var rollCount = 0
//
//repeat {
//    result = rollDice() * rollDice()
//    rollCount += 1
//    print(result)
//} while result < 20
//print("The dice are rolled \(rollCount) times.")

// > 초깃값이 20 이상이지만 최초 1회 실행을 한다. 이때 result가 계산되므로 해당 로직은 1 ~ n번의 반복을 하게 된다.



// while true

// - !condition

//var result = 25
//var rollCount = 0
//
//while true {
//    result = rollDice() * rollDice()
//    rollCount += 1
//    print(result)
//
//    if !(result < 20) {
//        break
//    }
//}
//print("The dice are rolled \(rollCount) times.")

// - else break
//var result = 25
//var rollCount = 0
//
//while true {
//    result = rollDice() * rollDice()
//    rollCount += 1
//    print(result)
//
//    if result < 20 {
//    } else {
//        break
//    }
//}
//print("The dice are rolled \(rollCount) times.")


// - logical opposite condition

var result = 25
var rollCount = 0

while true {
    result = rollDice() * rollDice()
    rollCount += 1
    print(result)
    
    if result >= 20 {
        break
    }
}
print("The dice are rolled \(rollCount) times.")



















func rollDice() -> Int {
    Int.random(in: 1...6)
}
