import Foundation

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
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
