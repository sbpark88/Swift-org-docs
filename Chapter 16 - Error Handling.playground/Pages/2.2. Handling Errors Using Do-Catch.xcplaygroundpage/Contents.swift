import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}


// Propagating Errors Using Throwing Functioons
let favoriteSnacks = [
    "Alice": "Chips",
    "Queen": "Licorice",
    "Eve": "Pretzels"
]


// 1. Examples 1
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}


var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}


print("----------------------------------------")
// 2. Exmaples 2
//func buySnack(with item: String) throws {
//    do {
//        try vendingMachine.vend(itemNamed: item)
//    } catch is VendingMachineError {
//        print("Couldn't buy that from the vending machine.")
//    }
//}
//
//do {
//    try buySnack(with: "Beat-Flavored Chips")
//} catch {
//    print("Unexpected non-vending-machine-related error: \(error)")
//}


print("----------------------------------------")
// 2. Exmaples 2
func buySnack(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection,
            VendingMachineError.insufficientFunds,
            VendingMachineError.outOfStock {
        print("""
              Couldn't buy that from the vending machine
              because of invalid selection, out of stock, or not enough money.
              """)
    }
}

do {
    try buySnack(with: "Beat-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
