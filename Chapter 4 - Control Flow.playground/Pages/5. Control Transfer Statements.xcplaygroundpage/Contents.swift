import Foundation

// 1. continue

//let puzzleInput = "great minds think alike"
//var puzzleOutput = ""
//let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
//for character in puzzleInput {
//    if charactersToRemove.contains(character) {
//        continue
//    }
//    puzzleOutput.append(character)
//}
//print(puzzleOutput)     // grtmndsthnklk

print("-----------------------------------------")
// 2. break

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        break
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)     // gr

let someLetter = "B"

switch someLetter {
case "A": print("This character is 'A'.")
case "B": break
case "C": print("This character is 'C'.")
default: break
}

print("-----------------------------------------")
// 3. fallthrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

print("-----------------------------------------")
// 4. return

print("-----------------------------------------")
// 5. throw

print("-----------------------------------------")
// 6. Labeled Statements

func rollDice() -> Int {
    Int.random(in: 1...6)
}


// This 'break' only breaks 'switch' statements.
for _ in 1...10 {
    let dice1: Int = rollDice()
    let dice2: Int = rollDice()
    
    print("Whitout label >> dice1: \(dice1), dice2: \(dice2), therefore dice1 > dice2 is \(dice1 > dice2)")
    
    switch true {
    case dice1 > dice2: break
    default: continue
    }
}

print("")
// This 'break' breaks label loop the 'gameLoop'.
gameLoop: while true {
    let dice1: Int = rollDice()
    let dice2: Int = rollDice()
    
    print("With label >> dice1: \(dice1), dice2: \(dice2), therefore dice1 > dice2 is \(dice1 > dice2)")
    
    switch true {
    case dice1 > dice2: break gameLoop
    default: continue
    }
}

print("-----------------------------------------")
// 7. Early Exit


struct User {
    var name: String?
    var age: Int?
    var phone: String?
    var height: Double?
    var weight: Double?
}

func validateUser(of user: User?) -> Bool {
    guard let user = user else { return false }
    
    guard let age = user.age else { print("age is nil"); return false }
    if (age < 0) || (age > 130) { print("invalid age"); return false }
    guard let _ = user.name else { print("name is nil"); return false }
    guard let _ = user.phone else { print("phone is nil"); return false }
    guard let _ = user.height else { print("height is nil"); return false }
    guard let _ = user.weight else { print("weight is nil"); return false }
    return true
}

//var myUser = User(name: "홍길동", age: 132, phone: "010-4434-3556", height: 183.2, weight: 74)
//var myUser = User(name: "장보고", age: 42, phone: "010-2342-1234", height: 175.2, weight: nil)
var myUser = User(name: "이순신", age: 30, phone: "010-7423-3464", height: 169.6, weight: 52)

let result: Bool? = validateUser(of: myUser)

print("Validation check result of myUser is \(result!).")
