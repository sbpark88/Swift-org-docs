import Foundation


//class StepCounter {
//    var totalSteps: Int = 0 {
//        willSet {
//            if newValue > totalSteps {
//                print("About to set totalSteps to \(newValue)")
//            } else {
//                print("Please check your step data")
//                return
//            }
//
//        }
//        didSet {
//            if totalSteps > oldValue  {
//                print("Added \(totalSteps - oldValue) steps, totalStep is now \(totalSteps)")
//            }
//        }
//    }
//}
//
//let stepCounter = StepCounter()
//stepCounter.totalSteps = 200
//print("--------------------------------------")
//stepCounter.totalSteps = 100
//print("--------------------------------------")
//stepCounter.totalSteps = 360


class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            if newValue > totalSteps {
                print("About to set totalSteps to \(newValue)")
            }
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps, totalStep is now \(totalSteps)")
            } else {
                print("Please check your step data")
                totalSteps = oldValue
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
print("--------------------------------------")
stepCounter.totalSteps = 100
print("--------------------------------------")
stepCounter.totalSteps = 360
