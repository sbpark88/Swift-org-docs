import Foundation

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

// ----------

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

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria) // OK

print(oscar) // Player(name: "Oscar", health: 8, energy: 10)
print(maria) // Player(name: "Maria", health: 7, energy: 10)


oscar.shareHealth(with: &oscar) // error: inout arguments are not allowed to alias each other
