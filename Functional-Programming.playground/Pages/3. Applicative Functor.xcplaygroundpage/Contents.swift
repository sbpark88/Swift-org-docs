import Foundation

// MARK: Optioanl
enum Maybe<Wrapped> {
    case some(Wrapped)
    case none
}

// MARK: Functor applies a function to a wrapped value
extension Maybe {
    func map<U>(_ transform: (Wrapped) -> U) -> Maybe<U> {
        switch self {
        case .some(let wrappedValue): return .some(transform(wrappedValue))
        case .none: return .none
        }
    }
}

// MARK: Define the function 'apply' that apply wrapped function to a wrapped value.
//extension Maybe {
//    func apply<U>(_ wrappedTransform: Maybe<(Wrapped) -> U>) -> Maybe<U> {
//        switch wrappedTransform {
//        case .some(let transform):
//            switch self {
//            case .some(let wrappedValue): return .some(transform(wrappedValue))
//            case .none: return .none
//            }
//        case .none: return .none
//        }
//    }
//}

// MARK: Refactor the function 'apply' using function 'map'.
// MARK: Applicative applies a wrapped function to a wrapped value.
extension Maybe {
    func apply<U>(_ wrappedTransform: Maybe<(Wrapped) -> U>) -> Maybe<U> {
        switch wrappedTransform {
        case .some(let transform): return self.map(transform)
        case .none: return .none
        }
    }
}

func intToString(_ value: Int) -> String {
    String(value)
}

let foo: Maybe<Int> = .some(10)
let baz: Maybe<Int> = .none

let fnFoo: Maybe<(Int) -> String> = .some(intToString(_:))
let fnBaz: Maybe<(Int) -> String> = .none

let fooPrime = foo.apply(fnFoo)
let bazPrime = baz.apply(fnBaz)
print(fooPrime)     // some("10")
print(bazPrime)     // none
