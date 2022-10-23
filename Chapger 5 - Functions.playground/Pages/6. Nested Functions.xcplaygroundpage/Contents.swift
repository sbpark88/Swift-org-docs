import Foundation


func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int {
        print(#function)
        return input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        print(#function)
        return input - 1
    }
    
    return backward ? stepBackward(_:) : stepForward(_:)
}


func movingStart(initialValue: Int) {
    var currentValue = initialValue
    let moveNearToZero = chooseStepFunction(backward: currentValue > 0)
    
    print("Conting to zero:")
    while currentValue != 0 {
        print("\(currentValue)... Call ", terminator: "")
        currentValue = moveNearToZero(currentValue)
    }
    print("zero!\n")
}

movingStart(initialValue: 4)
movingStart(initialValue: -3)
