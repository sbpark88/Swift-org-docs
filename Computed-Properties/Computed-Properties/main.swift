//
//  main.swift
//  Computed-Properties
//
//  Created by Hogwarts on 2022/12/15.
//

import Foundation

struct App {

    func getValueFromComputedProperties() {
        let dice = DiceOne()
        (1...100000).forEach { _ in
            _ = dice.isEven
        }
    }

    func getValueFromClosures() {
        let dice = DiceTwo()
        (1...100000).forEach { _ in
            _ = dice.isEven()
        }
    }

}
