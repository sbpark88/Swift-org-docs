import Foundation

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}


// ----------

//var playerInformation = (health: 10, energy: 20)
//balance(&playerInformation.health, &playerInformation.energy)
// error: conflicting access to properties of playerInformation


func balance(_ player: inout (health: Int, energy: Int)) {
    let sum = player.health + player.energy
    player.health = sum / 2
    player.energy = sum - player.health
}

var playerInformation = (health: 10, energy: 20)
balance(&playerInformation)
print(playerInformation) // (health: 15, energy: 15)



//var holly = Player(name: "Holly", health: 10, energy: 20)
//balance(&holly.health, &holly.energy)  // error: Execution was interrupted, reason: signal SIGABRT.
//print(holly)

func someFunction() {
    var holly = Player(name: "Holly", health: 10, energy: 20)
    balance(&holly.health, &holly.energy) // Player(name: "Holly", health: 15, energy: 15)
    print(holly)
}

someFunction()
