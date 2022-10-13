import Foundation


// 1. Single `if` statement

//let temperatureInCelsius = 32
//if temperatureInCelsius > 28 {
//    print("It's hot. Turn on the air conditioner.")
//}

// 2. `if` statement with alternative statements when if false using `else` clause

//let temperatureInCelsius = 24
//if temperatureInCelsius > 28 {
//    print("It's hot. Turn on the air conditioner.")
//} else {
//    print("It's nice weather. Go out for a walk.")
//}

// 3. Chaining multiple `if` statements

let temperatureInCelsius = 3
if temperatureInCelsius > 28 {
    print("It's hot. Turn on the air conditioner.")
} else if temperatureInCelsius < 10 {
    print("It's cole. Turn on the bnoiler.")
} else {
    print("It's nice weather. Go out for a walk.")
}
