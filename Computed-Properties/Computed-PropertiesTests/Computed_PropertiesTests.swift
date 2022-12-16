//
//  Computed_PropertiesTests.swift
//  Computed-PropertiesTests
//
//  Created by Hogwarts on 2022/12/15.
//

import XCTest

final class Computed_PropertiesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialValue_Is_Number_One() throws {
        // Arrange
        let dice = DiceOne()
        let currentDice:Int = dice.currentDice
        
        // Act
        
        // Assert
        XCTAssertEqual(currentDice, 1, "The initial value of the 'currentDice' is should be 1.")
        
    }
    func testCurrentDice_Is_Greater_Than_Or_Equal_To_One() throws {
        // Arrange
        var dice = DiceOne()
        
        // Act
        dice.currentDice = 0
        
        // Assert
        XCTAssertEqual(dice.currentDice, 1, "The 'currentDice' is greater than or equal to 1.")
    }

    func testCurrentDice_Is_Less_Than_Or_Equal_To_Six() throws {
        // Arrange
        var dice = DiceOne()
        
        // Act
        dice.currentDice = 7
        
        // Assert
        XCTAssertEqual(dice.currentDice, 6, "The 'currentDice' is less than or equal to 6.")
    }

    func testPerformance_GetValueFromComputedProperties() throws {
        measure {
            App().getValueFromComputedProperties()
        }
    }

    func testPerformnace_GetValueFromClosures() throws {
        measure {
            App().getValueFromClosures()
        }
    }

}
