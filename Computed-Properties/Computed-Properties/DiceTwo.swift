//
//  DiceTwo.swift
//  Computed-Properties
//
//  Created by Hogwarts on 2022/12/15.
//

import Foundation

struct DiceTwo {
    @OneToSix var currentDice: Int
    func isEven() -> Bool {
        currentDice.isMultiple(of: 2)
    }

    mutating func rollDice() {
        currentDice = Int.random(in: 1...6)
    }

    func printDice() {
        print("The current numer of dice is \(currentDice), then is \(isEven() ? "even" : "odd") number.")
    }
}
