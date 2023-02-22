import Foundation

protocol Toggleable {
    mutating func toggle()
}

enum OnOffSwitch: Toggleable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off: self = .on
        case .on: self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
print("light switch is \(lightSwitch) now.")

lightSwitch.toggle()
print("light switch is \(lightSwitch) now.")

lightSwitch.toggle()
print("light switch is \(lightSwitch) now.")
