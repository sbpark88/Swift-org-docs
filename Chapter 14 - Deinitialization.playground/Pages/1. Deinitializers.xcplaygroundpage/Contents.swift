import Foundation

// Bank
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

// Player
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}


// Play Game
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// Prints "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// Prints "There are now 9900 coins left in the bank"

print("--------------------------------------")
playerOne?.win(coins: 2_000)
print("A new player has joined the game with \(playerOne?.coinsInPurse ?? 0) coins")
// Prints "A new player has joined the game with 2100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// Prints "There are now 7900 coins left in the bank"

print("--------------------------------------")
var playerTwo: Player? = Player(coins: 1000)
print("PlayerOne has joined the game with \(playerOne!.coinsInPurse) coins")
print("PlayerTwo has joined the game with \(playerTwo!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

print("--------------------------------------")
// The playerOne has now left the game.
playerOne = nil
if playerOne != nil {
    print("PlayerOne has joined the game with \(playerOne!.coinsInPurse) coins")
} else {
    print("PlayerOne has left the game")
}
if playerTwo != nil {
    print("PlayerTwo has joined the game with \(playerTwo!.coinsInPurse) coins")
} else {
    print("PlayerTwo has left the game")
}
print("There are now \(Bank.coinsInBank) coins left in the bank")

print("--------------------------------------")
// The playerTwo has now left the game.
playerTwo = nil
if playerOne != nil {
    print("PlayerOne has joined the game with \(playerOne!.coinsInPurse) coins")
} else {
    print("PlayerOne has left the game")
}
if playerTwo != nil {
    print("PlayerTwo has joined the game with \(playerTwo!.coinsInPurse) coins")
} else {
    print("PlayerTwo has left the game")
}
print("There are now \(Bank.coinsInBank) coins left in the bank")
