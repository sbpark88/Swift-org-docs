//
//  DiceOne.swift
//  Computed-Properties
//
//  Created by Hogwarts on 2022/12/15.
//

import Foundation

struct DiceOne {
    @OneToSix var currentDice: Int
    var isEven: Bool {
        currentDice.isMultiple(of: 2)
    }
    
    mutating func rollDice() {
        currentDice = Int.random(in: 1...6)
    }
    
    func printDice() {
        print("The current numer of dice is \(currentDice), then is \(isEven ? "even" : "odd") number.")
    }
}

@propertyWrapper
struct OneToSix {
    private var number = 1
    var wrappedValue: Int {
        get { number }
        set {
            switch newValue {
            case 1...6: number = newValue
            case ..<1: number = 1
            case 7...: number = 6
            default: fatalError("Maybe \(newValue) is not an integer value.")
            }
        }
    }
}
