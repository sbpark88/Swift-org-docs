import Foundation

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

0.kind      // zero
1.kind      // positive
(-2).kind   // negative



func printIntegerKinds(_ numbers: Int...) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds(1, 3, 0, -7, 9, 2, 0, -3) // + + 0 - + + 0 -
