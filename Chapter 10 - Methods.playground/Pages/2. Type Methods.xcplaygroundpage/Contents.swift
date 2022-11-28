import Foundation

// Define the game rules.
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


// Define the Player
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

// "Harry", "Ron", "Hermione"
// Play Game!!
print("---------------- Harry ----------------")
var room1 = Player(name: "Harry")
print("\(room1.tracker), Harry is playing level \(room1.tracker.currentLevel).")

room1.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
print("\(room1.tracker), Harry is playing level \(room1.tracker.currentLevel).")


print("---------------- Ron ----------------")
var room2 = Player(name: "Ron")
print("\(room2.tracker), Ron is playing level \(room2.tracker.currentLevel).")
if LevelTracker.isUnlocked(2) {
    room2.tracker.advance(to: 2)
}
print("\(room2.tracker), Ron is playing level \(room2.tracker.currentLevel).")


print("---------------- Hermione ----------------")
room1 = Player(name: "Hermione")
print("\(room1.tracker), Hermione is playing level \(room1.tracker.currentLevel).")
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
if room1.tracker.advance(to: 6) {
    print("Hermione is now on level 6")
} else {
    print("level 6 hasn't yet been unlocked")
}





