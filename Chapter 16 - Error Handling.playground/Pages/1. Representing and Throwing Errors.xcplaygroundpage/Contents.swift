import Foundation

enum VendingMachineError: Error {
case invalidSelection
case insufficientFunds(coinsNeeded: Int)
case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
